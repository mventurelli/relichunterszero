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
    
    if (global.relic_pineapple_pie != 2){
        var equip = relic_slot_equip(object);
        if (equip) global.relic_pineapple_pie = 2;
        else global.relic_pineapple_pie = 1;
    }
    else{
        global.relic_pineapple_pie = 1;
        var unequip = relic_slot_free(object);
        if (unequip) audio_play_sound(sfx_relic_off,1,false);
    }
}

