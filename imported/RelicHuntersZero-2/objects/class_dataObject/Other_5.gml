///Clean and destroy

if (ds_exists(cleanUp,ds_type_list)) 
{
    var target;
    
    while (!ds_list_empty(cleanUp)) 
    {
        target = ds_list_find_value(cleanUp, 0);
        if (ds_exists(target,ds_type_list)) ds_list_destroy(target);
        ds_list_delete(cleanUp,0);
    }

    ds_list_destroy(cleanUp);
}


instance_destroy();

