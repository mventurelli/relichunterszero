/// Follow Owner Position
if (owner != noone)
{
    x = owner.x;
    if (isActive) 
	{
		y = owner.y-15;
		depth = (owner.depth)-1;
    }
	else 
	{
		y = owner.y-35;
		depth = (owner.depth)+1;
	}
}
