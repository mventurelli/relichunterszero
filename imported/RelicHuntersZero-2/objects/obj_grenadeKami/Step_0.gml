///Conditional Detonation
event_inherited();
if (enemyTrigger) detonationTimeCurrent = detonationTime;

if (goBoom){
    instance_create_layer(x,y,"Interactive",fx_explosionKami); 
    instance_destroy();
}

