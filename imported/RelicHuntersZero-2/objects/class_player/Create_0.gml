///Setup
event_inherited();

myPlayerId = 1;
playerName = "NONAME";
myChar = char_jimmy;

setup_initial = false;
interactionKey = false;
reloadKey = false;

myDynamicBar = instance_create_layer(x,y,"Interactive_Over",gui_dynamicBar);
//myDynamicBar.owner = id;
owner_add_owned_instance(myDynamicBar);

isVulnerable = false;
alarm[0] = room_speed*2;

energy_max = 100;
energy = energy_max;
overshield = 0;
superShield = false;

hp_max = 100;
hp = hp_max;

//hp_regen_time = room_speed*1;
//hp_regen_time_current = 0;
//hp_regen_amount = 2;

stamina_max = 100;
stamina = stamina_max;

base_accuracy = 1;

accPistol = 1;
accMachinegun = 1;
accShotgun = 1;
accSniper = 1;
accSmg = 1;
accRocket = 1;
accRifle = 1;
accKeytar = 1;
accFlame = 1;

stamina_regen = 0.32;

dodge_stamina = 50;
sprint_stamina = 0.2;
sprint_stamina_min = 10;

move_speed_max = 5.5; //4.5
move_speed_sprint = 7.5; //6
move_speed_aiming = 3; //3

move_accel = 1.5;
move_friction = 0.45; //0.4

dodge_speed = 35;
dodge_duration = 400000;//room_speed*0.4;
dodge_time = 0;
dodgeFriction = 0.2;
dodge_doubletap_time = 200000;//room_speed*0.2;
dodge_doubletap_time_current = dodge_doubletap_time;
dodge_doubletap_direction = 0;

myGrenadeObject = obj_grenadeNew;
grenade_speed = 7;

dashTimeWindow = 250000;//room_speed*0.25;
dashTimeCurrent = 0;

pickupTimeWindow = 350000;//room_speed*0.35;
pickupTimeCurrent = 0;
allowPickup = false;

moving = false;
sprinting = false;
sprintToggled = false;
dodging = false;
aiming = false;
move_direction = 0;
move_speed = 0;
look_direction = 1;

active_interaction = noone;

// Instantiate Guns
myGun = noone;

weapon1 = noone;
weapon2 = noone;

reloadBarObj = instance_create_depth(x,y,self.depth+2,gui_reload_bar);
owner_add_owned_instance(reloadBarObj);

// Animation
animation_priority = 0;
animation_index = 0;
animation_current = "noone";
footStepTime = 200000;//((room_speed*0.2) * 1);
footStepTimeCurrent = 0;
animation_play("idle",0.2,an_loop,1,1);
image_speed = 0;

// Pickups
myPickupList = ds_priority_create();

// Power Ups
//serendipity = false;
//serendipity_duration = 10000000;//room_speed*10;
//serendipity_duration_current = 0;

//Hit Taken
hit_taken = false;

//Shield
shield = true;

energy_regen_time = 2500000;//room_speed*2.5;
energy_regen_time_regular = energy_regen_time;
energy_regen_time_relic = energy_regen_time;
energy_regen_time_current = energy_regen_time;
energy_regen_speed = 0.25;
energy_regen_speed_regular = energy_regen_speed;
energy_regen_speed_relic = energy_regen_speed*4;

shield_fading = false;
shield_alpha = 0;
shield_alpha_speed = 0;
shield_alpha_accel = 0.2;
shield_alpha_speed_max = 2;

superShieldTime = 0;
superShieldTimeCurrent = 0;
mySuperShieldFx = noone;

//Biu's Shield
inputShield = false;

//Dash
myDash = instance_create_depth(x,y,self.depth+3,fx_player_dash);
owner_add_owned_instance(myDash);

//Melee
meleeDamageUpdated = false;
melee_damage = 100;
melee_push_power = 8;

melee = false;
melee_dash = false;
melee_image_speed = 0.2;
melee_hit_frame = 5;
melee_step_speed = 18;
melee_stamina_cost = 0;

melee_damage_gloves = 160;
melee_push_power_gloves = 12;
melee_step_speed_gloves = 20;

throw = false;

//Sprites
sprite_idle = spr_jimmy_idle;
sprite_walk = spr_jimmy_walk;
sprite_sprint = spr_jimmy_walk;
sprite_dash = spr_jimmy_walk;
sprite_hit = spr_jimmy_walk;
sprite_death = spr_jimmy_walk;
sprite_melee = spr_jimmy_walk;
sprite_dash_fx = spr_jimmy_walk;
sprite_dig = spr_jimmy_dig;

reflection_object_setup(0,-1,image_index);
shadow_object_setup(0,-1,-1,global.default_shadow_yscale);

//Sound

audio_emitter = audio_emitter_create();
audio_falloff_set_model(audio_falloff_linear_distance);
audio_emitter_falloff(audio_emitter, global.falloffMainDist, global.falloffMainMax, global.falloffMainFactor);
audio_emitter_gain(audio_emitter,global.soundVolume);

play_sound_pickup_weapon = false;
if (room != room_start) audio_play(audio_emitter, false, 1, sfx_teleport);


//Digging
isDigging = false;
digDepth = 0;
digSpeed = 4;
digDepthMax = 42;
digRate = 300000;//room_speed*0.3;
digRateCurrent = digRate;

//Global Input Lock on Game Enter + Unpause
inputLocked = true;
inputLockTime = 250000;//room_speed*0.25;
inputLockTimeCurrent = 0;

//Joystick
joyLookDirection = 0;
joyLookTargetAngle = 0;
joyAimLocked = false;
targetEnemy = noone;

joyMoveDeadzoneMin = 0.3;
joyMoveDeadZoneMax = 0.65;
joyMoveSlowSpeed = 0.5;

joyAutoAimSpeedIn = 0.75;
joyAutoAimSpeedOut = 0.6;
joyAutoAimAdjustment = 0;

joyAutoAimSnapAngle = 5;

joyIsRightStickAiming = false;
joyAimStickVector = 0;

joyCrosshairDistance = 0;
joyCrosshairDistanceTarget = 0;
joyCrosshairDistanceSpeed = 30;
joyCrosshairDistanceMin = 40;

joyCrosshairSpeed = 64;

//Relics and Challenges
//staminaChallengeUpdated = false;
//staminaRelicUpdated = false;
energyRegenUpdated = false;

hpPuddingUpdated = false;
hpPieUpdated = false;
energyDriveUpdated = false;
energyProcessorUpdated = false;

//Special Character Stuff
riderGrenadeCost = 0;
riderDodgeAttack = noone;
