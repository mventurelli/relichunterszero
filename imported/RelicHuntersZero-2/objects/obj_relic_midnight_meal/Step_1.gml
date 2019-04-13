///Activation
event_inherited();

if (global.relic_midnight_meal) active = true;
if (global.relic_midnight_meal == 2) equipped = true;
else equipped = false;

//Equip/Unequip The Relic
full_relic = true;

if (toggle)
{
    toggle = false;
    relic_activate(K_RELIC_MIDNIGHT_MEAL);
}

