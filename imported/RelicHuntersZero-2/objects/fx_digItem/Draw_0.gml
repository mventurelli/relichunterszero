///Draw

if (image_index >= itemFrame && itemSprite != noone)
{
    draw_sprite_ext(itemSprite,0,x,y-155,1,1,0,c_white,itemAlpha);
}

if (!animationDone) draw_self();
