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
    
    if (global.relic_crystal_bacon != 2){
        var equip = relic_slot_equip(object);
        if (equip) global.relic_crystal_bacon = 2;
        else global.relic_crystal_bacon = 1;
    }
    else{
        global.relic_crystal_bacon = 1;
        var unequip = relic_slot_free(object);
        if (unequip) audio_play_sound(sfx_relic_off,1,false);
    }
}

