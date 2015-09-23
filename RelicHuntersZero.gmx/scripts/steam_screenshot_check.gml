///steam_screenshot_check()
///Take Screenshot
//Requires the global.screenShotNumber variable

if steam_is_screenshot_requested()
{
    var ss = ("Relic_Hunters_Zero_" + string(global.screenShotNumber) + ".png");
    screen_save(ss)
    steam_send_screenshot(ss, window_get_width(), window_get_height());
    global.screenShotNumber++;
}
