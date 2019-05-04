/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

///Spawn Minions
if (minionSpawnTimeCurrent < minionSpawnTime) minionSpawnTimeCurrent += delta_time * ms_to_s;
else 
{
	if (instance_number(class_enemy) < global.maxSpawns)
	{
		repeat (7)
		{
			var spawnX = x + random_range(-128,128);
	        var spawnY = y + random_range(-128,128);
        
			if collision_circle(spawnX,spawnY,40,class_solid,false,true) < 0 
	        {
	            var myZombieBabyIsSoCute = instance_create_layer(spawnX,spawnY,"Interactive",obj_zombieTurtle);
				myZombieBabyIsSoCute.myCoinDropAmount = 0;
			}
		}
		minionSpawnTimeCurrent = 0;
	}
}