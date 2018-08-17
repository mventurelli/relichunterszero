var __b__;
__b__ = action_if(global.pause);
if !__b__
{
{
///Shyness & Animation

//Check Shy
shy = false;
if (instance_exists_fast(ai_target)){
    if (point_distance(x,y,ai_target.x,ai_target.y) <= shyMaxDistance){
        if (look_direction == 0){
            if (ai_target.look_direction == 1) shy = true;
        }
            
        if (look_direction == 1){
            if (ai_target.look_direction == 0) shy = true;
        }
    }
}

//Animate
if (!shy) 
{
    if (shyTrigger) && (!instance_exists_fast(activationFX)){
        activationFX = instance_create_layer(x,y,"Interactive",fx_activation);
        owner_add_owned_instance(activationFX);
    }
    shyTrigger = false;
    
    if (moving) sprite_index = sprite_walk;
    else sprite_index = sprite_idle;
        
    image_speed = 0.2;
}
else if (!shyTrigger){
    sprite_index = sprite_shy;
    image_index = 0;
    image_speed = 0.2;
    shyTrigger = true;
}

if (look_direction == 1) image_xscale = 1;
else image_xscale = -1;


//Teleport If Shy For Too Long
if (shy)
{
    if (teleportTimeCurrent >= teleportTime)
    {   
        teleportTimeCurrent = 0;
        
        if (instance_exists(obj_spawn_topLeft)) && (instance_exists(obj_spawn_botRight)){
            var validPosition = false;
            var teleportX, teleportY;
            
            while (!validPosition){
                teleportX = irandom_range( obj_spawn_topLeft.x , obj_spawn_botRight.x );
                teleportY = irandom_range( obj_spawn_topLeft.y , obj_spawn_botRight.y );
                if (!collision_circle(teleportX,teleportY,42,obj_limit,false,true)) validPosition = true;
            }
            
            x = teleportX;
            y = teleportY;
        }
    }
    else if (image_speed == 0) teleportTimeCurrent += delta_time;
}

///AI & Movement

//Setup
ai_movetarget_x = -1;
ai_movetarget_y = -1;
distance_to_target = distance_far;
current_distance = 0;
move_speed = speed_walk;

var myClosestPlayer = noone;
distance_to_player = distance_to_closest_player_fast(x,y);;

//Activate AI
if (!ai_active)
{
    if (distance_to_player < ai_activation_range) && (!want_to_activate)
    {
		myClosestPlayer = instance_nearest(x,y,faction_player);
		if (myClosestPlayer != noone) distance_to_player = point_distance(x,y,myClosestPlayer.x,myClosestPlayer.y); 

        if collision_line(x,y,myClosestPlayer.x,myClosestPlayer.y,obj_limit,false,true) < 0
        {
            want_to_activate = true;
        }
    }
    
    if (want_to_activate)
    {
        ai_active = true;
        activationFX = instance_create_layer(x,y,"Interactive",fx_activation);
        owner_add_owned_instance(activationFX);
    }
}

//Resolve AI
if (ai_active) && ( (distance_to_player < ai_shutdown_range) || (on_screen(x,y)) )
{
	if (myClosestPlayer == noone) {
		myClosestPlayer = instance_nearest(x,y,faction_player);
		if (myClosestPlayer != noone) distance_to_player = point_distance(x,y,myClosestPlayer.x,myClosestPlayer.y); 
	}
	
	if (myClosestPlayer != noone) {
		distance_to_target = distance_to_player;
		ai_target = myClosestPlayer;
	}
    
    if instance_exists_fast(ai_target)
    {
        //Aggro Control
        ai_state = "CHASE";
        
        //State Descriptions
        if ai_state == "CHASE"
        {
            if (damage_timer_current >= damage_timer) && (!shy)
            {
                ai_movetarget_x = ai_target.x;
                ai_movetarget_y = ai_target.y;
            }
            else
            {
                ai_movetarget_x = x;
                ai_movetarget_y = y;
            }
        }
    }
    
    //Resolve
    if (point_distance(x,y,ai_movetarget_x,ai_movetarget_y) > 3) {
        move_towards_point(ai_movetarget_x,ai_movetarget_y,speed_walk);
        moving = true;
    }
    else {
        move_towards_point(x,y,0);
        moving = false;
    }
}


//Look Direction
if instance_exists_fast(ai_target)
{
    if (ai_target.x > x) look_direction = 1;   
    else look_direction = 0;
}
else {
	ai_target= noone;
}

///Damage

myEnemy = noone;
myEnemy = collision_ellipse(bbox_left,bbox_top,bbox_right,bbox_bottom,faction_player,false,true);
if (myEnemy != noone) && (damage_timer_current >= damage_timer)// && instance_exists(myEnemy)
{
    if (!myEnemy.dodging)
    {
        var originalDamage = damage;
        
        damage_timer_current = 0;
        
        if (myEnemy.energy)
        {
            if (myEnemy.superShield) damage = 0;
            
            if (global.challengeSupressor) damage = damage*2;
            myEnemy.energy -= damage*2;
            
            
            if (myEnemy.energy <= 0) audio_play(myEnemy.audio_emitter,false,1,sfx_shield_destroy);
            else audio_play(myEnemy.audio_emitter,false,1,sfx_shield_hit1,sfx_shield_hit2);
        }
        else myEnemy.hp -= damage;
        
        myEnemy.hit_taken = true;
        
        spreadX = irandom_range(-15,15);
        spreadY = irandom_range(-15,15);
        damage_fx = instance_create_layer(myEnemy.x+spreadX,myEnemy.y+spreadY,"Interactive_Over",fx_damage);
        damage_fx.damage = damage;
        
        
        audio_play(audio_emitter,false,1,sfx_kami_bite);
        
        damage = originalDamage;
    }
}
else damage_timer_current += delta_time;

//Self-destroy on level exit

var wantToDie = false;

if instance_exists(controller_main){
    if (controller_main.level_end) wantToDie = true;
}
else wantToDie = true;

if (wantToDie){
    audio_emitter_free(audio_emitter);
    instance_destroy();
}

///Audio
audio_emitter_position(audio_emitter, x, y, 0);

}
}
