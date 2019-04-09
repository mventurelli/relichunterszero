///Activation
event_inherited();
if (global.relic_dev1) && (global.relic_dev2) && (global.relic_dev3) && (global.relic_dev_potion == 0)
{
    if (global.gameMode == gamemode_adventure) global.relic_dev_potion = 1;
}

if (global.relic_dev_potion) active = true;
if (global.relic_dev_potion == 2) equipped = true;
else equipped = false;


//Equip/Unequip The Relic
full_relic = true;
object = "dev";

if (toggle)
{
    toggle = false;
    
	
	if (global.relic_dev_potion != 2) {
		global.relic_dev_potion = 2;
		audio_play_sound(sfx_relic_on,1,false);
	}
	else {
		global.relic_dev_potion = 1; 
		audio_play_sound(sfx_relic_off,1,false);
    }

}

