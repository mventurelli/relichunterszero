///instance_exists_fast(instance)
//find out if the instance has been destroyed recently using our eventManager

if (argument0 == noone) 
{
	return false;
}
else
{
	var toReturn = true;

	for (var i = array_length_1d(global.eventManager.removedInstances)-1; i>-1; i--;) 
	{
		if (argument0 == (global.eventManager.removedInstances[i])) 
		{
			toReturn = false;
			break;
		}
	}
	
	return toReturn;
}
