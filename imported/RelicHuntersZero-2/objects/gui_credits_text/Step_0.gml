///Roll Up, Animate black overlay

y += rollSpeed;

if (timeToBlackCurrent < timeToBlack) timeToBlackCurrent += delta_time;
else if (blackAlpha < 1) {
	blackAlpha += blackAlphaSpeed * delta_time * ms_to_s_60;
	if (blackAlpha > 1) blackAlpha = 1;
}	

