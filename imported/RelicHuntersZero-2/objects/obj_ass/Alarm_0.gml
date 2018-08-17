///Spawn Teleporter

if (!instance_exists(myTeleporter)) && (room != room_start) && (room != room_shop) && (room != room_endShop) && instance_exists(class_player)
{
    randomX = x+140;
    randomY = y-20;
    if (collision_circle(randomX,randomY,63,class_solid,false,true)) randomX = x-140;
    if (collision_circle(randomX,randomY,63,class_solid,false,true)) { randomX = x; randomY = y+100; }
    if (collision_circle(randomX,randomY,63,class_solid,false,true)) { randomX = class_player.x; randomY = class_player.y; }
    
    myTeleporter = instance_create_layer(randomX,randomY,"Interactive",obj_teleporter_spawn); 
    exitFx = instance_create_layer(x,y,"GUI",fx_exitArrow);
    exitFx.owner = myTeleporter;
}
