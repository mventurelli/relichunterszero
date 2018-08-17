///Main Shit
owner = noone;
myGun = noone;
damage = 0;
precisionDamage = 0;
range = 0;
decay = 0;
type = 0;
push_power = 0;
faction = f_player;
distance_travelled = 0;
bloodAmount = 0;

allowPrecision = true;
piercing = 0;

bounce = false;
bounceMax = 1;
bounceCurrent = 0;

isBouncing = false;
bounceTime = 100000;//room_speed*0.1;
bounceTimeCurrent = 0;

goesThroughWalls = false;

myAlpha = 1;
fade = 0.2;

speed_reset = false;
old_speed = 0;
speed_per_second = 0;
maxSpeed = 0;

image_speed = 1;

damage_list = ds_list_create();
hit = noone;

reflection_object_setup(30,-1,image_index);

//Sound
audio_emitter = audio_emitter_create();
audio_emitter_falloff(audio_emitter, global.falloffMediumDist, global.falloffMediumMax, global.falloffMediumFactor);
audio_emitter_gain(audio_emitter,global.soundVolume);

playLoop = false;
playLoopSound = -1;

ammo_type = type_light;

scheduled_to_destroy = false;
