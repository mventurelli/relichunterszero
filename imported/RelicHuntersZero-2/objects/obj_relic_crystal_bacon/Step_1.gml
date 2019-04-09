///Activation
event_inherited();
if (global.relic_crystal1) && (global.relic_crystal2) && (global.relic_crystal3) && (global.relic_crystal_bacon == 0)
{
    if (global.gameMode == gamemode_adventure) global.relic_crystal_bacon = 1;
}

if (global.relic_crystal_bacon) active = true;
if (global.relic_crystal_bacon == 2) equipped = true;
else equipped = false;

//Equip/Unequip The Relic
full_relic = true;
object = "crystal";

if (toggle)
{
    toggle = false;
	
	if (global.relic_crystal_bacon != 2) {
		global.relic_crystal_bacon = 2;
		audio_play_sound(sfx_relic_on,1,false);
	}
	else {
		global.relic_crystal_bacon = 1; 
		audio_play_sound(sfx_relic_off,1,false);
    }
	
}

