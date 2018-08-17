
if (!global.pause)
{
	if (visible == true) {
		///Update Alpha and Duration

		if (lifeCurrent < lifeMax) lifeCurrent += delta_time * ms_to_s;
		else myAlpha -= fadeSpeed;

		if (myAlpha <= 0) {
			//instance_destroy();
			visible = false;
		}

		///Update Scale

		if (scaleOrientation)
		{
		    if (myScale < scaleGrow) myScale += min(scaleSpeedGrow, abs(scaleGrow-myScale));
		    else
		    {
		        myScale = scaleGrow;
		        scaleOrientation = -1;
		    }
		}
		else 
		{
		    if (myScale > scaleShrink) myScale -= min(scaleSpeedShrink, abs(scaleShrink-myScale));
		    else myScale = scaleShrink
		}
	}
}

