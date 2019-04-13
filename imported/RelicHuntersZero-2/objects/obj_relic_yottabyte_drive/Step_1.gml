///Activation
event_inherited();
if (global.relic_yottabyte1) && (global.relic_yottabyte2) && (global.relic_yottabyte3) && (global.relic_yottabyte_drive == 0)
{
    if (global.gameMode == gamemode_adventure) global.relic_yottabyte_drive = 1;
}

if (global.relic_yottabyte_drive) active = true;
if (global.relic_yottabyte_drive == 2) equipped = true;
else equipped = false;

//Equip/Unequip The Relic
full_relic = true;

if (toggle)
{
    toggle = false;
	
	relic_activate(K_RELIC_YOTTABYTE_DRIVE);

}

