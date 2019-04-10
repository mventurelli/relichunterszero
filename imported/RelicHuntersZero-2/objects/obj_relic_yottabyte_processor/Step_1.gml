///Activation
event_inherited();

if (global.relic_yottabyte_processor) active = true;
if (global.relic_yottabyte_processor == 2) equipped = true;
else equipped = false;

//Equip/Unequip The Relic
full_relic = true;
object = "yottabyte_processor";

if (toggle)
{
    toggle = false;
    
	relic_activate(K_RELIC_YOTTABYTE_PROCESSOR)
}

