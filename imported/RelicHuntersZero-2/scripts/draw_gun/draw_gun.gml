///draw_gun(obj)

if (instance_exists_fast(weapon1)) 
{
	with (weapon1) 
	{
		isActive = false;
	}
}

if (instance_exists_fast(weapon2))
{ 
	with (weapon2) 
	{
		isActive = false;
	}
}

if instance_exists_fast(argument0) 
{
    argument0.isActive = true;
    myGun = argument0;
}
else 
{
	return false;
}
