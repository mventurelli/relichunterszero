///Activation
event_inherited();
if (global.relic_alcoholic1) && (global.relic_alcoholic2) && (global.relic_alcoholic3) && (global.relic_alcoholic_carrot == 0)
{
    if (global.gameMode == gamemode_adventure) global.relic_alcoholic_carrot = 1;
}

if (global.relic_alcoholic_carrot) active = true;
if (global.relic_alcoholic_carrot == 2) equipped = true;
else equipped = false;

//Equip/Unequip The Relic
full_relic = true;
object = "alcoholic";

if (toggle)
{
    toggle = false;

	
	if (global.relic_alcoholic_carrot != 2) {
		global.relic_alcoholic_carrot = 2;
		audio_play_sound(sfx_relic_on,1,false);
	}
	else {
		global.relic_alcoholic_carrot = 1; 
		audio_play_sound(sfx_relic_off,1,false);
    }
}

