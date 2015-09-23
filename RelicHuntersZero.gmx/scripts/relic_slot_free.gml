///relic_slot_free(stringObject)
//Free all slots that contain the object, returns true if it was there

var object = argument0;
var toReturn = false;

for (i=1; i<4; i++)
{
    if (global.relic_slot[i] == object)
    {
        global.relic_slot[i] = '';
        toReturn = true;
        break;
    }
}

return toReturn;
