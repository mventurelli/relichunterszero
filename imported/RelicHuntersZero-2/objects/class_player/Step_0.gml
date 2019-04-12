///Relic Buffs, Challenges, Invulnerability, Achievements

//Invulnerable in first room
if (room == room_start) hp = hp_max;

// Relics

if (global.relic_infinity_battery == 2) 
{
    energy_regen_time = energy_regen_time_relic;
    energy_regen_speed = energy_regen_speed_relic;
}
else 
{
    energy_regen_time = energy_regen_time_regular;
    energy_regen_speed = energy_regen_speed_regular;
}


//New Relics - a.k.a. Too lazy to refactor this horrible gamejam code, so why not make it even worse? :sigh: 

if (global.relic_pineapple_pudding == 2) && (!hpPuddingUpdated){
    hp_max += round(hp_max * global.relicHpBonus);
    hpPuddingUpdated = true;
}

if (global.relic_pineapple_pie == 2) && (!hpPieUpdated){
    hp_max += round(hp_max * global.relicHpBonus);
    hpPieUpdated = true;
}

if (global.relic_yottabyte_drive == 2) && (!energyDriveUpdated){
    energy_max += round(energy_max * global.relicEnergyBonus);
    energyDriveUpdated = true;
}

if (global.relic_yottabyte_processor == 2) && (!energyProcessorUpdated){
    energy_max += round(energy_max * global.relicEnergyBonus);
    energyProcessorUpdated = true;
}

//Crystal Bacon on Level End
if (global.relic_crystal_bacon ==2) && (instance_exists(controller_main)){
    if (controller_main.level_end) && (!receivedCrystalBaconHealing){
        hp += min(hp_max*0.2, hp_max-hp);
                
        audio_play(audio_emitter,false,1,sfx_pickup_health);
                
		gui_info_show_at(id, x, y, "Interactive_Over", c_white, loc_key("INFO_HEALTHPLUS"));
        //guiInfo = instance_create_layer(x,y,"Interactive",gui_info);
        //guiInfo.colorMain = c_white;
        //guiInfo.myString = loc_key("INFO_HEALTHPLUS");
        //guiInfo.owner = id;
        
        receivedCrystalBaconHealing = true;
    }
}

//Watchful Eye: See controller_main;
//Midnight Beer and Midnight Meal: See projectile_player and melee_arc
//Dev Potion: See class_gun
//Morning Star: See coin pickup
//The Rabbit Foot: You won't find out what it does here :)

// Challenges
if (global.challengeMedieval) && (!meleeDamageUpdated) {
    melee_damage += round(melee_damage * global.challengeMedievalBonus);
    meleeDamageUpdated = true;
}

if (global.challengeHeavyBurden) && (!staminaChallengeUpdated) {
    stamina_regen -= stamina_regen * global.challengeHeavyBurdenPenalty;
    staminaChallengeUpdated = true;
}

//Achievements
if (global.gameMode == gamemode_endless) {
    if (instance_exists_fast(weapon1)) && (instance_exists_fast(weapon2)){
        if (weapon1.isRelicWeapon) && (weapon2.isRelicWeapon) achievement_give("ACHIEVEMENT_RELICWEAPONS");    
    }
}

var __b__;
__b__ = action_if(global.pause);
if !__b__
{
{
///Movement & Stamina

dodge_direction = -1;

var allowMovement;
if (isDigging) || (animation_current == "dig") allowMovement = false;
else {
    allowMovement = true;
    speed = move_speed;
    direction = move_direction;
}

if (allowMovement)
{
    //Keyboard
    if (global.input[myPlayerId] == K_INPUT_KEYBOARD) && (!dodging) && (!melee_dash) && (!inputLocked)
    {   
        //Movement
        if input_key_left() && !input_key_up() && !input_key_down() { motion_add(180,move_accel*delta_time*ms_to_s_60); dodge_direction = 180; }
        if input_key_right() && !input_key_up() && !input_key_down() { motion_add(0,move_accel*delta_time*ms_to_s_60); dodge_direction = 0; }
        if input_key_up() && !input_key_right() && !input_key_left() { motion_add(90,move_accel*delta_time*ms_to_s_60); dodge_direction = 90; }
        if input_key_down() && !input_key_right() && !input_key_left() { motion_add(270,move_accel*delta_time*ms_to_s_60); dodge_direction = 270; }
        if input_key_left() && input_key_up() { motion_add(135,move_accel*delta_time*ms_to_s_60); dodge_direction = 135; }
        if input_key_left() && input_key_down() { motion_add(225,move_accel*delta_time*ms_to_s_60); dodge_direction = 225; }
        if input_key_right() && input_key_up() { motion_add(45,move_accel*delta_time*ms_to_s_60); dodge_direction = 45; }
        if input_key_right() && input_key_down() { motion_add(315,move_accel*delta_time*ms_to_s_60); dodge_direction = 315; }
        
        //Sprinting
        if (input_key_sprint_toggle()) sprintToggled = true;
        
        if (input_key_sprint() || input_key_sprint_toggle()) && (!melee)
        {
            if (sprinting) && (stamina < sprint_stamina) sprinting = false; 
            else if (stamina >= sprint_stamina_min) sprinting = true;
            if (sprinting) sprintOriginalDirection = direction;
        }
        else if (!sprintToggled) sprinting = false;
        
        if (sprinting) && (sprintToggled)
        {
            if ( abs(angle_difference(direction,sprintOriginalDirection)) > 100) || (speed < 2) || (stamina < sprint_stamina) || (melee)
                sprinting = false;
        }
        
        if (!sprinting) sprintToggled = false;
        
        //Dodge
        if ( input_key_sprint() )
        {
            dashTimeCurrent += delta_time;
        }
        
        double_tap_dodge = false;
        
        if (global.doubleTapDodge)
        {
            if input_key_left_pressed()
            {
                if (dodge_doubletap_direction == 180) && (dodge_doubletap_time_current < dodge_doubletap_time) double_tap_dodge = true;
                else { dodge_doubletap_direction = 180; dodge_doubletap_time_current = 0; } 
            }
            if input_key_right_pressed()
            {
                if (dodge_doubletap_direction == 0) && (dodge_doubletap_time_current < dodge_doubletap_time) double_tap_dodge = true;
                else { dodge_doubletap_direction = 0; dodge_doubletap_time_current = 0; } 
            }
            if input_key_up_pressed()
            {
                if (dodge_doubletap_direction == 90) && (dodge_doubletap_time_current < dodge_doubletap_time) double_tap_dodge = true;
                else { dodge_doubletap_direction = 90; dodge_doubletap_time_current = 0; } 
            }
            if input_key_down_pressed()
            {
                if (dodge_doubletap_direction == 270) && (dodge_doubletap_time_current < dodge_doubletap_time) double_tap_dodge = true;
                else { dodge_doubletap_direction = 270; dodge_doubletap_time_current = 0; } 
            }
            dodge_doubletap_time_current += delta_time;
        }
        
        if ( (input_key_sprint_released() && (dashTimeCurrent <= dashTimeWindow) ) || (double_tap_dodge) ) && (!melee)
        {
            if (stamina >= dodge_stamina)
            {
                stamina -= dodge_stamina;
                dodging = true;
                speed = dodge_speed;
                if (dodge_direction == -1)
                {
                    dodge_direction = 180 + point_direction(x,y,global.crosshairX[myPlayerId],global.crosshairY[myPlayerId]);
                }
                if (!double_tap_dodge) direction = dodge_direction;
                else direction = dodge_doubletap_direction;
                
                audio_play(audio_emitter,false,1,sfx_dash1,sfx_dash2,sfx_dash3);
				
				if (global.relic_rabbit_ears == 2)
				{
					var spawnAngle = point_direction(x,y,global.crosshairX[myPlayerId],global.crosshairY[myPlayerId]);
					spawnAngle-=20;
					repeat (4)
					{
						var child = instance_create_layer(x,y,"Interactive",obj_rocket_homing);
				        child.immortalTimer = 50000;
				        child.image_xscale = 0.5;
				        child.image_yscale = 0.5;
        
				        child.faction = f_player;
						var calculateDamage = 80;
				       
						if (global.relic_midnight_beer == 2) calculateDamage += round(calculateDamage*global.midnightDamageMultiplier ); //Midnight Beer
				        if (global.relic_midnight_meal == 2) calculateDamage += round(calculateDamage*global.midnightDamageMultiplier ); //Midnight Meal
				        if (global.relic_black_cat == 2) if (random(1) <= 0.25) calculateDamage += calculateDamage;
						
						child.damage = calculateDamage;
						
						child.speed_per_second = 8;
						child.maxSpeed = 16;
        
				        child.curveRatio = 6;
				        child.curveRatioDecay = 0.016;
        
				        child.direction = spawnAngle;
				        spawnAngle += 10;
					}
				}
            }
            else{
                //Low Stamina Feedback
				gui_info_show_at(id, x, y, "Interactive_Over", K_BETU_RED, loc_key("INFO_LOWSTAMINA"));
                //guiInfo = instance_create_layer(x,y,"Interactive",gui_info);
                //guiInfo.colorMain = K_BETU_RED;
                //guiInfo.myString = loc_key("INFO_LOWSTAMINA");
                //guiInfo.owner = id;

                audio_play(audio_emitter, false, 1, sfx_pickup_full);
            }
        }
        
        if ( input_key_sprint_released() ) dashTimeCurrent = 0;
        
        //Aiming
        if input_key_aim() && (!sprinting) && (!melee) aiming = true;
        else aiming = false;
    }
    
    //////////////////////////////////////////////////////////////
    //Joystick
    if global.input[myPlayerId] != K_INPUT_KEYBOARD && (!dodging) && (!melee_dash) && (!inputLocked)
    {
        var joy = global.input[myPlayerId];
        
        //Movement
        if (joy_simple_deadzone( joy_xpos(joy), joy_ypos(joy), joyMoveDeadzoneMin))
        {
            var joy_direction = point_direction(x,y,(x+joy_xpos(joy)),(y+joy_ypos(joy)));
            motion_add(joy_direction, move_accel*delta_time*ms_to_s_60);
            dodge_direction = joy_direction;
        }
        
        //Sprinting
        if (joy_check(joy,9) || joy_check(joy,1)) && (!melee)
        {
            if (sprinting) && (stamina < sprint_stamina) sprinting = false; 
            else if (stamina >= sprint_stamina_min) sprinting = true;
            if (sprinting) sprintOriginalDirection = direction;
        }
        else if (!global.sprint_toggle) sprinting = false;
        
        if (sprinting) && (global.sprint_toggle)
        {
            if ( abs(angle_difference(direction,sprintOriginalDirection)) > 100) || (speed < 2) || (stamina < sprint_stamina) || (melee)
                sprinting = false;
        }
        
        //Dodging
        if joy_check(joy,1)
        {
            dashTimeCurrent += delta_time;
        }
        
        if joy_check_released(joy,1)
        {
            if (dashTimeCurrent <= dashTimeWindow) && (!melee)
            {
                if (stamina >= dodge_stamina)
                {
                    sprinting = false;
                    stamina -= dodge_stamina;
                    dodging = true;
                    speed = dodge_speed;
                    
                    if (dodge_direction == -1)
                    {
                        dodge_direction = 180 + point_direction(x,y,global.crosshairX[myPlayerId],global.crosshairY[myPlayerId]);
                    }
                    
                    direction = dodge_direction;
                    audio_play(audio_emitter,false,1,sfx_dash1,sfx_dash2,sfx_dash3);
                }
                else{
                    //Low Stamina Feedback
					gui_info_show_at(id, x, y, "Interactive_Over", K_BETU_RED, loc_key("INFO_LOWSTAMINA"));
                    //guiInfo = instance_create_layer(x,y,"Interactive",gui_info);
                    //guiInfo.colorMain = K_BETU_RED;
                    //guiInfo.myString = loc_key("INFO_LOWSTAMINA");
                    //guiInfo.owner = id;
                    audio_play(audio_emitter, false, 1, sfx_pickup_full);
                }
            }
            dashTimeCurrent = 0; 
        }
        
        //Aiming
        if (joy_zpos(joy) > 0.7) && (!melee)
        {  
            sprinting = false;
            aiming = true;
        }
        else aiming = false;
    }
    
    ////////////////////////////////////////////////////////////////////////////////////////////
    ////////////////////////////////////////////////////////////////////////////////////////////
    
    //Look Direction
    if (!melee_dash)
    {
        var direction_check = (global.crosshairX[myPlayerId] - x);
        if (direction_check > 0) look_direction = 1;
        else look_direction = 0;
    }
    
    
    //Melee Step
    if (melee) && (animation_current = "melee") &&(animation_index = melee_hit_frame)
    {
        speed = melee_step_speed;
        if (instance_exists_fast(myGun)) if (myGun.isMeleeWeapon) speed = myGun.meleeStepSpeed;
        direction = point_direction(x,y,global.crosshairX[myPlayerId],global.crosshairY[myPlayerId]);
        melee_dash = true;
        
        if (direction <= 90) || (direction > 270) look_direction = 1;
        else look_direction = 0; 
    }
    
	//Friction
    if (!dodging) motion_add(direction-180,min(speed,(move_friction*delta_time*ms_to_s_60)));
    else motion_add(direction-180,min(speed,(dodgeFriction*delta_time*ms_to_s_60)));
    
    //Resolve Movement
    var totalSpeedVector = 1;
    if (global.input[myPlayerId] != K_INPUT_KEYBOARD)
    {
        var myJoy = global.input[myPlayerId];
        var currentThumbstick = joy_radial_vector( joy_xpos(myJoy), joy_ypos(myJoy));
        {
            if (currentThumbstick > joyMoveDeadzoneMin) && (currentThumbstick < joyMoveDeadZoneMax) totalSpeedVector = joyMoveSlowSpeed;
        }
    }
    
    var maxSpeedAiming = move_speed_aiming*totalSpeedVector;
    var maxSpeed = move_speed_max*totalSpeedVector;
    var maxSpeedSprint = move_speed_sprint*totalSpeedVector;
    
    if speed > maxSpeedAiming && (aiming) speed -= min(move_accel,speed-maxSpeedAiming) *delta_time*ms_to_s_60;
    if speed > maxSpeed && (!sprinting) speed -= min(move_accel,speed-maxSpeed) *delta_time*ms_to_s_60;
    if speed > maxSpeedSprint && (sprinting) speed -= min(move_accel,speed-maxSpeedSprint) *delta_time*ms_to_s_60;
	
	
	//Melee Cancel
    if (melee_dash) && (speed == 0) melee_dash = false;
}

//Resolve Everything
move_speed = speed;
move_direction = direction;
speed = 0;
direction = 0;
    
if (move_speed)
{
    move_step_ext(x + lengthdir_x(move_speed*delta_time*ms_to_s_60, move_direction),y + lengthdir_y(move_speed*delta_time*ms_to_s_60, move_direction),0,class_solid,0,0,0,0,0,0); 
}
else sprinting = false;


// Reset Dodge
if (dodging)
{
    dodge_time += delta_time;
    if dodge_time >= dodge_duration
    {
        dodge_time = 0;
        dodging = false;
    }
}

// Stamina Management
if (sprinting) stamina -= sprint_stamina;
if stamina < 0 stamina = 0;

if (!sprinting) && (!dodging) && (!melee) && (!throw) && !((myGun == obj_buckler)&&(inputShield)) 
{
	var staminaMultiplier = 1;
	if (global.relic_alcoholic_carrot == 2) staminaMultiplier++;
	if (global.relic_actual_carrot == 2) staminaMultiplier++;
	stamina += stamina_regen*staminaMultiplier*delta_time*ms_to_s_60;
}
if stamina > stamina_max stamina = stamina_max;

// Stop Aiming When Reloading
global.check_weapon_reloading = false;

if (myGun) && (instance_exists_fast(myGun)) with(myGun)
{
    if (reloading) global.check_weapon_reloading = true;
}
if (global.check_weapon_reloading) aiming = false;

///Animation


// Look Direction
if !sprinting
{
    if look_direction == 0 image_xscale = -1;
    if look_direction == 1 image_xscale = 1;
}
else
{
    if (move_direction > 90 && move_direction <= 270) image_xscale = -1;
    else image_xscale = 1;
}

//Hit Taken
if (hit_taken)
{
    energy_regen_time_current = 0;
    
    if (shield)
    {
        shield_effect = instance_create_layer(x,y,"Interactive",fx_shield);
		owner_add_owned_instance(shield_effect);
        //shield_effect.owner = id;
		
        hit_taken = false;
        if (superShield) shield_effect.sprite_index = spr_supershield;
        if (global.input[myPlayerId] != K_INPUT_KEYBOARD) joy_rumble(global.input[myPlayerId],1,1);
    }
    else
    {
        animation_play("hit",0.2,an_clamp,10,3);
        hit_taken = false;
        audio_play(audio_emitter,false,1,sfx_impact_flesh1,sfx_impact_flesh2,sfx_impact_flesh3,sfx_impact_flesh4);
        if (global.input[myPlayerId] != K_INPUT_KEYBOARD) joy_rumble(global.input[myPlayerId],4,4);
    }
}

//Melee and Grenade Throw
if ((melee) || (throw)) animation_play("melee",0.25,an_clamp_forever,99,7+2);


//Move & Idle
if (move_speed)
{
    if (sprinting) 
    {
        if (animation_current != "sprint")
        {
            mySprintFx = instance_create_layer(x,y,"Interactive",fx_sprint); 
            mySprintFx.image_xscale = image_xscale;
            audio_play_exclusive(audio_emitter,false,1,sfx_sprint);
        }
        animation_play("sprint",0.2,an_loop,1,6);
    }
    else if (dodging) animation_play("dash",0.2,an_loop,1,6);
    else if (aiming) animation_play("walk",0.2,an_loop,1,6);
    else animation_play("walk",0.2,an_loop,1,6);
}
else animation_play("idle",0.2,an_loop,1,12);

//Footsteps
var playFootstepSound = false;

if (animation_current == "walk") || (animation_current == "sprint")
{
    footStepTimeCurrent += delta_time;
    if (footStepTimeCurrent >= footStepTime)
    {
        playFootstepSound = true;
        footStepTimeCurrent = 0;
    }
}
else footStepTimeCurrent = 0;

if (playFootstepSound) audio_play(audio_emitter,false,1,sfx_walk1,sfx_walk2,sfx_walk3,sfx_walk4,sfx_walk5);

// Resolve
depth = -y;
animation_update_player();



///Melee Attack + Biu's Shield

var input_melee = false;
var input_meleeWeapon = false;

if (global.input[myPlayerId] == K_INPUT_KEYBOARD)
{
    if input_key_melee_pressed()
    {
        input_melee = true;
    }
    
    if input_key_fire_pressed()
    {
        input_meleeWeapon = true;
    }
    
    if input_key_fire()
    {
        inputShield = true; // Biu's Shield
    }
    else inputShield = false;
}
else
{
    var joy = global.input[myPlayerId];
    
    if joy_check_pressed(joy,2)
    {
        input_melee = true;
    }
    
    if (joy_rpos(joy) > 0.7)
    {
        input_meleeWeapon = true;
        inputShield = true;
    }
    else inputShield = false;
}

if (instance_exists_fast(myGun)){
    if (!melee) && (!throw)
    {
        if (input_melee) || ( myGun.isMeleeWeapon && input_meleeWeapon )
        {
            melee = true;   
            if (myGun.isMeleeWeapon)
            {
                audio_play(audio_emitter,false,1,myGun.swingSound1,myGun.swingSound2,myGun.swingSound3,myGun.swingSound4,myGun.swingSound5,myGun.swingSound6,myGun.swingSound7);
            }
            else audio_play(audio_emitter,false,1,sfx_melee);
        }
    }
    
    if (melee) && (animation_current == "melee")
    {
        if (animation_index = melee_hit_frame)
        {
            meleeArc = instance_create_layer(x,y,"Interactive",fx_melee_arc);
            owner_add_owned_instance(meleeArc);
            meleeArc.damage = melee_damage;
            
            meleeArc.push_power = melee_push_power;
            stamina -= melee_stamina_cost;
            if stamina < 0 stamina = 0;
            
            if (myGun.isMeleeWeapon) 
            {
                meleeArc.damage = myGun.damage;
                meleeArc.max_hits = myGun.maxHits;  
                meleeArc.push_power = myGun.pushPower;
                meleeArc.sprite_index = myGun.meleeArcSprite;
            }  
        }
    
        if (animation_index >= (animation_frames-1))
        {
            melee = false;
            animation_priority = 0;
        }
    }
}

//Rider's Dash attack
    
if (myChar == char_rider) && (!instance_exists_fast(riderDodgeAttack)) {
    if (dodging) {
        if (!riderDodgeAttack){
            riderDodgeAttack = instance_create_layer(x,y,"Interactive",fx_melee_arc);
            owner_add_owned_instance(riderDodgeAttack);
            riderDodgeAttack.damage = melee_damage;  
            riderDodgeAttack.push_power = melee_push_power;
            riderDodgeAttack.max_hits = 1;
            audio_play(audio_emitter,false,1,sfx_kami_dash);
        }
    }
    else riderDodgeAttack = noone;
}


///Grenade Throw

var grenade_input = false;

if (global.input[myPlayerId] == K_INPUT_KEYBOARD)
{
    if input_key_grenade_pressed()
    {
        grenade_input = true;
    }
}
else
{
    var joy = global.input[myPlayerId];
    
    if (joy_check_pressed(joy,5))
    {
        grenade_input = true;
    }
}


if ( (grenade_input) && (!melee) && (!throw) )
{
        if (global.grenades[myPlayerId])
        {
            throw = true;
            audio_play(audio_emitter,false,1,sfx_melee);
        }
        else if (myChar != char_rider) || (hp <= riderGrenadeCost){
            //Out of greandes feedback
            guiInfo = instance_create_layer(x,y,"Interactive",gui_info);
            guiInfo.colorMain = K_BETU_RED;
            guiInfo.myString = loc_key("INFO_OUTOFGRENADES");
            owner_add_owned_instance(guiInfo);
            audio_play(audio_emitter, false, 1, sfx_pickup_full);
        }
        else{
            hp -= riderGrenadeCost;
            throw = true;
            audio_play(audio_emitter,false,1,sfx_melee);
            //bloodAmount = min(5, (global.max_casings-global.count_casings));
            //if (bloodAmount) repeat(bloodAmount) blood = instance_create_layer(x,y,"Interactive",fx_blood);
            bloodAmount = 5;
            if (bloodAmount) repeat(bloodAmount) 
			{
				blood = get_object_from_pool(blood_pool);
				if (instance_exists_fast(blood)) reset_blood_instance(blood, x, y, "Interactive");
			}
			
            hit_taken = true;
            var spreadX = irandom_range(-15,15);
            var spreadY = irandom_range(-15,15);
            damage_fx = instance_create_layer(x+spreadX,y+spreadY,"Interactive_Over",fx_damage);
            damage_fx.damage = riderGrenadeCost;
        }
}


if (throw) && (animation_current == "melee")
{
    if (animation_index = melee_hit_frame)
    {
        global.grenades[myPlayerId]--;
    
        myGrenade = instance_create_layer(x,y,"Interactive",myGrenadeObject);
        myGrenade.speed_per_second = grenade_speed;
        myGrenade.direction = point_direction(x,y,global.crosshairX[myPlayerId],global.crosshairY[myPlayerId]);

        if (global.relic_midnight_beer == 2) myGrenade.damage += round(myGrenade.damage*global.midnightDamageMultiplier ); //Midnight Beer
        if (global.relic_midnight_meal == 2) myGrenade.damage += round(myGrenade.damage*global.midnightDamageMultiplier ); //Midnight Meal
        if (global.relic_black_cat == 2) if (random(1) <= 0.25) myGrenade.damage += myGrenade.damage;
		if (instance_exists_fast(myGun)) myGrenade.damage += round((myGrenade.damage * myGun.weaponLevel)/3); //Weapon Level
    }

    if (animation_index >= (animation_frames-1))
    {
        throw = false;
        animation_priority = 0;
    }
}

///Weapon Switch

var switch_input = false;

if (weapon2 != noone)
{
    if (global.input[myPlayerId] == K_INPUT_KEYBOARD)
    {
        if ( input_key_switch_pressed() ) || ( global.allowMouseWheel && (mouse_wheel_up() || mouse_wheel_down()) )
        {
            switch_input = true;
        }
    }
    else
    {
        var joy = global.input[myPlayerId];
        
        if (joy_check_pressed(joy,4))
        {
            switch_input = true;
        }
    }
}


if (switch_input)
{
    //Stop reloading sound
    if (audio_is_playing(sfx_reload_loop1)) audio_stop_sound(sfx_reload_loop1);
    if (audio_is_playing(sfx_reload_loop2)) audio_stop_sound(sfx_reload_loop2);
    if (audio_is_playing(sfx_reload_loop3)) audio_stop_sound(sfx_reload_loop3);
    
    //Switch
    if myGun == weapon1 
    {
        draw_gun(weapon2);
        audio_play(audio_emitter,false,1,sfx_weapon_switch);
        exit;
    }
    if myGun == weapon2
    {
        draw_gun(weapon1);
        audio_play(audio_emitter,false,1,sfx_weapon_switch);
        exit;
    }
}

if (instance_exists_fast(weapon2)) && (!instance_exists_fast(weapon1))
{
    weapon1 = weapon2;
    weapon2 = noone;
    draw_gun(weapon1);
}

///Health, Shield, Death

//Health
if (hp >= hp_max) hp = hp_max;

//Shield
if energy < (energy_max+overshield)
{
    energy_regen_time_current += delta_time;
    if energy_regen_time_current >= energy_regen_time
    {
        if (!energy) energy = 1;
        shield = true;
        energy += energy_regen_speed;
        if (energy > (energy_max+overshield)) energy = energy_max+overshield;
    }
    if energy_regen_time_current = energy_regen_time
    {
        myRecharge = instance_create_layer(x,y,"Interactive",fx_shield_up);  
        audio_play(audio_emitter,false,1,sfx_shield_regen_start);
        owner_add_owned_instance(myRecharge);
    }
    
    if (energy < 0) energy = 0;
}

if (!energy) && (shield == true) && (energy_max)
{
    if (overshield)
    {
        overshield = 0;
        guiInfo = instance_create_layer(x,y,"Interactive",gui_info);
        guiInfo.colorMain = K_BETU_RED;
        guiInfo.myString = loc_key("INFO_SHIELDLOST");
        owner_add_owned_instance(guiInfo);
    }
    
    myShieldEffect = instance_create_layer(x,y,"Interactive",fx_shield_explosion);
    owner_add_owned_instance(myShieldEffect);
    mySparks = instance_create_layer(x,y,"Interactive",fx_shield_down);
    owner_add_owned_instance(mySparks);
    shield = false;
    
    if (global.challengeOvercharge) hp -= global.challengeOverchargeDamage;
}

if (!energy_max) shield = false;

if (superShield){
    energy = energy_max+overshield;
    shield = true;

    if (!instance_exists_fast(mySuperShieldFx)) {
        mySuperShieldFx = instance_create_layer(x,y,"Interactive",fx_superShield);
        owner_add_owned_instance(mySuperShieldFx);
        audio_play(audio_emitter,false,9,sfx_shield_regen_start);
    }
    
    if (superShieldTimeCurrent < superShieldTime) superShieldTimeCurrent += delta_time;
    else{
        superShieldTimeCurrent = 0;
        superShieldTime = 0;
        superShield = false;
        if (instance_exists_fast(mySuperShieldFx)) with (mySuperShieldFx){instance_destroy();}
        instance_create_layer(x,y,"Interactive",fx_explosion_shield);
    }   
}

///Interaction and Reload

if (!instance_exists(active_interaction))
{
    active_interaction = noone;
}

interactionKey = false;
reloadKey = false;

if (global.input[myPlayerId] == K_INPUT_KEYBOARD)
{
    if ( input_key_use_pressed() ) interactionKey = true;
    if ( input_key_reload_pressed() ) reloadKey = true;
}
else
{   
    var joy = global.input[myPlayerId];
    
    if joy_check_released(joy,3) && (pickupTimeCurrent < pickupTimeWindow)
    {
        reloadKey = true;
        if (global.relicDetected) interactionKey = true;//Hack 
    }
    
    if joy_check(joy,3) 
    {
        if (allowPickup) {
			pickupTimeCurrent += delta_time;
		}
    }
    else 
    {
        if (pickupTimeCurrent) {
			pickupTimeCurrent -= delta_time;
		}
        allowPickup = true;
    }
    
    if (pickupTimeCurrent >= pickupTimeWindow) && (allowPickup)
    {
        interactionKey = true;
        allowPickup = false;
    }
}

///Draw dynamic ammo bars when you press the reload key
if (reloadKey)
{
    if (instance_exists(global.dynamicAmmo1))
    {
        if (myPlayerId == 1) { global.dynamicAmmo1.timedActive = true; global.dynamicAmmo1.activeTimeCurrent = 0; }
        else if (myPlayerId == 2) { global.dynamicAmmo2.timedActive = true; global.dynamicAmmo2.activeTimeCurrent = 0; }
    }
}

///Check for nearby interactive objects, activate if key is pressed
if (instance_exists(class_interactive_master))
{
    ds_priority_clear(myPickupList);
    var countPickups = instance_number(class_interactive_master);
    for (var i=0; i<countPickups; i++)
    {
        var pickupCurrent = instance_find(class_interactive_master,i);
        if (instance_exists(pickupCurrent))
        {
            var pickupDist = point_distance(x,y,pickupCurrent.x,pickupCurrent.y);
            if (pickupDist <= pickupCurrent.range) && (pickupCurrent.isInteractiveObjectActive) {
				ds_priority_add(myPickupList, pickupCurrent, pickupDist);
			}				
        }
    }
    
    var myPickupInRange = noone;
    if (!ds_priority_empty(myPickupList)) {
		myPickupInRange = ds_priority_find_min(myPickupList);
	}
    
    if (instance_exists(myPickupInRange))
    {
        if (myPickupInRange.isClientLocked == false) {
			owner_add_activated_instance(myPickupInRange);
		}
        
        if (interactionKey) 
        {
            myPickupInRange.wantToActivate = true;
            myPickupInRange.isClientLocked = true;
        }
    }
}

///Audio
audio_emitter_position(audio_emitter, x, y, 0);

if (play_sound_pickup_weapon)
{
    play_sound_pickup_weapon = false;
    audio_play(audio_emitter,false,1,sfx_pickup_weapon);
}

///Digging

if (global.relicDetected) 
{
    if instance_exists(obj_digSpot) && (interactionKey) && (digRateCurrent >= digRate) 
    {
        var digStartDistance = 90;
    
        animation_play("dig",0.15,an_clamp,99,3+2);
        audio_play_exclusive(audio_emitter,false,9,sfx_shovel1,sfx_shovel2,sfx_shovel3);
        add_screen_shake(9,0,true);
        
        myDirtColor = global.dirtColor;
        
        repeat(irandom_range(3,8)) instance_create_layer(x,y,"Interactive",fx_digDirt);
        digRateCurrent = 0;
    
        if (!isDigging)
        {
            var dist = point_distance(x,y,obj_digSpot.x,obj_digSpot.y);
            if (dist <= digStartDistance)
            {
                isDigging = true;
                
                audio_play_sound(sfx_relic_on,00,false); //Dig Spot Found Sound Will Go Here Someday
                
                if instance_exists(fx_bigMessage) with (fx_bigMessage) instance_destroy();
                var announceRelic = instance_create_layer(x,y,"GUI",fx_bigMessage);
                announceRelic.textBig = loc_key("HUD_RELIC_FOUND");
                if (global.input[1] == K_INPUT_KEYBOARD) announceRelic.textSmall = loc_key("HUD_RELIC_FOUND_KEY");
                else announceRelic.textSmall = loc_key("HUD_RELIC_FOUND_JOY");
            }
            else instance_create_layer(x,y,"Interactive",fx_detector);
        }
        else
        {
            digDepth = obj_digSpot.digDepth;
            digDepth += digSpeed;
            obj_digSpot.digDepth = digDepth;
            repeat(irandom_range(1,2)) instance_create_layer(x,y,"Interactive",obj_pickup_coin);
        }
    }
}
else isDigging = false;

if (digRateCurrent < digRate) {
	digRateCurrent += delta_time;
}

if (isDigging)
{
    if digDepth >= digDepthMax
    {
        isDigging = false;
        digDepth = 0;
        digRateCurrent = digRate;
        
        //Feedback "Relic Unlocked goes here"
        
        draw_persistent(spr_digPile,2,x,y,1,1,0,myDirtColor,1);
        
        with (obj_digSpot) activate = true;
        global.relicDetected = false;
    }
}

}
}