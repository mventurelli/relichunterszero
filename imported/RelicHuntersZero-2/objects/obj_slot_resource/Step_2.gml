///Initialize and self-destroy
if (instance_exists(data_shopEndless))
{
    var data = data_shopEndless;
    var list = -1;
    var spawn = -1;
    
    if (ds_exists(global.endShop_resources,ds_type_list)) {
        list = global.endShop_resources;
        if (ds_list_empty(list)) instance_destroy();
    }
    
    if (list != -1)
    {
        var randomSpawn = irandom(ds_list_size(list)-1);
        spawn = ds_list_find_value(list,randomSpawn);
        if (spawn){
            instance_create_layer(x,y,"Interactive",spawn);
            ds_list_delete(list,randomSpawn);
            instance_destroy();
        }
    }
}

