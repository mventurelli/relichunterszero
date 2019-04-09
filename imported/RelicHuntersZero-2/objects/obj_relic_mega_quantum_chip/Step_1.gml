///Activation
event_inherited();

if (global.relic_mega_quantum_chip) active = true;
if (global.relic_mega_quantum_chip == 2) equipped = true;
else equipped = false;

//Equip/Unequip The Relic
full_relic = true;
object = "mega_quantum_chip";

if (toggle)
{
    toggle = false;
	
	if (global.relic_mega_quantum_chip != 2) {
		global.relic_mega_quantum_chip = 2;
		audio_play_sound(sfx_relic_on,1,false);
	}
	else {
		global.relic_mega_quantum_chip = 1; 
		audio_play_sound(sfx_relic_off,1,false);
    }
}



