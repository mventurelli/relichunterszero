///Activation
event_inherited();
if (global.relic_midnight1) && (global.relic_midnight2) && (global.relic_midnight3) && (global.relic_midnight_beer == 0)
{
    if (global.gameMode == gamemode_adventure) global.relic_midnight_beer = 1;
}

if (global.relic_midnight_beer) active = true;
if (global.relic_midnight_beer == 2) equipped = true;
else equipped = false;


//Equip/Unequip The Relic
full_relic = true;
object = "midnight";

if (toggle)
{
    toggle = false;
    

	relic_activate(K_RELIC_MIDNIGHT_BEER);
}

