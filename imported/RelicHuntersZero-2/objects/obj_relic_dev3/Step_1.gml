///Activation
event_inherited();

if (global.relic_dev3)
{
    active = true;
}

//Destroy if full Relic is unlocked already
if (global.relic_dev_potion) instance_destroy();

