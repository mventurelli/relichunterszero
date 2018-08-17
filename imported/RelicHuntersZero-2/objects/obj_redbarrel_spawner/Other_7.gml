///Spawn barrel
if (startAnimating)
{
    //Push Players Away
    if (instance_exists(class_player))
    {
        for (i=0; i<instance_number(class_player); i++)
        {
            pCur = instance_find(class_player,i);
            if point_distance(x,y,pCur.x,pCur.y) < 96
            {
                pCur.x = pCur.x + lengthdir_x(96,point_direction(x,y,pCur.x,pCur.y));
                pCur.y = pCur.y + lengthdir_y(96,point_direction(x,y,pCur.x,pCur.y));

            }
        }
    }
    
    
    myBarrel = instance_create_layer(x,y,"Interactive",obj_redbarrel);
    spawnTimeCurrent=0;
    image_speed = 0;
    startAnimating = false;
}

