///Activation
event_inherited();
if (global.relic_watchful1) && (global.relic_watchful2) && (global.relic_watchful3) && (global.relic_watchful_eye == 0)
{
    if (global.gameMode == gamemode_adventure) global.relic_watchful_eye = 1;
}

if (global.relic_watchful_eye) active = true;
if (global.relic_watchful_eye == 2) equipped = true;
else equipped = false;


//Equip/Unequip The Relic
full_relic = true;

if (toggle)
{
    toggle = false;
	
	relic_activate(K_RELIC_WATCHFUL_EYE);
	
	

}

