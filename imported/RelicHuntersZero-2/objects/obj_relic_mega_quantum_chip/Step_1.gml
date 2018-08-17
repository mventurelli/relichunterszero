///Activation
event_inherited();

if (global.relic_mega_quantum_chip) active = true;
if (global.relic_mega_quantum_chip == 2) equipped = true;
else equipped = false;

//Equip/Unequip The Relic
full_relic = true;
object = "mega_quantum_chip";

if (toggle)
{
    toggle = false;
    
    if (global.relic_mega_quantum_chip != 2){
        var equip = relic_slot_equip(object);
        if (equip) global.relic_mega_quantum_chip = 2;
        else global.relic_mega_quantum_chip = 1;
    }
    else{
        global.relic_mega_quantum_chip = 1;
        var unequip = relic_slot_free(object);
        if (unequip) audio_play_sound(sfx_relic_off,1,false);
    }
}



