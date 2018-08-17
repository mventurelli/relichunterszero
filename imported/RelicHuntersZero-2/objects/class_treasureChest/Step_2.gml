///Unlock

event_inherited();

if (unlock){
    open = instance_create_layer(x,y,"Interactive",fxObject);
    open.spawnRelic = spawnRelic;
    open.spawnWeapon = spawnWeapon;
    open.spawnSprite = spawnSprite;
    open.spawnCoins = spawnCoins;
    open.spawnChallenge = spawnChallenge;
	owner_add_activated_instance_ex(open, activationClient);
    instance_destroy();
}

