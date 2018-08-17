///Fade Control

if (!done)
{
	elapsedSeconds += (delta_time * ms_to_s);
    myAlpha = clamp((elapsedSeconds / durationInSeconds), 0, 1);
	if (myOrientation < 0) {
		myAlpha = 1 - myAlpha;	
	}
	done = (myAlpha <= 0 || myAlpha >= 1);
}

