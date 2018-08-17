///Activation
event_inherited();

if (global.relic_alcoholic1)
{
    active = true;
}

//Destroy if full Relic is unlocked already
if (global.relic_alcoholic_carrot) instance_destroy();

