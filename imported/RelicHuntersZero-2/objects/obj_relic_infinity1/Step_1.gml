///Activation
event_inherited();

if (global.relic_infinity1)
{
    active = true;
}

//Destroy if full Relic is unlocked already
if (global.relic_infinity_battery) instance_destroy();

