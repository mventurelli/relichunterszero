///Hehehehehe

if (!dropHugeGun) && (global.gameMode != gamemode_endless)
{
    bigFGun = instance_create_layer(x,y,"GUI",obj_pickup_bossGun);
    bigFGun.image_xscale = image_xscale;
    
    dropHugeGun = true;
    
    instance_create_layer(4416,2368,"Interactive",obj_teleporter_secret);
}

