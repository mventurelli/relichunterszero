///Activation
event_inherited();

if (global.relic_midnight_meal) active = true;
if (global.relic_midnight_meal == 2) equipped = true;
else equipped = false;

//Equip/Unequip The Relic
full_relic = true;
object = "midnight_meal";

if (toggle)
{
    toggle = false;
    
	
	if (global.relic_midnight_meal != 2) {
		global.relic_midnight_meal = 2;
		audio_play_sound(sfx_relic_on,1,false);
	}
	else {
		global.relic_midnight_meal = 1; 
		audio_play_sound(sfx_relic_off,1,false);
    }
}

