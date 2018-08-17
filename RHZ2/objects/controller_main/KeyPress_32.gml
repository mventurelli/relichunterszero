/// @description Insert description here
// You can write your code in this editor

show_debug_message("aqui");

var tempPlayerInstance;

with(global.playerBaseInstance) {	

	tempPlayerInstance = instance_copy(false);
	tempPlayerInstance.x = 300;//irandom_range(0, room_width);
	tempPlayerInstance.y = 300;//irandom_range(0, room_height);
		
	//set a random anim
	//randAnim = irandom_range(0, anim_player_count-1);
	randAnim = anim_idle_idx;
	//show_debug_message(string(randAnim));
	tempPlayerInstance.sprite_index = spriteAnimations[randAnim];
	object_set_sprite(tempPlayerInstance.sprite_index, spriteAnimations[randAnim]);
	depth = -2000;
}

var tempWeaponInstance;

with(global.weaponBaseInstance) {	

	tempWeaponInstance = instance_copy(false);
	tempWeaponInstance.x = tempPlayerInstance.x + (tempPlayerInstance.sprite_origin_x - tempPlayerInstance.weapon_holder_x);
	tempWeaponInstance.y = tempPlayerInstance.y - (tempPlayerInstance.sprite_origin_y - tempPlayerInstance.weapon_holder_y);
	
	weapon_set_animation_frame("default");
	depth = -5000;
}

/*tempPlayerInstance.weapon_1_instance_id = tempWeaponInstance.instance_id;
show_debug_message(string(tempPlayerInstance.weapon_1_instance_id));
with(instance_id[tempPlayerInstance.weapon_1_instance_id]) {	

	weapon_set_animation_frame("hightlight");
}*/

