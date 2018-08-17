///Constrain Mouse to Screen
// This is bad but better than nothing I guess

var hsafety,vsafety;

hsafety = 0.05*window_get_width();
vsafety = 0.05*window_get_height();

if (window_mouse_get_x() < 0+hsafety) window_mouse_set(0+hsafety, window_mouse_get_y());
if (window_mouse_get_y() < 0+vsafety) window_mouse_set(window_mouse_get_x(), 0+vsafety);
if (window_mouse_get_x() > window_get_width()-hsafety) window_mouse_set(window_get_width()-hsafety, window_mouse_get_y());
if (window_mouse_get_y() > window_get_height()-vsafety) window_mouse_set(window_mouse_get_x(), window_get_height()-vsafety);

///Xbox 360 Controller Support

//Unrestricted
{
    var update0 = xin_update(0); 
    if (!update0) {}//show_debug_message('Trying to update unconnected Xbox 360 Controller (0)');   
    else
    {
        joy_rumble_update(0);
    }
    
    var update1 = xin_update(1); 
    if (!update1) {}//show_debug_message('Trying to update unconnected Xbox 360 Controller (1)');   
    else
    {
        joy_rumble_update(1);
    }
}

