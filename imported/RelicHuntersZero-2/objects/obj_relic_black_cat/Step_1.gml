///Activation
event_inherited();

if (global.relic_black_cat) active = true;
if (global.relic_black_cat == 2) equipped = true;
else equipped = false;

//Equip/Unequip The Relic
full_relic = true;

if (toggle)
{
    toggle = false;
    
	relic_activate(K_RELIC_BLACK_CAT);
}

