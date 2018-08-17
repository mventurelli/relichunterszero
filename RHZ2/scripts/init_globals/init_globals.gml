/// @description Global variables that are needed throughout the game are initialized here

	/*
	Called at Bootstrap
	*/

//new random generator seed
randomize();
	
global.collisionGrid = noone;

global.player_common_anim_names = [
anim_dash, 
anim_diging, 
anim_dmg, 
anim_dying, 
anim_holograma, 
anim_idle, 
anim_meleeatk, 
anim_sprint, 
anim_teleport00,
anim_teleport01,
anim_walk,
anim_ui_choose_character
];

global.player_common_anim_frames = [
anim_frames_dash,
anim_frames_diging,
anim_frames_dmg,
anim_frames_dying,
anim_frames_holograma,
anim_frames_idle,
anim_frames_meleeatk,
anim_frames_sprint,
anim_frames_teleport00,
anim_frames_teleport01,
anim_frames_walk,
anim_frames_ui_choose_character
];

global.weapon_ammo_types = [
ammo_type_light,
ammo_type_medium,
ammo_type_heavy
];