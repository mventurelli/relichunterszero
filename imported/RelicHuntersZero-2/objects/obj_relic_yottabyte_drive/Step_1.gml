///Activation
event_inherited();
if (global.relic_yottabyte1) && (global.relic_yottabyte2) && (global.relic_yottabyte3) && (global.relic_yottabyte_drive == 0)
{
    if (global.gameMode == gamemode_adventure) global.relic_yottabyte_drive = 1;
}

if (global.relic_yottabyte_drive) active = true;
if (global.relic_yottabyte_drive == 2) equipped = true;
else equipped = false;

//Equip/Unequip The Relic
full_relic = true;
object = "yottabyte";

if (toggle)
{
    toggle = false;
    
    if (global.relic_yottabyte_drive != 2){
        var equip = relic_slot_equip(object);
        if (equip) global.relic_yottabyte_drive = 2;
        else global.relic_yottabyte_drive = 1;
    }
    else{
        global.relic_yottabyte_drive = 1;
        var unequip = relic_slot_free(object);
        if (unequip) audio_play_sound(sfx_relic_off,1,false);
    }
}

