
/// Pause
if (global.pause)
{
    global.pause -= delta_time;
    if global.pause < 0 global.pause = 0;
}


///Ammo Control

var p = 1; while (p <= global.playerCount)
{
    if (global.ammo_light[p] > global.ammo_light_max) global.ammo_light[p] = global.ammo_light_max;
    if (global.ammo_light[p] < 0) global.ammo_light[p] = 0;
    if (global.ammo_medium[p] > global.ammo_medium_max) global.ammo_medium[p] = global.ammo_medium_max;
    if (global.ammo_medium[p] < 0) global.ammo_medium[p] = 0;
    if (global.ammo_heavy[p] > global.ammo_heavy_max) global.ammo_heavy[p] = global.ammo_heavy_max;
    if (global.ammo_heavy[p] < 0) global.ammo_heavy[p] = 0;
    if (global.grenades[p] > global.grenades_max) global.grenades[p] = global.grenades_max;
    if (global.grenades[p] < 0) global.grenades[p] = 0;
    
    p++;
}


///Level Instantiator

if (!level_built)
{
    if (global.isDaily) random_set_seed(global.dailySeed+global.stage_current+global.currentLoop);
    
    //Create global shop data objects
    if (room == room_endShop) instance_create_layer(0,0,"Controllers",data_shopEndless);
    else instance_create_layer(0,0,"Controllers",data_shop);

    //Instantiate Player
    player_spawn_number = instance_number(obj_spawn_player);
    random_spawn = irandom(player_spawn_number-1);
    target_spawn = instance_find(obj_spawn_player,random_spawn);
        
    var p = 1; while (p <= global.playerCount)
    {
        if (global.playerAlive[p])
        {
            var playerSpawned;
            if (global.character[p] == char_jimmy) playerSpawned = instance_create_layer(target_spawn.spawnX,target_spawn.spawnY,"Interactive",obj_jimmy);
            if (global.character[p] == char_pinky) playerSpawned = instance_create_layer(target_spawn.spawnX,target_spawn.spawnY,"Interactive",obj_pinky);
            if (global.character[p] == char_raff) playerSpawned = instance_create_layer(target_spawn.spawnX,target_spawn.spawnY,"Interactive",obj_raff);
            if (global.character[p] == char_biu) playerSpawned = instance_create_layer(target_spawn.spawnX,target_spawn.spawnY,"Interactive",obj_biu);
            if (global.character[p] == char_punny) playerSpawned = instance_create_layer(target_spawn.spawnX,target_spawn.spawnY,"Interactive",obj_punny);
            if (global.character[p] == char_ass) playerSpawned = instance_create_layer(target_spawn.spawnX,target_spawn.spawnY,"Interactive",obj_assPlayer);
            if (global.character[p] == char_rider) playerSpawned = instance_create_layer(target_spawn.spawnX,target_spawn.spawnY,"Interactive",obj_rider);
            
			//playerPosition for fast access
			global.characterPos[p, 0] = playerSpawned.x;
			global.characterPos[p, 1] = playerSpawned.y;
			
            playerSpawned.myPlayerId = p;			
            with (playerSpawned) event_perform(ev_other,ev_user0);
        }
        p++;
    }
    
    //Stop here if it's the first room
    if (room == room_start) { level_built = true; exit; }
    
    //Still here? Create the teleporter entry point;
    teleporter = instance_create_layer(target_spawn.spawnX,target_spawn.spawnY-10,"Interactive",obj_teleporter);
    teleporter.active = false;
    
    //Instantiate Data Objects and set enemy and item lists
    if (global.gameMode == gamemode_adventure)
    {
        enemyData = instance_create_layer(0,0,"Controllers",data_enemies);
        itemData = instance_create_layer(0,0,"Controllers",data_items);
        
        enemy_pool = enemyData.enemyPool;
        item_pool = itemData.itemPool;
    }
    
    if (global.gameMode == gamemode_endless)
    {
        enemyData = instance_create_layer(0,0,"Controllers",data_enemiesEndless);
        itemData = instance_create_layer(0,0,"Controllers",data_itemsEndless);
        
        enemy_pool = enemyData.enemyPool;
        item_pool = itemData.itemPool;
    }
    
    
        //Resolve Enemies
        
        //Challenge Enemies
        if (global.challengeHunted)
        {
            enemy_spawn_number = instance_number(obj_spawn_enemy);
            random_spawn = irandom(enemy_spawn_number-1);
            target_spawn = instance_find(obj_spawn_enemy,random_spawn);
            
            if (instance_exists(target_spawn)){
                spawnX = target_spawn.spawnX + random_range(-128,128);
                spawnY = target_spawn.spawnY + random_range(-128,128);
                
                if collision_circle(spawnX,spawnY,40,class_solid,false,true) < 0 {
                    var randomSpawnRoll = irandom_range(1,4);
                    switch (randomSpawnRoll){
                        case 1 : spawnee = obj_ducanElite_rifle; break;
                        case 2 : spawnee = obj_ducanElite_shotgun; break;
                        case 3 : spawnee = obj_ducanElite_sniper; break;
                        case 4 : spawnee = obj_ducanElite_plasma; break;
                    }
                    instance_create_layer(spawnX,spawnY,"Interactive",spawnee);
                }
            }
        }
        
        if (global.challengeHaunted)
        {
            enemy_spawn_number = instance_number(obj_spawn_enemy);
            random_spawn = irandom(enemy_spawn_number-1);
            target_spawn = instance_find(obj_spawn_enemy,random_spawn);
            
            if (instance_exists(target_spawn)){
                spawnX = target_spawn.spawnX + random_range(-128,128);
                spawnY = target_spawn.spawnY + random_range(-128,128);
                
                if collision_circle(spawnX,spawnY,40,class_solid,false,true) < 0 {
                    spawnee = obj_ghost_ducan;
                    instance_create_layer(spawnX,spawnY,"Interactive",spawnee);
                }
            }
        }
        
        //Regular Enemies
        if (!global.survivalWaves) 
        {
            while (!ds_list_empty(enemy_pool))
            {
                pick_random_group = irandom(ds_list_size(enemy_pool)-1);
                random_group = ds_list_find_value(enemy_pool,pick_random_group);
                ds_list_delete(enemy_pool,pick_random_group);
                
                current_group = ds_list_create();
                ds_list_copy(current_group, random_group);
                
                enemy_spawn_number = instance_number(obj_spawn_enemy);
                random_spawn = irandom(enemy_spawn_number-1);
                target_spawn = instance_find(obj_spawn_enemy,random_spawn);
                
                while (!ds_list_empty(current_group)) && (instance_exists(target_spawn))
                {
                    spawnX = target_spawn.spawnX + random_range(-128,128);
                    spawnY = target_spawn.spawnY + random_range(-128,128);
                    
                    if collision_circle(spawnX,spawnY,40,class_solid,false,true) < 0 
                    {
                        list_position = ds_list_size(current_group)-1;
                        spawnee = ds_list_find_value(current_group, list_position);
                        instance_create_layer(spawnX,spawnY,"Interactive",spawnee);
                        ds_list_delete(current_group,list_position);
                    }
                }
                ds_list_destroy(current_group);
                with (target_spawn) { instance_destroy(); }
            }
            
            with (obj_spawn_enemy)
            {
                instance_destroy();
            }
        }
        
       //Resolve Items 
        while (!ds_list_empty(item_pool))
        {
            pick_random_group = irandom(ds_list_size(item_pool)-1);
            random_group = ds_list_find_value(item_pool,pick_random_group);
            ds_list_delete(item_pool,pick_random_group);
            
            current_group = ds_list_create();
            ds_list_copy(current_group, random_group);
            
            item_spawn_number = instance_number(obj_spawn_item);
            random_spawn = irandom(item_spawn_number-1);
            target_spawn = instance_find(obj_spawn_item,random_spawn);
            
            if instance_exists(target_spawn)
            {
                spawnX = target_spawn.spawnX;
                spawnY = target_spawn.spawnY;
                
                list_position = irandom(ds_list_size(current_group)-1);
                spawnee = ds_list_find_value(current_group, list_position);
                instance_create_layer(spawnX,spawnY,"Interactive",spawnee);
                with (target_spawn) { instance_destroy(); }
            }
            ds_list_destroy(current_group);
        }
        
        with (obj_spawn_item) instance_destroy();

        
    //All Done
        level_built = true;  
}

///Level Exit + Dig System

if (!(room == room_start)) && (!(room == room_tutorial)) && (!(room == room_shop)) && (!(room == room_boss)) && (!(room == room_endShop))
{

	if (debug_forceLevelExit) {
		var a = 1;
	}
	
	if (!instance_exists(class_enemy)) {
		var b = 1;
	}
	
    if ((!instance_exists(class_enemy)) && (!instance_exists(obj_kamikazelite_flying)) && (instance_exists(class_player)) && (!global.survivalWaves) && (!level_end)) || (debug_forceLevelExit && !level_end)
    {
        //Instantiates Ass
		if (!instance_exists(obj_ass)) {
	        var tries;
	        tries=0;
	        while (!level_end)
	        {
	            randomX = class_player.x + irandom_range(-100,100);
	            randomY = class_player.y + irandom_range(-100,100);
            
	            if collision_circle(randomX,randomY,63,class_solid,false,true) < 0
	            {
	                level_end = true
	            }
	            tries++;
	            if (tries >= 10)
	            {
	                randomX = class_player.x;
	                randomY = class_player.y;
	                level_end = true;
	            }
	        }
	        ass = instance_create_layer(randomX,randomY,"Interactive", obj_ass);   
		}
 
		
        if (global.gameMode == gamemode_adventure)
        {
            //Revives any dead player
            var revivePlayerX = class_player.x;
            var revivePlayerY = class_player.y;
            
            var p = 1; while (p <= global.playerCount)
            {
                if (!global.playerAlive[p])
                {
                    var playerSpawned;
                    if (global.character[p] == char_jimmy) playerSpawned = instance_create_layer(revivePlayerX,revivePlayerY,"Interactive",obj_jimmy);
                    if (global.character[p] == char_pinky) playerSpawned = instance_create_layer(revivePlayerX,revivePlayerY,"Interactive",obj_pinky);
                    if (global.character[p] == char_raff) playerSpawned = instance_create_layer(revivePlayerX,revivePlayerY,"Interactive",obj_raff);
                    if (global.character[p] == char_biu) playerSpawned = instance_create_layer(revivePlayerX,revivePlayerY,"Interactive",obj_biu);
                    if (global.character[p] == char_punny) playerSpawned = instance_create_layer(revivePlayerX,revivePlayerY,"Interactive",obj_punny);
                    if (global.character[p] == char_ass) playerSpawned = instance_create_layer(revivePlayerX,revivePlayerY,"Interactive",obj_assPlayer);
                    if (global.character[p] == char_rider) playerSpawned = instance_create_layer(revivePlayerX,revivePlayerY,"Interactive",obj_rider);
                    playerSpawned.myPlayerId = p;
					
					global.characterPos[p,0] = playerSpawned.x;
					global.characterPos[p,1] = playerSpawned.y;
                    
                    //Reset weapons and HP
                    global.playerAlive[p] = true;
                    global.weapon1[p] = noone;
                    global.weapon2[p] = noone;
                    global.weapon1Level[p] = 0;
                    global.weapon2Level[p] = 0;
                    global.hp[p] = 999999;
                    global.overshield[p] = 0;
                    global.currentlyEquippedWeapon[p] = 0;
                    global.grenades[p] = 2;
                    
                    with (playerSpawned) event_perform(ev_other,ev_user0);
                    
                    playerSpawned.hp = playerSpawned.hp_max * global.reviveHealth;
                    global.ammo_light[p] = global.reviveAmmoLight;
                    global.ammo_medium[p] = global.reviveAmmoMedium;
                    global.ammo_heavy[p] = global.reviveAmmoHeavy;
                }
                p++;
            }
        
        
            //RELIC DETECTED!!!
            global.dirtColor = c_white;
            
            //Relic Chance
            var relicChance = -1;
            var shopList = -1;
            if (room==level1_1) || (room==level1_2) || (room==level1_3) { relicChance = 0.25;    shopList = global.shop_list_1;  global.dirtColor = make_color_rgb(183,137,49); }
            if (room==level2_1) || (room==level2_2) || (room==level2_3) { relicChance = 0.2;    shopList = global.shop_list_2;  global.dirtColor = make_color_rgb(111,197,148); }
            if (room==level3_1) || (room==level3_2) || (room==level3_3) { relicChance = 0.2;   shopList = global.shop_list_3;  global.dirtColor = make_color_rgb(74,136,192); }
            if (room==level4_1) || (room==level4_2) || (room==level4_3) { relicChance = 0.2;   shopList = global.shop_list_4;  global.dirtColor = make_color_rgb(159,55,60); }
            
            if (!global.totalDigs) relicChance = 1 //Force on the first time
            
            if (random(1) <= relicChance)
            {
                //Find out if there is a relic to spawn
                var spawnRelic = noone;
                if ds_exists(shopList,ds_type_list) while (!ds_list_empty(shopList))
                {
                    var randomPos = irandom_range(0, ds_list_size(shopList)-1);
                    var candidate = ds_list_find_value(shopList,randomPos);
                    if (candidate)
                    {
                        var spawnToTestVariable = instance_create_layer(0,0,"Interactive",candidate);
                        if (spawnToTestVariable.shopType == "relic") spawnRelic = candidate;
                        
                        with (spawnToTestVariable) instance_destroy();
                        
                        if (spawnRelic != noone) break;
                    }
                    ds_list_delete(shopList,randomPos);
                }
                
                //Stop here if there is no relic to spawn
                if (spawnRelic == noone) exit;
                
                //Randomize Dig Site Position
                if (instance_exists(obj_spawn_topLeft)) && (instance_exists(obj_spawn_botRight))
                {
                    var validPosition = false;
                    var relicSpawnX, relicSpawnY;
                    
                    while (!validPosition)
                    {
                        relicSpawnX = irandom_range( obj_spawn_topLeft.x , obj_spawn_botRight.x );
                        relicSpawnY = irandom_range( obj_spawn_topLeft.y , obj_spawn_botRight.y );
                        if (!collision_circle(relicSpawnX,relicSpawnY,42,obj_limit,false,true)) validPosition = true;
                    }
                }
                else exit;
                
                  
                //Spawn Relic
                
                audio_stop_all();
                audio_play_sound(bgm_dig,99,true);
                volume_update();
                audio_play_sound(sfx_relic_on,00,false); //Relic Detected Sound Will Go Here Someday
                
                global.relicDetected = true;
                var announceRelic = instance_create_layer(x,y,"GUI",fx_bigMessage);
                announceRelic.textBig = loc_key("HUD_RELIC_DETECT");
                announceRelic.textBigColor = K_BETU_RED;
                if (global.input[1] == K_INPUT_KEYBOARD) announceRelic.textSmall = loc_key("HUD_RELIC_DETECT_KEY");
                else announceRelic.textSmall = loc_key("HUD_RELIC_DETECT_JOY");
                
                var relicDig = instance_create_layer(relicSpawnX,relicSpawnY,"Interactive",obj_digSpot);
                relicDig.myItem = spawnRelic;
            }
        }

        if (global.gameMode == gamemode_endless)
        {
            if (global.isDaily) random_set_seed(global.dailySeed+global.stage_current+global.currentLoop);
            
            global.dirtColor = c_white;
            
            //Treasure Chance
            var relicChance = -1;
            if (room==level1_1) || (room==level1_2) || (room==level1_3) { relicChance = 0.25 + global.relicChanceBonus;    global.dirtColor = make_color_rgb(183,137,49); }
            if (room==level2_1) || (room==level2_2) || (room==level2_3) { relicChance = 0.2 + global.relicChanceBonus;    global.dirtColor = make_color_rgb(111,197,148); }
            if (room==level3_1) || (room==level3_2) || (room==level3_3) { relicChance = 0.2 + global.relicChanceBonus;   global.dirtColor = make_color_rgb(74,136,192); }
            if (room==level4_1) || (room==level4_2) || (room==level4_3) { relicChance = 0.2 + global.relicChanceBonus;   global.dirtColor = make_color_rgb(159,55,60); }
            if (room==levelHalloween_1) { relicChance = 0.3;   shopList = global.shop_list_3;  global.dirtColor = make_color_rgb(10,10,10); }
                        
            relicChance -= 0.2 * global.currentLoop;
            if (global.relic_rabbit_foot == 2) relicChance += 0.2;
            relicChance += global.entropy;
            
            if (random(1) <= relicChance)
            {
                global.relicChanceBonus = -0.15;
                global.entropy -= min(0.1,global.entropy);
 
                //Define object to spawn
                var spawnObject = noone;    
                var randomRoll = random(100);  
                         
                if (randomRoll <= 80) spawnObject = obj_chestRegular; // <-- one day this will add chances for slot machine and sacrifice table
                else if (randomRoll <= 90 && !global.spookylandsVisited || room == level1_1) spawnObject = obj_teleporter_haunted;
                else if (randomRoll <= 95) && (!global.challengeHunted) spawnObject = obj_chestDucan;
                else if (!global.challengeHaunted) spawnObject = obj_chestHaunted;
                else spawnObject = obj_chestRegular;
                
                
                //Stop here if there is no object to spawn
                if (spawnObject == noone) exit;
                
                //Randomize Dig Site Position
                if (instance_exists(obj_spawn_topLeft)) && (instance_exists(obj_spawn_botRight))
                {
                    var validPosition = false;
                    var relicSpawnX, relicSpawnY;
                    
                    while (!validPosition)
                    {
                        relicSpawnX = irandom_range( obj_spawn_topLeft.x , obj_spawn_botRight.x );
                        relicSpawnY = irandom_range( obj_spawn_topLeft.y , obj_spawn_botRight.y );
                        if (!collision_circle(relicSpawnX,relicSpawnY,42,obj_limit,false,true)) validPosition = true;
                    }
                }
                else exit;
                
                //Spawn
                audio_stop_all();
                audio_play_sound(bgm_dig,99,true);
                volume_update();
                audio_play_sound(sfx_relic_on,00,false);
                
                global.relicDetected = true;
                var announceRelic = instance_create_layer(x,y,"GUI",fx_bigMessage);
                announceRelic.textBig = loc_key("HUD_TREASURE_DETECT");
                announceRelic.textBigColor = K_BETU_RED;
                if (global.input[1] == K_INPUT_KEYBOARD) announceRelic.textSmall = loc_key("HUD_RELIC_DETECT_KEY");
                else announceRelic.textSmall = loc_key("HUD_RELIC_DETECT_JOY");
                
                var relicDig = instance_create_layer(relicSpawnX,relicSpawnY,"Interactive",obj_digSpot);
                relicDig.myItem = spawnObject;
            }
            else{
                global.relicChanceBonus += 0.12;
            }
        }
        
        //Special Rewards
		if (room == levelHalloween_3)
        {
            instance_create_layer(2432,1664,"Interactive",obj_chestHaunted);
            achievement_give("ACHIEVEMENT_COMPLETE_SPOOKYLANDS");
        }
    }
}

///Dust and Fog

tile_layer_shift(-9024, -0.12, 0);
tile_layer_shift(-9048, -0.2, 0);

///Save Data and Advance the Game

if (global.stage_current == 1) && (global.checkpoint1 == 0) global.checkpoint1 = 1;
if (global.stage_current == 2) && (global.checkpoint2 == 0) global.checkpoint2 = 1;
if (global.stage_current == 3) && (global.checkpoint3 == 0) global.checkpoint3 = 1;

if (global.level_complete)
{
    //Update Endless Score
    if (global.gameMode == gamemode_endless) global.scoreEndless += round(global.scoreEndlessLevel * max(1, (global.currentLoop*global.scoreEndlessLoopMultiplier) ));

    save_and_clean();
    
    if (global.overrideLevel != noone) && (room_exists(global.overrideLevel)) { room_goto(global.overrideLevel); exit; }

    if (room == room_shop) || (room == room_start) || (room == room_endShop)
    {
        //Test boss: room_goto(room_boss); exit;  
        //Test halloween: room_goto(levelHalloween_1); exit; 
        if (global.stage_current == 0) room_goto(level1_1);
        else if (global.stage_current == 1) room_goto(level2_1);
        else if (global.stage_current == 2) room_goto(level3_1);
        else if (global.stage_current == 3) room_goto(level4_1);
        else if (global.stage_current == 4) room_goto(room_boss);

        exit;
    }
    
    //Go to Shop
    if (global.gameMode == gamemode_adventure)
    {
        if (room == level1_3) { room_goto(room_shop); exit; }
        if (room == level2_3) { room_goto(room_shop); exit; }
        if (room == level3_3) { room_goto(room_shop); exit; }
        if (room == level4_3) { room_goto(room_shop); exit; }
    }
    
    if (global.gameMode == gamemode_endless)
    {
        show_debug_message("Time to change the room!");
        if (room == level1_3) {  show_debug_message("I am on Level 1-3, it\'s shop time!"); room_goto(room_endShop); exit; }
        if (room == level2_3) {  show_debug_message("I am on Level 2-3, it\'s shop time!"); room_goto(room_endShop); exit; }
        if (room == level3_3) {  show_debug_message("I am on Level 3-3, it\'s shop time!"); room_goto(room_endShop);exit; }
        if (room == level4_3) {  show_debug_message("I am on Level 4-3, it\'s shop time!"); room_goto(room_endShop);exit; }
        if (room == levelHalloween_3) { global.stage_current = min(4,global.stage_current+2); room_goto(room_endShop); show_debug_message("I am on Level Halloween-3, it\'s shop time!"); exit; }
    }
    
    
    if (room == room_boss) 
    {
        if (global.gameMode == gamemode_adventure)
        {
                if (global.stage_current != -9)
                {
                    show_debug_message("CHEGUEI ATE AQUI SEM MORRER");
                    room_goto(room_end); 
                    exit;
                }
                else { room_goto(level1_1); exit; } //Secret room portal
        }
        else if (global.gameMode == gamemode_endless)
        {
            global.currentLoop++;
            global.statTotalLoops++;
            steam_set_stat_int("STAT_TOTAL_LOOPS", steam_get_stat_int("STAT_TOTAL_LOOPS") + 1  ); 
            if (steam_get_stat_int("STAT_TOTAL_LOOPS") >= 50) achievement_give("ACHIEVEMENT_LOOPS_50");
            global.stage_current = 0;
            save_all();
            room_goto(room_endShop);
            exit;
        }
    }
    
    if room_exists(room_next(room)) room_goto_next();
    else room_goto(room == room_start);
    
}

///Particle Systems Manager

if (!global.pause)
{
	var particle_systems = ds_map_size(global.particle_list) ;
	var psKey = ds_map_find_first(global.particle_list);
	for (var i = 0; i < particle_systems; i++;)
	{
		part_system_update(psKey);		
		psKey = ds_map_find_next(global.particle_list, psKey);
	}
/*
    for (i=0; i<ds_map_size(global.particle_list); i++)
    {
        particle_system = ds_list_find_value(global.particle_list,i);
        part_system_update(particle_system);
        
        if !part_particles_count(particle_system)
        {
            //part_emitter_destroy_all(particle_system);
            part_system_destroy(particle_system);
            ds_list_delete(global.particle_list,i);
        }
    }
*/
}




///Pause Menu Control

var pauseKeyPressed = false;

if (!global.gameOver) && instance_exists(class_player)
{
    var p = 1; while (p <= global.playerCount)
    {
        if (global.playerAlive[p])
        {
            if (global.input[p] == K_INPUT_KEYBOARD && keyboard_check_pressed(vk_escape)) || (global.input[p] != K_INPUT_KEYBOARD && joy_check_pressed(global.input[p],8))
            {
                pauseKeyPressed = true;
                global.pauseClient = p;
            }
        }
        p++;
    }
    
    if (!pauseKeyPressed) //Force ESC pausing
    {
        if (keyboard_check_pressed(vk_escape))
        {
            pauseKeyPressed = true;
            if global.playerAlive[1] global.pauseClient = 1;
            else if global.playerAlive[2] global.pauseClient = 2;
        }
    }
}

if (pauseKeyPressed)
{
    if (!global.pauseMenu) game_pause();
    else game_unpause();
}




///Game Quality Options

screen_update();

///Maximum Number of Shot Particles
global.count_particles = instance_number(fx_hit);

//Maximum Number of Shot Casings
//global.count_casings = instance_number(fx_casing) + instance_number(fx_blood);

///DEBUG COMMANDS and CHEATS 
if (debug_mode)
{
if keyboard_check_pressed(ord("M")) global.currentLoop++;

//Debug Endless Shop Portal
if keyboard_check_pressed(ord("N")) room_goto(room_endShop);

//Debug Endless Bounty
    if keyboard_check_pressed(ord("B")) global.bountyEndless += 500;
    
//Debug: Kill Everything
    if keyboard_check_pressed(vk_f9)
    {
        if instance_exists(class_enemy)
        {
            with (class_enemy)
            {
                instance_destroy();
            }
        }
    }

       
    //Debug: Stage Clear
    if keyboard_check_pressed(vk_f10)
    {
        debug_forceLevelExit = true;
    }

    

    ///Mute the Music
    
    if keyboard_check_pressed(ord("M"))
    {
        global.music = !global.music;
    }
    
    if (!global.music)
    {
        if audio_is_playing(bgm_main) audio_stop_sound(bgm_main);
        if audio_is_playing(bgm_shop) audio_stop_sound(bgm_shop);
        if audio_is_playing(bgm_stage1) audio_stop_sound(bgm_stage1);
        if audio_is_playing(bgm_stage2) audio_stop_sound(bgm_stage2);
        if audio_is_playing(bgm_stage3) audio_stop_sound(bgm_stage3);
        if audio_is_playing(bgm_stage4) audio_stop_sound(bgm_stage4);
    }
    
    ///Toggle Reflections
    if keyboard_check_pressed(vk_f5) global.reflections_toggle = !global.reflections_toggle;
    
    ///Toggle Persistent Objects
    if keyboard_check_pressed(vk_f6) global.persistent_toggle = !global.persistent_toggle;
    
    ///Toggle Shadows
    if keyboard_check_pressed(vk_f7) global.shadows_toggle = !global.shadows_toggle;
    
    //Toggle Joystick Aiming Options
    if keyboard_check_pressed(ord("P"))
    {
        if (global.auto_aim == K_AUTOAIM_ASSIST) global.auto_aim = K_AUTOAIM_FULL;
        else global.auto_aim = K_AUTOAIM_ASSIST;
    }
    
    //Toggle Debug Visualization of Pathfinding Grid
    if keyboard_check_pressed(vk_f11)
    {
        global.drawGridDebug = !global.drawGridDebug;
    }
	
    //Debug: Manually Restart the Game
    if keyboard_check_pressed(vk_f12)
    {
        save_and_clean();
        game_restart();
    }
    
    
    
    //Debug: Toggle Hud, comment this to deactivate
    main_hud_alpha = 0;
	
	//Debug: Kill Everything
    if keyboard_check_pressed(vk_f9)
    {
        if instance_exists(class_enemy)
        {
            with (class_enemy)
            {
                instance_destroy();
            }
        }
    } 

    //Debug: Erase Steam Achievements
    if keyboard_check_pressed(ord("U"))
    {
        steam_clear_achievement("ACHIEVEMENT_KILLCOMBO"); //set by gui_score
        steam_clear_achievement("ACHIEVEMENT_FIRSTRELIC"); //set by the 3 obj_shop_pineapple ... also on Main to award retroactively 
        steam_clear_achievement("ACHIEVEMENT_ALLRELICS"); //set by Main
        steam_clear_achievement("ACHIEVEMENT_UNLOCKALL"); //set by Create on controller_main
        steam_clear_achievement("ACHIEVEMENT_BEATGAME"); //set by Boss corpse
        steam_clear_achievement("ACHIEVEMENT_UNLOCKALLHUNTERS"); //set by Create on controller_main
        steam_clear_achievement("ACHIEVEMENT_UNLOCKRAFF"); //set by obj_teleporter
        steam_clear_achievement("ACHIEVEMENT_ULTIMATERAFF"); //set by Boss corpse
        steam_clear_achievement("ACHIEVEMENT_UNLOCKBIU"); //set by Boss corpse
        steam_clear_achievement("ACHIEVEMENT_UNLOCKPUNNY"); //set on Step event of controller_main
        steam_clear_achievement("ACHIEVEMENT_ULTIMATEPUNNY"); //dset by Boss corpse 
        steam_clear_achievement("ACHIEVEMENT_JIMMYNOWEAPONS");  //set by Boss corpse
        steam_clear_achievement("ACHIEVEMENT_BIUNOWEAPONS");  //set by Boss corpse
        steam_clear_achievement("ACHIEVEMENT_UNLOCKASS"); //set on Step event of controller_main
        steam_clear_achievement("ACHIEVEMENT_BEATGAMEWITHASS");  //set by Boss corpse
        steam_clear_achievement("ACHIEVEMENT_ULTIMATEPINKY");  //set by Boss corpse
        steam_clear_achievement("ACHIEVEMENT_TUTORIAL"); //set on dummy immortal
        steam_clear_achievement("ACHIEVEMENT_TEAMKILL"); //set on the Friendly Fire events (player projectile, sonic boom, melee arc)
        steam_clear_achievement("ACHIEVEMENT_BEATGAMECOOP"); //set by Boss corpse
        steam_clear_achievement("ACHIEVEMENT_ULTIMATECOOP");   //set by Boss corpse
        steam_clear_achievement("ACHIEVEMENT_FIRSTDIG"); //set by digSpot
        
        steam_clear_achievement("ACHIEVEMENT_FIRSTLOOP"); //set by Boss corpse
        steam_clear_achievement("ACHIEVEMENT_LOOP2_JIMMY"); //set by Boss corpse
        steam_clear_achievement("ACHIEVEMENT_LOOP2_PINKYY");//set by Boss corpse
        steam_clear_achievement("ACHIEVEMENT_LOOP2_RAFF");//set by Boss corpse
        steam_clear_achievement("ACHIEVEMENT_LOOP2_BIU");//set by Boss corpse
        steam_clear_achievement("ACHIEVEMENT_LOOP2_PUNNY");//set by Boss corpse
        steam_clear_achievement("ACHIEVEMENT_LOOP2_ACE");//set by Boss corpse
        steam_clear_achievement("ACHIEVEMENT_LOOP2_RIDER"); //set by Boss corpse
        steam_clear_achievement("ACHIEVEMENT_GUNNAR_3"); //set by Gunnar
        steam_clear_achievement("ACHIEVEMENT_GUNNAR_9"); //set by Gunnar
        steam_clear_achievement("ACHIEVEMENT_SAE_3"); // set by class_hack
        steam_clear_achievement("ACHIEVEMENT_RELICWEAPONS"); //set by class_player
        steam_clear_achievement("ACHIEVEMENT_LOOPS_50"); //set when I do currentLoop++ on controller_main
        steam_clear_achievement("ACHIEVEMENT_GUNNAR_360"); //set by Gunnar
        steam_clear_achievement("ACHIEVEMENT_SAE_200"); // set by class_hack
        steam_clear_achievement("ACHIEVEMENT_LOOP_NOBUY"); //set by Boss corpse
        steam_clear_achievement("ACHIEVEMENT_LOOP3"); //set by Boss corpse
        steam_clear_achievement("ACHIEVEMENT_RELICS_4"); //set by controller_main Step event
        
        steam_clear_achievement("ACHIEVEMENT_ENTER_SPOOKYLANDS"); //set by controller_main Create event
        steam_clear_achievement("ACHIEVEMENT_COMPLETE_SPOOKYLANDS"); //set by controller_main on the Level Exit script
        steam_clear_achievement("ACHIEVEMENT_EAT_CANDY"); //set by the candy pickup
        
        steam_clear_achievement("ACHIEVEMENT_UNLOCK_RIDER"); //set by the cage on its Destroy event;
        steam_clear_achievement("ACHIEVEMENT_DESTROY_KAMIKAGES"); //set by the cage on its Destroy event (alongside Steam Stat);
    }
}




///Take Screenshot
//steam_screenshot_check();

///Game Over
if (global.gameOver)
{
    //Load Steam Async
    if (global.isDaily) if (!instance_exists(controller_steamAsync)) instance_create_layer(0,0,"Controllers",controller_steamAsync);
    
    //TIPS
    if (gameOverHint == "")
    {
        if (global.statTotalDeaths <= 1) gameOverHint = loc_key("TIPS_FIRSTDEATH");
        else if (!global.totalDigs && global.gameMode == gamemode_adventure) gameOverHint = loc_key("TIPS_DIG");
        else if ((global.relic_pineapple_pudding || global.relic_alcoholic_carrot) && global.relic_slot[1] == "" && global.gameMode == gamemode_adventure) gameOverHint = loc_key("TIPS_RELIC");
        else{
        
            if (global.gameMode == gamemode_adventure){
                var randomHint = irandom_range(1,10);
                switch (randomHint){
                    case 1: gameOverHint = loc_key("TIPS_RANDOM1"); break;
                    case 2: gameOverHint = loc_key("TIPS_RANDOM2"); break;
                    case 3: gameOverHint = loc_key("TIPS_RANDOM3"); break;
                    case 4: gameOverHint = loc_key("TIPS_RANDOM4"); break;
                    case 5: gameOverHint = loc_key("TIPS_RANDOM5"); break;
                    case 6: gameOverHint = loc_key("TIPS_RANDOM6"); break;
                    case 7: gameOverHint = loc_key("TIPS_RANDOM7"); break;
                    case 8: gameOverHint = loc_key("TIPS_RANDOM8"); break;
                    case 9: gameOverHint = loc_key("TIPS_RANDOM9"); break;
                    case 10: gameOverHint = loc_key("TIPS_RANDOM10"); break;
                }
            }
            
            if (global.gameMode == gamemode_endless){
                var randomHint = irandom_range(1,7);
                switch (randomHint){
                    case 1: gameOverHint = loc_key("TIPS_ENDLESS1"); break;
                    case 2: gameOverHint = loc_key("TIPS_ENDLESS2"); break;
                    case 3: gameOverHint = loc_key("TIPS_ENDLESS3"); break;
                    case 4: gameOverHint = loc_key("TIPS_ENDLESS4"); break;
                    case 5: gameOverHint = loc_key("TIPS_ENDLESS5"); break;
                    case 6: gameOverHint = loc_key("TIPS_ENDLESS6"); break;
                    case 7: gameOverHint = loc_key("TIPS_ENDLESS7"); break;
                }
            }
        }
    }
    
    var wantToRestart = false;
    var wantToQuit = false;
    
    //Restart & Back to Menu
    var p = 1; while (p <= global.playerCount)
    {
        var input = global.input[p];
        
        if (input != K_INPUT_KEYBOARD && joy_check_pressed(input,1)) || ( input == K_INPUT_KEYBOARD && (keyboard_check(vk_space)))
        {
            wantToRestart = true;
            break;
        }
        
        if (input != K_INPUT_KEYBOARD && joy_check_pressed(input,2)) || ( input == K_INPUT_KEYBOARD && (keyboard_check(vk_escape)))
        {
            wantToQuit = true;
            break;
        }
  
        p++;
    }
    
    if (wantToRestart || wantToQuit)
    {
        //Update stats & reset Loop
        if (!global.statLongestRun || global.statRunTime > global.statLongestRun) global.statLongestRun = global.statRunTime;
        if (!global.scoreEndlessBest || global.scoreEndless > global.scoreEndlessBest) global.scoreEndlessBest = global.scoreEndless;
        if (!global.statBestLoop || global.currentLoop > global.statBestLoop) global.statBestLoop = global.currentLoop;
        
        if (global.isDaily)
        {
            global.dailyCompleted = string(current_day)+string(current_month)+string(current_year);
            global.dailyCompletedScore = global.scoreEndless;
            global.dailyCompletedBadge = global.dailyBadge;
        }
        
        global.currentLoop = 0;
        save_and_clean();
        
        //Resolve
        if (wantToRestart) && (!global.isDaily)
        {
            if (global.gameMode == gamemode_adventure) room_goto(room_start);
            else room_goto(level1_1);
        }
        else if (wantToQuit) || (global.isDaily)
        {
            game_restart();
        }
    }
}

///Unlock New Hunters + Achievements

if (global.statTotalBounty >= 80000) && (!global.unlockPunny)
{
    global.unlockPunny = true;
    achievement_give("ACHIEVEMENT_UNLOCKPUNNY");
    announce = instance_create_layer(x,y,"GUI",fx_bigMessage);
    announce.textBig = loc_key("HUD_UNLOCK_HUNTER");
    announce.textSmall = loc_key("HUD_UNLOCK_PUNNY");
    announce.hunterUnlockSprite = spr_hud_face_punny;
}

if (global.statKilledByBoss >= 5) && (!global.unlockAss)
{
    global.unlockAss = true;
    achievement_give("ACHIEVEMENT_UNLOCKASS");
    announce = instance_create_layer(x,y,"GUI",fx_bigMessage);
    announce.textBig = loc_key("HUD_UNLOCK_HUNTER");
    announce.textSmall = loc_key("HUD_UNLOCK_ASS");
    announce.hunterUnlockSprite = spr_hud_face_ass;
}

if (global.gameMode == gamemode_endless) && (!awarded4RelicsAchievement) {
    var countRelics = 0;
    if (global.relic_morning_star) countRelics++;
    if (global.relic_pineapple_pie) countRelics++;
    if (global.relic_rabbit_foot) countRelics++;
    if (global.relic_midnight_meal) countRelics++;
    if (global.relic_yottabyte_processor) countRelics++;
    if (global.relic_alcoholic_carrot) countRelics++;
    if (global.relic_yottabyte_drive)  countRelics++;
    if (global.relic_pineapple_pudding)  countRelics++;
    if (global.relic_infinity_battery)   countRelics++;
    if (global.relic_crystal_bacon) countRelics++;
    if (global.relic_midnight_beer) countRelics++;
    if (global.relic_watchful_eye) countRelics++;
    if (global.relic_dev_potion) countRelics++;
    if (global.relic_mega_quantum_chip) countRelics++;
    if (countRelics >= 4) {
        achievement_give("ACHIEVEMENT_RELICS_4");
        awarded4RelicsAchievement = true;
    }
}


///Count Game Time Every Second

timeCounter++

if (timeCounter >= room_speed)
{
    timeCounter = 0;
    global.statTotalTime++;
    
    if (!global.gameOver) && (!global.pauseMenu) global.statRunTime++;
}

///Edge Tracking for Enemies

var maxEdgeTrackingDistance = 1000;

if (!ds_exists(global.edgeTrackEnemyList,ds_type_list)) global.edgeTrackEnemyList = ds_list_create();
ds_list_clear(global.edgeTrackEnemyList);

if (instance_exists(class_enemy))
{
    var enemyCount = instance_number(class_enemy);
    for (var i=0; i<enemyCount; i++)
    {
        var enemy = instance_find(class_enemy,i);
        if (instance_exists(enemy)) 
        {
            if (!on_screen_offset(enemy.x,enemy.y,32)) 
            {
                var enemyDist = abs(point_distance(__view_get( e__VW.XView, 0 )+(__view_get( e__VW.WView, 0 )/2),__view_get( e__VW.YView, 0 )+(__view_get( e__VW.HView, 0 )/2),enemy.x,enemy.y));
                if (enemyDist <= maxEdgeTrackingDistance) 
                {
                    ds_list_add(global.edgeTrackEnemyList,enemy);
                }
            }
        }
    }
}


///Spawn Survival Wave Enemies

if ((!instance_exists(class_enemy)) && (!instance_exists(obj_kamikazelite_flying)) && (instance_exists(class_player)) && (global.survivalWaves))
{
    global.survivalWaves--;
    
    repeat(survivalWaveSize){
       if (!ds_list_empty(enemy_pool))
       {
            pick_random_group = irandom(ds_list_size(enemy_pool)-1);
            random_group = ds_list_find_value(enemy_pool,pick_random_group);
            ds_list_delete(enemy_pool,pick_random_group);
                
            current_group = ds_list_create();
            ds_list_copy(current_group, random_group);
                
            enemy_spawn_number = instance_number(obj_spawn_enemy);
            random_spawn = irandom(enemy_spawn_number-1);
            target_spawn = instance_find(obj_spawn_enemy,random_spawn);
                
            while (!ds_list_empty(current_group)) && (instance_exists(target_spawn))
            {
                spawnX = target_spawn.spawnX + random_range(-128,128);
                spawnY = target_spawn.spawnY + random_range(-128,128);
                    
                if collision_circle(spawnX,spawnY,40,class_solid,false,true) < 0 
                {
                    list_position = ds_list_size(current_group)-1;
                    spawnee = ds_list_find_value(current_group, list_position);
                    spawnedEnemy = instance_create_layer(spawnX,spawnY,"Interactive",spawnee);
                    
                    spawnedEnemy.ai_activation_range = 2000;
                    spawnedEnemy.ai_shutdown_range = 2000;
                    
                    ds_list_delete(current_group,list_position);
                }
            }
            
            ds_list_destroy(current_group);
            with (target_spawn) { instance_destroy(); }
       }
       else exit;
    }
}

///Daily Run Force Save
if (global.isDaily)
{
    global.dailyCompleted = stringCurrentDate;
    global.dailyCompletedScore = global.scoreEndless;
}

//*/