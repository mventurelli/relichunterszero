///Keyboard Shortcut
if (instance_exists(class_button_remap))
{
    global.testRemap = false;
    with(class_button_remap)
    {
        if (waitForKey) global.testRemap = true;
    }
    
    if (!global.testRemap) keyboardShortcut = vk_escape;
    else keyboardShortcut = -1;
}
else keyboardShortcut = vk_escape;

