///Self-destroy if the player picked up from chest
event_inherited();
if (spawnObject) if (check_weapon_owned(spawnObject,1)) instance_destroy();

