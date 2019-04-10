///Activation
event_inherited();

if (global.relic_pineapple_pie) active = true;
if (global.relic_pineapple_pie == 2) equipped = true;
else equipped = false;

//Equip/Unequip The Relic
full_relic = true;
object = "pineapple_pie";

if (toggle)
{
    toggle = false;
    
	relic_activate(K_RELIC_PINEAPPLE_PIE);
}

