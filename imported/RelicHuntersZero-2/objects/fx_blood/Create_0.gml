///Init
event_inherited();
active = true;
sprite = spr_blood_bits;

bounce_min = 3;
bounce_max = 4;

betuRed = make_color_rgb(175,19,26);
image_blend = betuRed;

//CONFETEEEEEEEE
if (global.bdayMode)
{
	var randomColor = irandom(3);
	switch (randomColor)
	{
		case 0 : image_blend = K_BETU_ORANGE; break;
		case 1 : image_blend = K_BETU_YELLOW; break;
		case 2 : image_blend = K_BETU_GREEN; break;
		case 3 : image_blend = K_BETU_MAGENTA; break;
	}
	
	fake_gravity = 0.1;
	bounce_min = 99;
	bounce_max = 99;
}