/// @description checking instance exists

if (owner != noone)
{
	if instance_exists_fast(owner.activationClient)
	{
		player = owner.activationClient;
	}
	else player = noone;
}
else player = noone;
