for (var i = array_length_1d(activated) - 1; i > -1; i--;)
{
	if (instance_exists(activated[i])) {
		activated[i].activationClient = noone;
	}
}