///Activation
event_inherited();

if (global.relic_pineapple_pie) active = true;
if (global.relic_pineapple_pie == 2) equipped = true;
else equipped = false;

//Equip/Unequip The Relic
full_relic = true;
object = "pineapple_pie";

if (toggle)
{
    toggle = false;
    
	
	if (global.relic_pineapple_pie != 2) {
		global.relic_pineapple_pie = 2;
		audio_play_sound(sfx_relic_on,1,false);
	}
	else {
		global.relic_pineapple_pie = 1; 
		audio_play_sound(sfx_relic_off,1,false);
    }
}

