///Activation
event_inherited();

if (global.relic_morning_star) active = true;
if (global.relic_morning_star == 2) equipped = true;
else equipped = false;

//Equip/Unequip The Relic
full_relic = true;
object = "morning_star";

if (toggle)
{
    toggle = false;

	if (global.relic_morning_star != 2) {
		global.relic_morning_star = 2;
		audio_play_sound(sfx_relic_on,1,false);
	}
	else {
		global.relic_morning_star = 1; 
		audio_play_sound(sfx_relic_off,1,false);
    }

}



