/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

///Homing Rockets Launch
var wantToFire = false;
var fireRocket = false;
var fireAngleModifier = 0;

if (rocketTimeCurrent < rocketTime) && (!wantToFire) rocketTimeCurrent += delta_time;
else wantToFire = true;

if (wantToFire) 
{   
    if (rocketFireBurst)
    {
        if (rocketFireBurstRateCurrent >= rocketFireBurstRate)
        {
            rocketFireBurstRateCurrent = 0;
            
            if (rocketFireBurst == 3) fireAngleModifier = 160;
            else if (rocketFireBurst == 2) fireAngleModifier = 180;
            else if (rocketFireBurst == 1) fireAngleModifier = 200;
            
            rocketFireBurst--;
            fireRocket = true;
        }
        else rocketFireBurstRateCurrent += delta_time;
    }
    else
    {
        wantToFire = false;
        rocketTimeCurrent = 0;
        rocketFireBurstRateCurrent = rocketFireBurstRate;
        rocketFireBurst = rocketFireBurstMax;
    }
}

if (fireRocket)
{
    var myRocket = instance_create_layer(x,y,"Interactive",obj_rocket_homing);
    if (my_gun != noone) myRocket.direction = fireAngleModifier + my_gun.shoot_direction;
    owner_add_owned_instance(myRocket);
    myRocket.damage = 160;
	myRocket.faction = f_enemy;
    fireRocket = false;
}