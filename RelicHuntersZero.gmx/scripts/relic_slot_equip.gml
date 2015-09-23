///relic_slot_equip(stringObject)
//Tries to equip relic, returns true if succeeds

var object = argument0;
var freeSlot = -1;
        
for (i=1; i<4; i++){
    if (global.relic_slot[i] == ''){
        freeSlot = i;
        break;
    }
}

if (freeSlot){
    global.relic_slot[freeSlot] = object;
    audio_play_sound(sfx_relic_on,1,false);
    return true;
}
else return false;
