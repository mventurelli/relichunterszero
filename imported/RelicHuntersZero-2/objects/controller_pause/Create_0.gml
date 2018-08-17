///Adjust position of itself and all children buttons

x = __view_get( e__VW.XView, 0 );
y = __view_get( e__VW.YView, 0 );

//var w = window_get_width();
//var h = window_get_height();


if (instance_exists(global.pauseButtonContinue))
{
    global.pauseButtonContinue.x = x + 192;
    global.pauseButtonContinue.y = y + 160;
}

if (instance_exists(global.pauseButtonBackToShip))
{
    global.pauseButtonBackToShip.x = x + 128;
    global.pauseButtonBackToShip.y = y + 224;
}

if (instance_exists(global.pauseButtonBackToMenu))
{
    global.pauseButtonBackToMenu.x = x + 64;
    global.pauseButtonBackToMenu.y = y + 288;
}

if (instance_exists(global.pauseButtonExit))
{
    global.pauseButtonExit.x = x + 0;
    global.pauseButtonExit.y = y + 352;
}

if (instance_exists(global.pauseFX))
{
    global.pauseFX.x = x + 179;
    global.pauseFX.y = y + 48;
}

if (instance_exists(global.pauseWeapon1))
{
    global.pauseWeapon1.x = x + 280;
    global.pauseWeapon1.y = y + 384;
}

if (instance_exists(global.pauseWeapon2))
{
    global.pauseWeapon2.x = x + 784;
    global.pauseWeapon2.y = y + 384;
}

if (instance_exists(global.pausePlayerInfo))
{
    global.pausePlayerInfo.x = x + 441;
    global.pausePlayerInfo.y = y + 200;
}

