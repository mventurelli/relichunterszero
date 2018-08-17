///Activation
event_inherited();
if (global.relic_midnight1) && (global.relic_midnight2) && (global.relic_midnight3) && (global.relic_midnight_beer == 0)
{
    if (global.gameMode == gamemode_adventure) global.relic_midnight_beer = 1;
}

if (global.relic_midnight_beer) active = true;
if (global.relic_midnight_beer == 2) equipped = true;
else equipped = false;


//Equip/Unequip The Relic
full_relic = true;
object = "midnight";

if (toggle)
{
    toggle = false;
    
    if (global.relic_midnight_beer != 2){
        var equip = relic_slot_equip(object);
        if (equip) global.relic_midnight_beer = 2;
        else global.relic_midnight_beer = 1;
    }
    else{
        global.relic_midnight_beer = 1;
        var unequip = relic_slot_free(object);
        if (unequip) audio_play_sound(sfx_relic_off,1,false);
    }
}

