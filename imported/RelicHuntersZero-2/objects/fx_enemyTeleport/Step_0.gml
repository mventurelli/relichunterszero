/// @description Insert description here
// You can write your code in this editor

teleportTimeCurrent += delta_time * ms_to_s;

if (teleportTimeCurrent >= teleportTime)
{
	var agent = instance_create_layer(x,y,"Interactive",enemy);
	agent.ai_activation_range = 3000;
	agent.ai_shutdown_range = 3000;
	instance_destroy();
}