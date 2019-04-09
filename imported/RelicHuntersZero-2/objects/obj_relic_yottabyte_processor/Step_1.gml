///Activation
event_inherited();

if (global.relic_yottabyte_processor) active = true;
if (global.relic_yottabyte_processor == 2) equipped = true;
else equipped = false;

//Equip/Unequip The Relic
full_relic = true;
object = "yottabyte_processor";

if (toggle)
{
    toggle = false;
    
	if (global.relic_yottabyte_processor != 2) {
		global.relic_yottabyte_processor = 2;
		audio_play_sound(sfx_relic_on,1,false);
	}
	else {
		global.relic_yottabyte_processor = 1; 
		audio_play_sound(sfx_relic_off,1,false);
    }
}

