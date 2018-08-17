///Reflect

if (isActive) && (!ds_list_find_index(rocketList,other.id))
{
    ds_list_add(rocketList,other.id);

    other.direction += 180 + random_range(reflectRocketMin,reflectRocketMax);
    other.faction = f_player;
    
    animationTrigger = true;
}

