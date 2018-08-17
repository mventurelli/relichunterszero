///Wait for controller_main, find my item and spawn it

if (instance_exists(controller_main))
{
    if (controller_main.level_built)
    {
        ///Find my item and spawn it!
        if (global.stage_current <= 1)  
        {
            list = global.shop_list_1;
            freelist = global.shop_free_1;
        }
        
        if (global.stage_current == 2)
        {
            list = global.shop_list_2;
            freelist = global.shop_free_2;
        }
        
        if (global.stage_current == 3)
        {
            list = global.shop_list_3;
            freelist = global.shop_free_3;
        }
        
        if (global.stage_current > 3)
        {
            list = global.shop_list_4;
            freelist = global.shop_free_4;
        }
        
        if (!ds_list_empty(list))
        {
            random_position = irandom_range(0, ds_list_size(list)-1);
            item = ds_list_find_value(list,random_position);
            instance_create_layer(x,y,"Interactive",item);
            ds_list_delete(list,random_position);
            instance_destroy();
        }   
        else
        {
            random_free_item = ds_list_find_value(freelist, irandom_range(0, ds_list_size(freelist)-1) );
            instance_create_layer(x,y,"Interactive",random_free_item);
            instance_destroy();
        }
    }
}

