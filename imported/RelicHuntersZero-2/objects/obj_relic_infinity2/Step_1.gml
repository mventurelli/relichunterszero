///Activation
event_inherited();

if (global.relic_infinity2)
{
    active = true;
}

//Destroy if full Relic is unlocked already
if (global.relic_infinity_battery) instance_destroy();

