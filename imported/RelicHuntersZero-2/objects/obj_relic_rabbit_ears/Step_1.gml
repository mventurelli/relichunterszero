///Activation
event_inherited();

if (global.relic_rabbit_ears) active = true;
if (global.relic_rabbit_ears == 2) equipped = true;
else equipped = false;

//Equip/Unequip The Relic
full_relic = true;

if (toggle)
{
    toggle = false;
    
	relic_activate(K_RELIC_RABBIT_EARS);
}

