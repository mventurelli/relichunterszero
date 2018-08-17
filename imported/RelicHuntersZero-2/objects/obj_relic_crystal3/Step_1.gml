///Activation
event_inherited();

if (global.relic_crystal3)
{
    active = true;
}

//Destroy if full Relic is unlocked already
if (global.relic_crystal_bacon) instance_destroy();

