///Activation
event_inherited();
if (global.relic_watchful1) && (global.relic_watchful2) && (global.relic_watchful3) && (global.relic_watchful_eye == 0)
{
    if (global.gameMode == gamemode_adventure) global.relic_watchful_eye = 1;
}

if (global.relic_watchful_eye) active = true;
if (global.relic_watchful_eye == 2) equipped = true;
else equipped = false;


//Equip/Unequip The Relic
full_relic = true;
object = "watchful";

if (toggle)
{
    toggle = false;
    
    if (global.relic_watchful_eye != 2){
        var equip = relic_slot_equip(object);
        if (equip) global.relic_watchful_eye = 2;
        else global.relic_watchful_eye = 1;
    }
    else{
        global.relic_watchful_eye = 1;
        var unequip = relic_slot_free(object);
        if (unequip) audio_play_sound(sfx_relic_off,1,false);
    }
}

