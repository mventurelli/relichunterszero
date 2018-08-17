///Create the lists
event_inherited();

//Enemy Group Design (Spawns Everything Within the Group)

    ducan_turtlesquad1_1 = ds_list_create();
    ds_list_add(ducan_turtlesquad1_1, obj_turtle1,obj_turtle1,obj_turtle1);
    
    ducan_turtlesquad1_2 = ds_list_create();
    ds_list_add(ducan_turtlesquad1_2, obj_turtle1,obj_turtle1,obj_turtle1,obj_turtle1_shotgun);
    
    ducan_turtlesquad1_3 = ds_list_create();
    ds_list_add(ducan_turtlesquad1_3, obj_duck1,obj_turtle1_pistoleer,obj_turtle1_pistoleer,obj_turtle1_pistoleer);
    
    ducan_turtlesquad2_1 = ds_list_create();
    ds_list_add(ducan_turtlesquad2_1, obj_turtle2, obj_turtle2_assaultpistol, obj_turtle2, obj_turtle2_shotgun );
    
    ducan_turtlesquad2_2 = ds_list_create();
    ds_list_add(ducan_turtlesquad2_2, obj_turtle2_submachinegun, obj_turtle2_submachinegun, obj_turtle2_submachinegun, obj_turtle2_shotgun );
    
    ducan_turtlesquad3_1 = ds_list_create();
    ds_list_add(ducan_turtlesquad3_1, obj_turtle3, obj_turtle3, obj_turtle3, obj_turtle3 );
    
    ducan_turtlesniper = ds_list_create();
    ds_list_add(ducan_turtlesniper, obj_turtle3_sniper );
    
    /// /// /// ///
    
    ducan_ducksquad1_1 = ds_list_create();
    ds_list_add(ducan_ducksquad1_1, obj_duck1,obj_turtle1,obj_turtle1,obj_turtle1_shotgun);
    
    ducan_ducksquad1_2 = ds_list_create();
    ds_list_add(ducan_ducksquad1_2, obj_duck1_submachinegun,obj_turtle1,obj_turtle1_pistoleer,obj_turtle1_shotgun);
    
    ducan_ducksquad1_3 = ds_list_create();
    ds_list_add(ducan_ducksquad1_3, obj_duck1_submachinegun,obj_duck1,obj_turtle1,obj_turtle1_shotgun);
    
    ducan_ducksquad2_1 = ds_list_create();
    ds_list_add(ducan_ducksquad2_1, obj_duck2_heavy, obj_turtle1_pistoleer, obj_turtle1_pistoleer, obj_turtle2_shotgun);
    
    ducan_ducksquad2_2 = ds_list_create();
    ds_list_add(ducan_ducksquad2_2, obj_duck2_submachinegun, obj_duck1, obj_duck1, obj_turtle2_assaultpistol);
    
    ducan_ducksquad2_3 = ds_list_create();
    ds_list_add(ducan_ducksquad2_3, obj_duck2_shotgun, obj_turtle2_submachinegun, obj_turtle2_submachinegun, obj_turtle2_submachinegun);
    
    ducan_ducksquad3_1 = ds_list_create();
    ds_list_add(ducan_ducksquad3_1, obj_duck3, obj_duck2_shotgun, obj_duck2_shotgun, obj_turtle3);
    
    ducan_ducksquad3_2 = ds_list_create();
    ds_list_add(ducan_ducksquad3_2, obj_duck3_rocket, obj_turtle3, obj_turtle3);
    
    /// /// /// ///
    
    monster_kamikaze_1 = ds_list_create();
    ds_list_add(monster_kamikaze_1, obj_kamikaze1, obj_kamikaze1, obj_kamikaze1, obj_kamikaze1, obj_kamikaze1 );
    
    monster_kamikaze_2 = ds_list_create();
    ds_list_add(monster_kamikaze_2, obj_kamikazelite, obj_kamikazelite, obj_kamikazelite, obj_kamikazelite, obj_kamikazelite );
    
    monster_kamikaze_3 = ds_list_create();
    ds_list_add(monster_kamikaze_3, obj_kamitank, obj_kamikaze1, obj_kamikaze1, obj_kamikazelite, obj_kamikazelite );
    
    


///Create the pool depending on room

enemyPool = ds_list_create();

switch (room)
{
    case level1_1:
        ds_list_add(enemyPool, ducan_turtlesquad1_1, ducan_turtlesquad1_1, ducan_turtlesquad1_1, ducan_turtlesquad1_1 );
        //ds_list_add(enemyPool, monster_kamikaze_3, monster_kamikaze_3, monster_kamikaze_3, monster_kamikaze_3 );
        break;
        
    case level1_2:
        ds_list_add(enemyPool, ducan_ducksquad1_1, ducan_turtlesquad1_1, ducan_turtlesquad1_1, ducan_turtlesquad1_1, ducan_turtlesquad1_2 );
        break;
    
    case level1_3:
        ds_list_add(enemyPool, ducan_turtlesquad1_2, monster_kamikaze_1, monster_kamikaze_1, monster_kamikaze_1, monster_kamikaze_1, monster_kamikaze_1 );
        break;    

    case level2_1:
        ds_list_add(enemyPool, ducan_turtlesquad1_3, ducan_ducksquad1_1, ducan_ducksquad1_1, ducan_ducksquad1_2, ducan_turtlesquad2_1 );
        break;
        
    case level2_2:
        ds_list_add(enemyPool, ducan_ducksquad1_3, ducan_ducksquad1_2, ducan_ducksquad1_2, ducan_ducksquad1_1 );
        break;
        
    case level2_3:
        ds_list_add(enemyPool, ducan_ducksquad2_1, ducan_ducksquad1_3, ducan_turtlesquad2_1, ducan_turtlesquad2_1, ducan_turtlesquad2_2 );
        break;
        
    case level3_1:
        ds_list_add(enemyPool, ducan_ducksquad2_3, monster_kamikaze_1, monster_kamikaze_1, monster_kamikaze_1, monster_kamikaze_2, monster_kamikaze_2 );
        break;
        
    case level3_2:
        ds_list_add(enemyPool, monster_kamikaze_2, monster_kamikaze_2, monster_kamikaze_2, monster_kamikaze_2, ducan_ducksquad2_2, ducan_ducksquad2_3, ducan_ducksquad2_1);
        break;
        
    case level3_3:
        ds_list_add(enemyPool, monster_kamikaze_3, ducan_ducksquad2_2, ducan_ducksquad2_1, ducan_ducksquad2_3, ducan_turtlesquad3_1, ducan_turtlesquad3_1);
        break;
    
    case level4_1:
        ds_list_add(enemyPool, ducan_turtlesquad3_1, ducan_turtlesquad3_1, ducan_turtlesquad3_1, ducan_turtlesniper, ducan_turtlesniper, ducan_turtlesniper, ducan_turtlesniper);
        break;
        
    case level4_2:
        ds_list_add(enemyPool, ducan_turtlesquad3_1, ducan_turtlesquad3_1, ducan_ducksquad2_1, ducan_ducksquad3_1, ducan_ducksquad3_1);
        break;
        
    case level4_3:
        ds_list_add(enemyPool, ducan_turtlesquad3_1, ducan_ducksquad3_1, ducan_ducksquad3_1, ducan_ducksquad3_2, ducan_ducksquad3_2);
        break;
}
     

///Add everything to cleanUp list

if (ds_exists(cleanUp,ds_type_list))
{
    ds_list_add(cleanUp, ducan_turtlesquad1_1);
    ds_list_add(cleanUp, ducan_turtlesquad1_2);
    ds_list_add(cleanUp, ducan_turtlesquad1_3);
    ds_list_add(cleanUp, ducan_turtlesquad2_1);
    ds_list_add(cleanUp, ducan_turtlesquad2_2);
    ds_list_add(cleanUp, ducan_turtlesquad3_1);
    ds_list_add(cleanUp, ducan_turtlesniper);
    ds_list_add(cleanUp, ducan_ducksquad1_1);
    ds_list_add(cleanUp, ducan_ducksquad1_2);
    ds_list_add(cleanUp, ducan_ducksquad1_3);
    ds_list_add(cleanUp, ducan_ducksquad2_1);
    ds_list_add(cleanUp, ducan_ducksquad2_2);
    ds_list_add(cleanUp, ducan_ducksquad2_3);
    ds_list_add(cleanUp, ducan_ducksquad3_1);
    ds_list_add(cleanUp, ducan_ducksquad3_2);
    ds_list_add(cleanUp, monster_kamikaze_1);
    ds_list_add(cleanUp, monster_kamikaze_2);
    ds_list_add(cleanUp, monster_kamikaze_3);
    
    ds_list_add(cleanUp, enemyPool);
}

