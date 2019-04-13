///Activation
event_inherited();

if (global.relic_morning_star) active = true;
if (global.relic_morning_star == 2) equipped = true;
else equipped = false;

//Equip/Unequip The Relic
full_relic = true;

if (toggle)
{
    toggle = false;

	relic_activate(K_RELIC_MORNING_STAR);
}



