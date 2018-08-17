event_inherited();

///Main Variables
reflection_object_setup(0,-1,image_index);
shadow_object_setup(0,-1,-1,global.default_shadow_yscale);
audio_emitter = 0;

image_speed = 0;

hitDirection = 0;
shake = 0;
shake_direction = 0;
shake_recovery = 0.35;
shake_max = 9;

maxhp = 999999;
hp = maxhp;
hp_medium = maxhp;
hp_low = maxhp;
damage = 0;

drawX = x;
drawY = y;

sprite = spr_longbox;
sprite_hit = spr_longbox_hit;
sprite_dirt = spr_longbox_dirt;

hit_taken = false;
hit_taken_time = 0;

//Audio
hasImpactSound= false;
impactSound1 = sfx_debris1;
impactSound2 = sfx_debris2;
impactSound3 = sfx_debris3;

audio_emitter = audio_emitter_create();
audio_emitter_falloff(audio_emitter, global.falloffMinorDist, global.falloffMinorMax, global.falloffMinorFactor );
audio_emitter_position(audio_emitter, x, y, 0);
audio_emitter_gain(audio_emitter,global.soundVolume);

