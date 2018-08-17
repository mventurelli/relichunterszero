/// @description Insert description here
// You can write your code in this editor
if (!active) {
	//depth = layer_get_depth(layer_get_id("Dynamics"));
	layer_add_instance(layer_get_id("Dynamics"), id);
	//instance_deactivate_object(id);
	instance_deactivate_layer(layer_get_id("Dynamics"));
}