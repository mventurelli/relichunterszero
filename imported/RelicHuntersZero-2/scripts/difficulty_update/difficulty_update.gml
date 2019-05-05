///difficulty_update(bool force)
//Updates the Difficulty in Storm mode over time

var forceUpdate = argument0;

global.difficultyTimeCurrent += delta_time * ms_to_s;

var newDifficulty = global.difficultyTimeCurrent div global.difficultyUpgradeTime;
if (newDifficulty > global.currentDifficulty) || (forceUpdate)
{
	global.currentDifficulty = newDifficulty;
	show_debug_message("Switching to new Difficulty, Tier "+string(global.currentDifficulty));
	
	if instance_exists(obj_skeletonStorm) global.spawnRotation = 3;
	else if instance_exists(obj_kamikingStorm) || instance_exists(obj_kamikingStorm_flying) global.spawnRotation = 2;
	else if instance_exists(obj_turlekStorm) || instance_exists(obj_krekStorm) global.spawnRotation = 0;
	else global.spawnRotation = irandom(3);
	
	global.spawnTime = global.spawnTimeByDifficulty[min(newDifficulty,K_DIFFICULTY_ASCENDANT)];
	global.spawnAmount = global.spawnAmountByDifficulty[min(newDifficulty,K_DIFFICULTY_ASCENDANT)];
	
	global.damageMultiplier = difficulty_get_damage_multiplier();
	global.healthMultiplier = difficulty_get_health_multiplier();
	
	with (data_enemiesStorm) { 
		data_clean_up();
		event_perform(ev_create,0);
	}
	with (data_itemsStorm)  { 
		data_clean_up();	
		event_perform(ev_create,0);
	}
}