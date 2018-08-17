///Character Swap

if ((global.unlockAss) && (room==room_start))
{
    drawSelf = false;
}
else drawSelf = true;

if (global.character[1] == char_ass) || (global.playerCount > 1 && global.character[2] == char_ass)
{
    drawBalloon = false;
    drawSelf = false;
    if (room == room_start) instance_destroy();
}
else drawBalloon = true;

if (room == room_shop) || (room == room_endShop){
    drawSelf = true;
    drawBalloon = true;
}

///Talk when player is nearby
if instance_exists(class_player)
{
    if point_distance(x,y,class_player.x,class_player.y) <= 350
    if (!instance_exists(obj_ass_balloon))
    {
        myBalloon = instance_create_layer(x,y,"GUI", obj_ass_balloon);
        if (!image_xscale) myBalloon.x -= 50;
    }
}

if (myBalloon) && instance_exists(myBalloon)
{
    if (drawBalloon) myBalloon.drawSelf = true;
    else myBalloon.drawSelf = false;
}

