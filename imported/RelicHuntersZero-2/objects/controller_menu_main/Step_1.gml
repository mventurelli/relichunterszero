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

