///STEP Override

shadow_object_setup(0,sprite,0,global.default_shadow_yscale);

//Animation
if (isVulnerable) && (activationPhase == 0)
{
    activationPhase = 1;
    sprite_index = spr_generatorActivation;
    image_index = 0;
    image_speed = 0.2;
}

if (isVulnerable) && (activationPhase == 2)
{
    sprite = spr_generator;
    image_speed = 0.2;
}

if (!isVulnerable)
{
    sprite_index = spr_generatorOff;
    image_speed = 0;
}


//Shake
if (shake)
    {
        if shake > shake_max shake = shake_max;
         
        drawX = x+lengthdir_x(shake,shake_direction);
        drawY = y+lengthdir_y(shake,shake_direction);
        
        shake -= shake_recovery;
        shake_direction = irandom(359);
        
        if shake < 0 shake = 0;
    }
    
//Hit Taken
if (hit_taken)
{
    if (isVulnerable) sprite_index = sprite_hit;
    hit_taken_time++;
    if hit_taken_time >= 5
    {
        hit_taken_time = 0;
        hit_taken = false;
    }
    
    if (hasImpactSound)
    {
        audio_play_exclusive(audio_emitter,false,1,impactSound1,impactSound2,impactSound3);
    }
}
else sprite_index = sprite;
    
//Damage
/*
if (hp > maxhp*0.66) damage = 0;

if (hp <= maxhp*0.66) && (hp > maxhp*0.33)
{
    if damage == 0
    {
        myDirt = instance_create_layer(x,y,"Interactive",fx_dirt);
        myDirt.sprite_index = sprite_dirt;
    }
    damage = 1;
}

if (hp <= maxhp*0.33)
{
    if damage == 1
    {
        myDirt = instance_create_layer(x,y,"Interactive",fx_dirt);
        myDirt.sprite_index = sprite_dirt;
    }
    damage = 2;
}
*/

if (hp < 0)
{
    audio_play_exclusive(audio_emitter,false,1,sfx_debris1,sfx_debris2,sfx_debris3);
    
    instance_destroy();
}



/* */
/*  */
