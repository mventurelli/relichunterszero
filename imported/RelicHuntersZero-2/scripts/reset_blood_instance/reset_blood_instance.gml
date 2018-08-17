instance = argument0;
instance.x = argument1;
instance.y = argument2;
layer_add_instance(layer_get_id(argument3), instance);
layer_name = argument3;

instance.angular_min = -10;
instance.angular_max = 10;
instance.angular_speed = random_range(instance.angular_min,instance.angular_max);

instance.vertical_speed_start = random_range(3,6);
instance.vertical_speed = -instance.vertical_speed_start;

instance.timeToBounce = false;
instance.firstBounce = false;
instance.speed_per_second = random_range(2,4);
instance.dirMin = -30;
instance.dirMax = 30;
instance.sprite_subimage = irandom(3);  
instance.direction = random(360);

//instance.randomizeDir = false;

//activate
instance.active = true;
instance.visible = true;