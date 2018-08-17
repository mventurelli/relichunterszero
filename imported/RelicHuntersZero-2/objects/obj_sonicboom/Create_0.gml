///Main Shit
owner = noone;
damage = 0;
range = 0;
decay = 0;
type = 0;
push_power = 0;
faction = f_player;
distance_travelled = 0;

allowPrecision = false;

piercing = 0;

myAlpha = 1;
fade = 0.2;

speed_reset = false;
old_speed = 0;
speed_per_second = 0;
maxSpeed = 0;

image_speed = 0.2;

damage_list = ds_list_create();
hit = noone;

isPrecise = false;

reflection_object_setup(30,-1,image_index);

//Sound
audio_emitter = audio_emitter_create();
audio_emitter_falloff(audio_emitter, global.falloffMediumDist, global.falloffMediumMax, global.falloffMediumFactor);
audio_emitter_gain(audio_emitter,global.soundVolume);

