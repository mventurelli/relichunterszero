///Main Variables

radiusStart = 12;
radiusFinal = 122;

radiusAccel = 0.3;
radiusSpeedMax = 8;
radiusSpeed = 0;

radius = radiusStart;

radiusAlpha = 1;
radiusAlphaSpeed = 0.025;

damage = 100;
push_power = 32;

damage_list = ds_list_create();
hit_list = ds_list_create();


image_speed_unpaused = image_speed;
want_to_pause = false;

screen_shaken = false;


audio_emitter = audio_emitter_create();
audio_emitter_falloff(audio_emitter, global.falloffMediumDist, global.falloffMediumMax, global.falloffMediumFactor);
audio_emitter_gain(audio_emitter,global.soundVolume);

audio_play(audio_emitter, false, 99, sfx_shield_destroy);

//Test
global.shock_enabled = true;
global.shock_positionX = x;
global.shock_positionY = y;


