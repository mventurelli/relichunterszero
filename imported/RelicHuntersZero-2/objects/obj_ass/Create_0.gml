///Main Variables
image_speed = 0.2;
image_xscale = -1;
depth = -y;

drawBalloon = true;
drawSelf = true;
myBalloon = noone;

reflection_object_setup(0,-1,image_index);

myTeleporter = noone;
alarm[0] = room_speed*1.5;

if (room == room_start) || (room == room_shop) || (room == room_endShop) sprite_index = spr_ass_idle;

mySwap = noone;
if (room == room_start) mySwap = instance_create_layer(x,y,"Interactive",obj_swap_ass);



