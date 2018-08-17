///Coin Drop

repeat(10) instance_create_layer(x,y,"Interactive",obj_pickup_coin);
repeat(2) instance_create_layer(x,y,"Interactive",obj_pickup_scrap);

coinDrops--;

if (coinDrops) alarm[0] = room_speed*0.5;
else
{
    var fader = instance_create_depth(x,y,fade_depth,fx_fadeToBlack);
    fader.durationInSeconds = 4;
    alarm[1] = room_speed*6;
}

