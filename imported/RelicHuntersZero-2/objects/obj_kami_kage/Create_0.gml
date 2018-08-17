event_inherited();

audio_emitter = 0; //prevent error on cage destroyed by chance
cage_chance = irandom_range(0,3);
if (cage_chance != 0)
{	
    instance_create_layer(x,y+95,"Interactive",obj_longbox);
    instance_destroy();
}

depth = -y -10;

image_speed = 0.2;

shake = 0;
shake_direction = 0;
shake_recovery = 0.2;
shake_max = 12;

maxhp = 250;
hp = maxhp;
hp_medium = maxhp * 0.66;
hp_low = maxhp * 0.33;
damage = 0;

drawX = x;
drawY = y;

hit_taken = false;
hit_taken_time = 0;

shadow_object_setup(0,-1,-1,global.default_shadow_yscale);

//Audio
audio_emitter = audio_emitter_create();
audio_emitter_falloff(audio_emitter, global.falloffMinorDist, global.falloffMinorMax, global.falloffMinorFactor );
audio_emitter_position(audio_emitter, x, y, 0);
audio_emitter_gain(audio_emitter,global.soundVolume);

impactSound1 = sfx_debris1;
impactSound2 = sfx_debris2;
impactSound3 = sfx_debris3;
