///Activation
event_inherited();
if (global.relic_infinity1) && (global.relic_infinity2) && (global.relic_infinity3) && (global.relic_infinity_battery == 0)
{
   if (global.gameMode == gamemode_adventure)  global.relic_infinity_battery = 1;
}

if (global.relic_infinity_battery) active = true;
if (global.relic_infinity_battery == 2) equipped = true;
else equipped = false;

//Equip/Unequip The Relic
full_relic = true;
object = "infinity";

if (toggle)
{
    toggle = false;
    
    if (global.relic_infinity_battery != 2){
        var equip = relic_slot_equip(object);
        if (equip) global.relic_infinity_battery = 2;
        else global.relic_infinity_battery = 1;
    }
    else{
        global.relic_infinity_battery = 1;
        var unequip = relic_slot_free(object);
        if (unequip) audio_play_sound(sfx_relic_off,1,false);
    }
}

