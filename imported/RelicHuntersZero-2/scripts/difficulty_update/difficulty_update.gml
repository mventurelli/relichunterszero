///difficulty_update()
//Updates the Difficulty in Storm mode over time

global.difficultyTimeCurrent += delta_time * ms_to_s;

var newDifficulty = global.difficultyTimeCurrent div global.difficultyUpgradeTime;
if (newDifficulty > global.currentDifficulty)
{
	global.currentDifficulty = newDifficulty;
	show_debug_message("Switching to new Difficulty, Tier "+string(global.currentDifficulty));
	
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