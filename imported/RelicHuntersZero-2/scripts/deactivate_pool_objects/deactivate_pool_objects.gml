var pool_index = argument0;
if (global.pool_size[pool_index] <= 0) 
{
	return;
}

for (var i = 0; i < global.pool_size[pool_index]; i += 1) 
{
	var instance = global.pool[pool_index, i];
	if (instance.visible == false) {
		instance_deactivate_object(instance.id);
	}	
}