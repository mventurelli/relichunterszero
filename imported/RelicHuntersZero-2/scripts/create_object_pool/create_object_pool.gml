///create_object_pool(pool_index, object, count, layer) 
//see macros
pool_index = argument0;
object = argument1;
elements = argument2;
layer_name = argument3;

for (var i = 0; i < elements; i += 1) 
{
	var instance = instance_create_layer(1000,1300,layer_get_id(layer_name),object);
	//instance.active = false;
	instance.visible = false;
	instance_deactivate_object(instance.id);
	global.pool[pool_index, i] = instance;
}
