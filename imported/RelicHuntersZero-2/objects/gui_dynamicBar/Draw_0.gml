///Draw

if (owner != noone) && (myAlpha > 0) //TODO: separate the update from the draw and get all this logic code out of the Draw event
{
    var topX = owner.x - barWidth/2;
    var topY = owner.y - 90;
	
	if (owner.isBoss) topY -= 45;

    draw_set_alpha(0.6 * myAlpha);
    draw_set_colour(c_black);
    draw_rectangle(topX,topY,topX+barWidth,topY+barHeight,false);
    draw_set_alpha(1 * myAlpha);
    
    if (!shieldMax) draw_set_alpha(0);
    draw_healthbar_delayed(barShields, topX-2,topY-2,topX+barWidth-2,topY+barHeight-2, shield, shieldMax, shieldColor, c_black, c_white, charBarDelaySpeed, charBarDelayTime, 0, false, false);
    draw_set_alpha(1 * myAlpha);
        
    if (!drawHealth) draw_set_alpha(0);
    draw_healthbar_delayed(barHp, topX-2,topY-2,topX+barWidth-2,topY+barHeight-2, hp, hpMax, healthColor, c_black, c_white, charBarDelaySpeed, charBarDelayTime, 0, false, false);
    
    //End
    draw_set_alpha(1);
}

