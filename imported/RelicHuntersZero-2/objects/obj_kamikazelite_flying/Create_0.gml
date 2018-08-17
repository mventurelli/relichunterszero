///Main Variables

targetX = -1;
targetY = -1;

ai_target = noone;

flightState = "up";
hp = 0;

flightSpeed = 0;
flightSpeedMax = 4;
flightAccel = 0.5;
flightFriction = 0.25;

verticalSpeed = 0;
verticalSpeedMax = 3;
verticalAccel = 0.3;
verticalFriction = 0.25;
targetHeight = 120;

targetDistance = point_distance(x,y,targetX,targetY);
targetDirection = point_direction(x,y,targetX,targetY);
landingDistance = 70;

myHeight = 0;

image_xscale = 1.25;
image_yscale = 1.25;

//Animation & Visuals
image_speed = 0.2;

reflection_object_setup(0,-1,image_index);

shadow_object_setup(myHeight,-1,-1,global.default_shadow_yscale);

//Audio
audio_emitter = audio_emitter_create();
audio_emitter_falloff(audio_emitter, global.falloffMinorDist, global.falloffMinorMax, global.falloffMinorFactor );
audio_emitter_gain(audio_emitter,global.soundVolume);

audio_play(audio_emitter, true, 1, sfx_kami_fly);



