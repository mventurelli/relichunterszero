///Revive

event_inherited();

if (reviveTimeCurrent >= reviveTime) && (!speed) && (!image_speed)   {
    myRevive = instance_create_layer(x,y,"Interactive",fx_reviveZombie);
    myRevive.image_xscale = image_xscale;
	myRevive.myCoinDropAmount = 0;
    instance_destroy();
}
else reviveTimeCurrent += delta_time;

