
///Activation
event_inherited();

if (global.relic_pineapple1) && (global.relic_pineapple2) && (global.relic_pineapple3) && (global.relic_pineapple_pudding == 0)
{
    if (global.gameMode == gamemode_adventure) global.relic_pineapple_pudding = 1;
}

if (global.relic_pineapple_pudding) active = true;
if (global.relic_pineapple_pudding == 2) equipped = true;
else equipped = false;

//Equip/Unequip The Relic
full_relic = true;
object = "pineapple";

if (toggle)
{
    toggle = false;
    
    if (global.relic_pineapple_pudding != 2){
        var equip = relic_slot_equip(object);
        if (equip) global.relic_pineapple_pudding = 2;
        else global.relic_pineapple_pudding = 1;
    }
    else{
        global.relic_pineapple_pudding = 1;
        var unequip = relic_slot_free(object);
        if (unequip) audio_play_sound(sfx_relic_off,1,false);
    }
}

