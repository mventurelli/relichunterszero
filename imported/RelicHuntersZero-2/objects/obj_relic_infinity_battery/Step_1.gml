///Activation
event_inherited();
if (global.relic_infinity1) && (global.relic_infinity2) && (global.relic_infinity3) && (global.relic_infinity_battery == 0)
{
   if (global.gameMode == gamemode_adventure)  global.relic_infinity_battery = 1;
}

if (global.relic_infinity_battery) active = true;
if (global.relic_infinity_battery == 2) equipped = true;
else equipped = false;

//Equip/Unequip The Relic
full_relic = true;
object = "infinity";

if (toggle)
{
    toggle = false;
    

		if (global.relic_infinity_battery != 2) {
		global.relic_infinity_battery = 2;
		audio_play_sound(sfx_relic_on,1,false);
	}
	else {
		global.relic_infinity_battery = 1; 
		audio_play_sound(sfx_relic_off,1,false);
    }
}

