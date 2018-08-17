/// @description check events and refs

//if (!instance_exists_fast(owner)) owner = noone;
//else if (!instance_exists_fast(owner.ai_target)) owner.ai_target = noone;
if (owner != noone) 
{
	if (!instance_exists_fast(owner.ai_target)) owner.ai_target = noone;
}