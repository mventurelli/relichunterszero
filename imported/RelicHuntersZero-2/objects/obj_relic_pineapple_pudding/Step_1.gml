
///Activation
event_inherited();

if (global.gameMode == gamemode_adventure)
{
	if (global.relic_pineapple1) && (global.relic_pineapple2) && (global.relic_pineapple3) && (global.relic_pineapple_pudding == 0)
	{
	    global.relic_pineapple_pudding = 1;
	}
}

if (global.relic_pineapple_pudding) active = true;
if (global.relic_pineapple_pudding == 2) equipped = true;
else equipped = false;

//Equip/Unequip The Relic
full_relic = true;
object = "pineapple";

if (toggle)
{
    toggle = false;
	relic_activate(K_RELIC_PINEAPPLE_PUDDING);
}

