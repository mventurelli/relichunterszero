/// @description dynamic depth and scale and death

///Landing
if (flightState == "complete")
{
    var landed = instance_create_layer(x,y,"Interactive",obj_kamikingStorm);
    landed.hp = hp;
	
    instance_destroy();
}
else {
	if (flightState == "go") 
	{
	    depth = layer_get_depth("Interactive_Over");
	}
	else depth = -y;

	if (targetDirection > 90) && (targetDirection < 270) image_xscale = -1;
	else image_xscale = 1;

	image_yscale = 1.25;
}