///Activation
event_inherited();
if (global.gameMode == gamemode_adventure) 
{
	if (global.relic_alcoholic1) && (global.relic_alcoholic2) && (global.relic_alcoholic3) && (global.relic_alcoholic_carrot == 0)
	{
	    global.relic_alcoholic_carrot = 1;
	}
}

if (global.relic_alcoholic_carrot) active = true;
if (global.relic_alcoholic_carrot == 2) equipped = true;
else equipped = false;

//Equip/Unequip The Relic
full_relic = true;
object = "alcoholic";

if (toggle)
{
    toggle = false;
	
	relic_activate(K_RELIC_ALCOHOLIC_CARROT);
}

