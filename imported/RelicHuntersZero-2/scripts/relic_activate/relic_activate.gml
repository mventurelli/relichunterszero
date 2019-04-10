///relic_activate(RELIC_ID)
//Activates or deactivates the given Relic correctly

var relicId = argument0;

if ds_exists(global.relicList,ds_type_list)
{
	var listCheck = ds_list_find_index(global.relicList,relicId);
	if (listCheck == -1) 											//Activate Relic
	{
		ds_list_add(global.relicList,relicId);
		audio_play_sound(sfx_relic_on,1,false);
		switch (relicId)
		{
			case K_RELIC_ALCOHOLIC_CARROT : global.relic_alcoholic_carrot = 2; break;	
			case K_RELIC_CRYSTAL_BACON : global.relic_crystal_bacon = 2; break;	
			case K_RELIC_DEV_POTION : global.relic_dev_potion = 2; break;
			case K_RELIC_INFINITY_BATTERY : global.relic_infinity_battery = 2; break;
			case K_RELIC_MEGA_QUANTUM_CHIP : global.relic_mega_quantum_chip = 2; break;
			case K_RELIC_MIDNIGHT_BEER : global.relic_midnight_beer = 2; break;
			case K_RELIC_MIDNIGHT_MEAL : global.relic_midnight_meal = 2; break;
			case K_RELIC_MORNING_STAR : global.relic_morning_star = 2; break;
			case K_RELIC_PINEAPPLE_PIE : global.relic_pineapple_pie = 2; break;
			case K_RELIC_PINEAPPLE_PUDDING : global.relic_pineapple_pudding = 2; break;
			case K_RELIC_RABBIT_FOOT : global.relic_rabbit_foot = 2; break;
			case K_RELIC_WATCHFUL_EYE : global.relic_watchful_eye = 2; break;
			case K_RELIC_YOTTABYTE_DRIVE : global.relic_yottabyte_drive = 2; break;
			case K_RELIC_YOTTABYTE_PROCESSOR : global.relic_yottabyte_processor = 2; break;
		}
	}
	else															//Deactivate Relic
	{
		ds_list_delete(global.relicList,listCheck);
		audio_play_sound(sfx_relic_off,1,false);
		switch (relicId)
		{
			case K_RELIC_ALCOHOLIC_CARROT : global.relic_alcoholic_carrot = 1; break;	
			case K_RELIC_CRYSTAL_BACON : global.relic_crystal_bacon = 1; break;	
			case K_RELIC_DEV_POTION : global.relic_dev_potion = 1; break;
			case K_RELIC_INFINITY_BATTERY : global.relic_infinity_battery = 1; break;
			case K_RELIC_MEGA_QUANTUM_CHIP : global.relic_mega_quantum_chip = 1; break;
			case K_RELIC_MIDNIGHT_BEER : global.relic_midnight_beer = 1; break;
			case K_RELIC_MIDNIGHT_MEAL : global.relic_midnight_meal = 1; break;
			case K_RELIC_MORNING_STAR : global.relic_morning_star = 1; break;
			case K_RELIC_PINEAPPLE_PIE : global.relic_pineapple_pie = 1; break;
			case K_RELIC_PINEAPPLE_PUDDING : global.relic_pineapple_pudding = 1; break;
			case K_RELIC_RABBIT_FOOT : global.relic_rabbit_foot = 1; break;
			case K_RELIC_WATCHFUL_EYE : global.relic_watchful_eye = 1; break;
			case K_RELIC_YOTTABYTE_DRIVE : global.relic_yottabyte_drive = 1; break;
			case K_RELIC_YOTTABYTE_PROCESSOR : global.relic_yottabyte_processor = 1; break;
		}
	}
}
else show_debug_message("ERROR: relic_activate() failed to find global.relicList!");

relic_refresh();