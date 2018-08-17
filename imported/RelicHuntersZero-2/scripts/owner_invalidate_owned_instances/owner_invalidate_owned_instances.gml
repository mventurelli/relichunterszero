for (var i = array_length_1d(owned) - 1; i > -1; i--;)
{
	if (instance_exists(owned[i])) {
		owned[i].owner = noone;
	}
}