/// @description

if (alpha < 1)
{
	if timetoStartDrawCurrent < timetoStartDraw timetoStartDrawCurrent += delta_time * ms_to_s;
	else alpha += (alphaSpeed * delta_time * ms_to_s);
}