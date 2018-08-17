///Draw Rectangle

var targetRadius = 0;
var growthSpeed = 0;



if (drawShort)
{
    targetRadius = shortRadius;
    growthSpeed = shortGrowthSpeed;
    draw_set_colour(K_BETU_RED);
}
else if (drawLong)
{
    targetRadius = longRadius;
    growthSpeed = longGrowthSpeed;
    draw_set_colour(K_BETU_BLUE);
}
else
{
    targetRadius = noRadius;
    growthSpeed = noRadiusSpeed;
    draw_set_colour(c_white);
}


if (radius < targetRadius) radius += growthSpeed;
else instance_destroy();

if (targetRadius) draw_rectangle(x-radius,y-radius,x+radius,y+radius,true);

