///Activation
event_inherited();

if (global.relic_loaf_of_bread) active = true;
if (global.relic_loaf_of_bread == 2) equipped = true;
else equipped = false;

//Equip/Unequip The Relic
full_relic = true;

if (toggle)
{
    toggle = false;
    
	relic_activate(K_RELIC_LOAF_OF_BREAD);
}

