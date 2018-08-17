if (global.gui_stage != noone) {
	with (global.gui_stage) {

		if !((room == room_start) || (room == room_tutorial) || (room == room_boss)) {
	
			if (room == level1_1) sprite_index = spr_stage1_1;
			else if (room == level1_2) sprite_index = spr_stage1_2;
			else if (room == level1_3) sprite_index = spr_stage1_3;

			else if (room == level2_1) sprite_index = spr_stage2_1;
			else if (room == level2_2) sprite_index = spr_stage2_2;
			else if (room == level2_3) sprite_index = spr_stage2_3;

			else if (room == level3_1) sprite_index = spr_stage3_1;
			else if (room == level3_2) sprite_index = spr_stage3_2;
			else if (room == level3_3) sprite_index = spr_stage3_3;

			else if (room == level4_1) sprite_index = spr_stage4_1;
			else if (room == level4_2) sprite_index = spr_stage4_2;
			else if (room == level4_3) sprite_index = spr_stage4_3;

			else if (room == levelHalloween_1) sprite_index = spr_stageSpooky_1;
			else if (room == levelHalloween_2) sprite_index = spr_stageSpooky_2;
			else if (room == levelHalloween_3) sprite_index = spr_stageSpooky_3;

			else if (room == room_shop) || (room == room_endShop) sprite_index = spr_stage_shop;
	
			visible = true;
		}
	}	
}