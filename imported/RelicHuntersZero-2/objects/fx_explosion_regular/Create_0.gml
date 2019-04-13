///Main Variables
maxTargets = 5;
currentTargets = 0;

faction = f_player;

radiusStart = 12;
radiusFinal = 122;

radiusAccel = 0.3;
radiusSpeedMax = 8;
radiusSpeed = 0;

radius = radiusStart;

radiusAlpha = 1;
radiusAlphaSpeed = 0.025;

damage = 200;
push_power = 20;

damage_list = ds_list_create();
hit_list = ds_list_create();

image_speed = 0.25;
trigger_frame = 3;
end_frame = 4;
image_speed_unpaused = image_speed;
want_to_pause = false;

screen_shaken = false;

randomize_sprite = irandom_range(1,2);

audio_emitter = audio_emitter_create();
audio_emitter_falloff(audio_emitter, global.falloffMediumDist, global.falloffMediumMax, global.falloffMediumFactor);
audio_emitter_gain(audio_emitter,global.soundVolume);

//audio_play(audio_emitter, false, 99, sfx_grenade_explosion);  <--- Moved to the place I do the screen shake at the Step event

//Test
global.shock_enabled = true;
global.shock_positionX = x;
global.shock_positionY = y;

//Explosion Ground Effect
var randomDecal = irandom(2);
draw_persistent(spr_explosion_ground,randomDecal,x,y,1.5,1.5,0,c_white,1);


