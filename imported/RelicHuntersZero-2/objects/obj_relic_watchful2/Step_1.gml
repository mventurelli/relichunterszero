///Activation
event_inherited();

if (global.relic_watchful2)
{
    active = true;
}

//Destroy if full Relic is unlocked already
if (global.relic_watchful_eye) instance_destroy();

