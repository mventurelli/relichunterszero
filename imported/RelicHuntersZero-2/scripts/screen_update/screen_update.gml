///screen_update();

///Fullscreen/Windowed Control
if (global.fullscreen)
{
    if (!window_get_fullscreen()) window_set_fullscreen(true);
}
else if (window_get_fullscreen()) window_set_fullscreen(false);


//Screen Size Control
if (!global.fullscreen)
{
    if ( window_get_width() != 1280*global.screenResolution ) || (window_get_width() != 720*global.screenResolution)
    {
        window_set_size(1280*global.screenResolution,720*global.screenResolution);
    }
}
