///Barrel Spawn

if !(instance_exists(myBarrel))
{
    spawnTimeCurrent += delta_time;
    
    if (spawnTimeCurrent >= spawnTimeWarning) && (!startAnimating)
    {
        if (!instance_exists(myWarning)) myWarning = instance_create_layer(get_bbox_centerX(id),y-30,"Interactive_Over",fx_activation);
    }
    
    if (spawnTimeCurrent >= spawnTime)
    {
        startAnimating = true;
        image_speed = 0.2;
    }
}

