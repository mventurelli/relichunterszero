///Spawn coins

repeat (10) instance_create_layer(x,y,"Interactive",obj_pickup_coin);
spawnCoins--;

if (spawnCoins) alarm[0] = room_speed*0.5;

