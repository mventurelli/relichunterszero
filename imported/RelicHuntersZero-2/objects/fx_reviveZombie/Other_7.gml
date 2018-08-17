///Create new turtle & self destruct

image_index = (image_number)-1;
image_speed = 0;

myZombie = instance_create_layer(x,y,"Interactive",obj_zombieTurtle);
myZombie.image_xscale = image_xscale;
myZombie.reviveChance = 0;

instance_destroy();

