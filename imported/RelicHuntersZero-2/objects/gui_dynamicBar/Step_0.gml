///Dynamic Bar

//Update Values
if (owner != noone)
{
    hp = owner.hp;
    hpMax = owner.hp_max;
    shield = owner.energy;
    if (owner.energy_max) shieldMax = owner.energy_max + owner.overshield;
    else shieldMax = 0; 
	
	//Set State

	drawShield = false;
	drawHealth = false;

	if (shield) && (shield < shieldMax) drawShield = true;
	if (!shield) drawHealth = true;

	//Special Case for Biu
	if (!shieldMax) if (hp >= hpMax) drawHealth = false;

	//Animate Alpha
	if (drawShield) || (drawHealth) myAlpha = 1;
	else if (myAlpha != 0)
	{
	    myAlpha -= myAlphaSpeed;
	}
}
//else instance_destroy();

