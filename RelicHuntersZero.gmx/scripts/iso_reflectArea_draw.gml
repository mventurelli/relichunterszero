//iso_reflectArea_draw();
//Draw the reflection area.
if(rflExists && rflActive)
{
    if(surface_exists(rflSurface))
        draw_surface(rflSurface, rflX1, rflY1);
    return true;
}
return false;
