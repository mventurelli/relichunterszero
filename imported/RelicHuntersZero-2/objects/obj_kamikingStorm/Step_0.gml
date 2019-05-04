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
	            var myKamiBabyIsSoCute = instance_create_layer(spawnX,spawnY,"Interactive",obj_kamikaze1);
				myKamiBabyIsSoCute.myCoinDropAmount = 0;
			}
		}
		minionSpawnTimeCurrent = 0;
	}
	wantToFly = true;
}


if (wantToFly)
{
	if (instance_exists(class_player))
	{
		var playerTarget = instance_nearest(x,y,class_player);
		var fly_target_x = playerTarget.x + (irandom_range(-300,300));
		var fly_target_y = playerTarget.y + (irandom_range(-300,300));
		
		if collision_circle(fly_target_x,fly_target_y,96,class_solid,false,true) < 0 
		{
			var iAmFlying = instance_create_layer(x,y,"Interactive",obj_kamikingStorm_flying);
			iAmFlying.targetX = fly_target_x;
			iAmFlying.targetY = fly_target_y;
			iAmFlying.hp = hp;
			instance_destroy();
		}	
	}	
}