///Spawn Control

if (!instance_exists(spawnedItem)) {
    if (instance_exists(data_shopEndless)){
        var data = data_shopEndless;
        var list = -1;
        var spawn = -1;
        
        tier = min(tier,3);
        if (hasSpawned) myItem = noone;
        
        if (myItem) spawn = myItem;
        else if (ds_exists(global.endShop_tier[tier],ds_type_list)) {
            list = global.endShop_tier[tier];
            if (ds_list_empty(list)) {
                with (data_shopEndless){
                    event_perform(ev_create,0);
                }
                list = global.endShop_tier[tier];
                if (ds_list_empty(list)) instance_destroy();
            }
            var randomSpawn = irandom(ds_list_size(list)-1);
            spawn = ds_list_find_value(list,randomSpawn);
            tier++;
        }
            
        if (spawn){
            spawnedItem = instance_create_layer(x,y,"Interactive",spawn);
            if (ds_exists(list,ds_type_list)) ds_list_delete(list,randomSpawn);
            hasSpawned = true;		
            myItem = spawn;
        }
    }
}

//Clean the Table
var isWeaponOnTheTable = collision_circle(x,y,60,class_pickup_weapon,false,true);
if (isWeaponOnTheTable){
    if (instance_exists(isWeaponOnTheTable)){
        isWeaponOnTheTable.y += 212;
        if (instance_exists(isWeaponOnTheTable.myPrompt)) isWeaponOnTheTable.myPrompt.y+=212;
    }
}

