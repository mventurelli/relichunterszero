///spawn_storm_boss(x, y, don't repeat, force spawns of same type);

var posX = argument0;
var posY = argument1;
var dontRepeat = argument2;
var forceSpawnOfType = argument3;

var boss = instance_create_layer(posX,posY,"Interactive",fx_enemyTeleport);
				
var bossList = ds_list_create();

if (!global.bossTurlekSpawned) || (!dontRepeat) ds_list_add(bossList,obj_turlekStorm);
if (!global.bossKamikingSpawned) || (!dontRepeat) ds_list_add(bossList,obj_kamikingStorm);
if (!global.bossKrekSpawned) || (!dontRepeat) ds_list_add(bossList,obj_krekStorm);
if (!global.bossSkeletonSpawned) || (!dontRepeat) ds_list_add(bossList,obj_skeletonStorm);

var randomBoss = irandom(ds_list_size(bossList)-1);
var chosenBoss = ds_list_find_value(bossList,randomBoss);
boss.enemy = chosenBoss;
ds_list_destroy(bossList);

if (forceSpawnOfType)
{
	if (chosenBoss == obj_turlekStorm) { global.spawnRotation = 0; global.bossTurlekSpawned = true; }
	else if (chosenBoss == obj_krekStorm)  { global.spawnRotation = 1; global.bossKrekSpawned = true; }
	else if (chosenBoss == obj_kamikingStorm)  { global.spawnRotation = 2; global.bossKamikingSpawned = true; }
	else if (chosenBoss == obj_skeletonStorm) {  global.spawnRotation = 3; global.bossSkeletonSpawned = true; }
				
	with (data_enemiesStorm) { 
		data_clean_up();
		event_perform(ev_create,0);
	}
	with (data_itemsStorm)  { 
		data_clean_up();	
		event_perform(ev_create,0);
	}
}