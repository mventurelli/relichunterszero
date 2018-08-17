owner = noone;
propagation_range = 128;
image_speed = 0.1;

number_of_enemies = instance_number(class_enemy);

for (i=0; i<number_of_enemies; i++)
{
    test_enemy = instance_find(class_enemy,i);
    if point_distance(x,y,test_enemy.x,test_enemy.y) <= propagation_range
    {
        test_enemy.want_to_activate = true;
    }
}
