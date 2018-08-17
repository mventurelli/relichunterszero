image_speed = 0.2;

demolish = collision_circle(x,y,63,class_solid,false,true);

if instance_exists(demolish)
{
    with (demolish) instance_destroy();
}

