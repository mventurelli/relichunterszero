///get_object_from_pool(pool_index)
//see macros, create_object_pool, init_object_pools
var pool_index = argument0;
if (global.pool_size[pool_index] <= 0) 
{
	return noone;
}

//fix, some users experience errors with invalid indexes here
var pool_at = global.pool_at[pool_index]++;
if (pool_at < 0 || pool_at > global.pool_size[pool_index]) 
{
	global.pool_at[pool_index] = 0;
}
else 
{
	global.pool_at[pool_index] = global.pool_at[pool_index] mod global.pool_size[pool_index];
}

var instance = global.pool[pool_index, pool_at];

//instance.visible = true;
instance_activate_object(instance);

return instance;