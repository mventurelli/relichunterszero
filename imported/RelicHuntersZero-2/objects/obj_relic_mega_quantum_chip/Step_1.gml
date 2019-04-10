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
	
	relic_activate(K_RELIC_MEGA_QUANTUM_CHIP);
}



