///Create the lists
event_inherited();

//Enemy Group Design (Spawns Everything Within the Group)

//Rotation A1 (Ducans)
A1_1_smallTurtles = ds_list_create();
ds_list_add(A1_1_smallTurtles, obj_turtle1, obj_turtle1, obj_turtle1, obj_turtle1);

A1_2_smallTurtlesWithShotgun = ds_list_create();
ds_list_add(A1_2_smallTurtlesWithShotgun, obj_turtle1, obj_turtle1, obj_turtle1, obj_turtle1_shotgun);

A1_3_oneDucanSquad = ds_list_create();
ds_list_add(A1_3_oneDucanSquad, obj_duck1, obj_turtle1_pistoleer, obj_turtle1_pistoleer, obj_turtle1_pistoleer);

//Rotation A2 (Ducans)
A2_1_advancedTurtles = ds_list_create();
ds_list_add(A2_1_advancedTurtles, obj_turtle2, obj_turtle2_assaultpistol, obj_turtle2, obj_turtle2_shotgun );
	
A2_2_smgDuck = ds_list_create();
ds_list_add(A2_2_smgDuck, obj_duck1_submachinegun,obj_turtle1,obj_turtle1_pistoleer,obj_turtle1_shotgun);

A2_3_heavyPistolDuck = ds_list_create();
ds_list_add(A2_3_heavyPistolDuck, obj_duck2_heavy, obj_turtle1_pistoleer, obj_turtle1_pistoleer, obj_turtle2_shotgun);

//Rotation A3 (Ducans)
A3_1_turtleMachinegunners = ds_list_create();
ds_list_add(A3_1_turtleMachinegunners, obj_turtle3, obj_turtle3, obj_turtle3, obj_turtle3 );

A3_2_turtleSniper = ds_list_create();
ds_list_add(A3_2_turtleSniper, obj_turtle3_sniper );

A3_3_duckSquad = ds_list_create();
ds_list_add(A3_3_duckSquad, obj_duck2_shotgun, obj_turtle3, obj_turtle2_submachinegun, obj_duck2_heavy);

//Rotation A4 (Ducans)
A4_1_turtleBigMachinegunSquad = ds_list_create();
ds_list_add(A4_1_turtleBigMachinegunSquad, obj_turtle3, obj_turtle3, obj_turtle3, obj_turtle3, obj_turtle3 );

A4_2_duckAssaultRifle = ds_list_create();
ds_list_add(A4_2_duckAssaultRifle, obj_duck3, obj_duck2_shotgun, obj_duck2_shotgun, obj_turtle3);
    
A4_3_duckRocket = ds_list_create();
ds_list_add(A4_3_duckRocket, obj_duck3_rocket, obj_turtle3, obj_turtle3);
	
	
//Rotation B1 (Kami)
B1_1_kamikaze = ds_list_create();
ds_list_add(B1_1_kamikaze, obj_kamikaze1, obj_kamikaze1, obj_kamikaze1, obj_kamikaze1, obj_kamikaze1, obj_kamikaze1, obj_kamikaze1 );



//Rotation C1 (Undead)
C1_1_spookyZombies = ds_list_create();
ds_list_add(C1_1_spookyZombies, obj_zombieTurtle, obj_zombieTurtle, obj_zombieTurtle, obj_zombieTurtle, obj_zombieTurtle );

    /*
    /// /// /// ///
    
    monster_kamikaze_1 = ds_list_create();
    ds_list_add(monster_kamikaze_1, obj_kamikaze1, obj_kamikaze1, obj_kamikaze1, obj_kamikaze1, obj_kamikaze1, obj_kamikaze1, obj_kamikaze1 );
    
    monster_kamikaze_2 = ds_list_create();
    ds_list_add(monster_kamikaze_2, obj_kamikazelite, obj_kamikazelite, obj_kamikazelite, obj_kamikazelite, obj_kamikazelite );
    
    monster_kamikaze_3 = ds_list_create();
    ds_list_add(monster_kamikaze_3, obj_kamikaze1, obj_kamikaze1, obj_kamikaze1, obj_kamikaze1, obj_kamikazelite, obj_kamikazelite );			//OLD: had a obj_kamitank
    
    /// /// /// ///
    
    elite_turtles = ds_list_create();
    ds_list_add(elite_turtles, obj_turtle3_plasma, obj_turtle3_plasma, obj_turtle3_plasma, obj_turtle3_plasma );
    
    elite_plasma = ds_list_create();
    ds_list_add(elite_plasma, obj_turtle3_plasma, obj_turtle3_plasma, obj_turtle3_plasma, obj_ducanElite_plasma );
    
    elite_plasma_2 = ds_list_create();
    ds_list_add(elite_plasma, obj_ducanElite_plasma, obj_ducanElite_plasma );
    
    elite_shotgun = ds_list_create();
    ds_list_add(elite_shotgun, obj_ducanElite_shotgun, obj_ducanElite_shotgun );
    
    elite_squad_1 = ds_list_create();
    ds_list_add(elite_squad_1, obj_ducanElite_rifle, obj_ducanElite_shotgun);
    
    elite_squad_2 = ds_list_create();
    ds_list_add(elite_squad_1, obj_ducanElite_rifle, obj_ducanElite_rifle, obj_ducanElite_rifle);
    
    elite_sniper = ds_list_create();
    ds_list_add(elite_sniper, obj_ducanElite_sniper );
    
    elite_sniper_2 = ds_list_create();
    ds_list_add(elite_sniper, obj_ducanElite_sniper, obj_ducanElite_sniper );
    
    elite_rocket = ds_list_create();
    ds_list_add(elite_rocket, obj_ducanElite_shotgun, obj_ducanElite_rocket);
    
    elite_rocket_2 = ds_list_create();
    ds_list_add(elite_rocket_2, obj_ducanElite_rifle, obj_ducanElite_rifle, obj_ducanElite_rocket);
    
    elite_rocket_3 = ds_list_create();
    ds_list_add(elite_rocket_3, obj_ducanElite_rocket, obj_ducanElite_rocket);
    
    /// /// /// ///
    
    spooky_worms = ds_list_create();
    ds_list_add(spooky_worms, obj_wormTurtle, obj_wormTurtle, obj_wormTurtle );
    
    spooky_zombies_1 = ds_list_create();
    ds_list_add(spooky_zombies_1, obj_zombieTurtle, obj_zombieTurtle, obj_zombieTurtle, obj_zombieTurtle, obj_zombieTurtle );
    
    spooky_zombies_2 = ds_list_create();
    ds_list_add(spooky_zombies_2, obj_wormTurtle, obj_zombieTurtle, obj_zombieTurtle, obj_zombieTurtle, obj_zombieTurtle, obj_zombieTurtle );
    
    spooky_shooters_1 = ds_list_create();
    ds_list_add(spooky_shooters_1, obj_zombieTurtle, obj_zombieTurtle, obj_zombieTurtlePistol, obj_zombieTurtlePistol, obj_zombieTurtle );
    
    spooky_shooters_2 = ds_list_create();
    ds_list_add(spooky_shooters_2, obj_zombieTurtlePistol, obj_zombieTurtlePistol, obj_zombieTurtleReaper );
    
    spooky_shooters_3 = ds_list_create();
    ds_list_add(spooky_shooters_3, obj_wormTurtle, obj_zombieTurtle, obj_zombieTurtle, obj_zombieTurtleReaper, obj_zombieTurtleReaper );
    */


///Create the pool depending on room

enemyPool = ds_list_create();

if (global.spawnRotation <= 1) // Rotation A, Ducans
{
	if (global.currentDifficulty <= K_DIFFICULTY_EASY) 
		ds_list_add(enemyPool, A1_1_smallTurtles, A1_1_smallTurtles, A1_1_smallTurtles, A1_3_oneDucanSquad, A1_2_smallTurtlesWithShotgun, A1_2_smallTurtlesWithShotgun );
	else if (global.currentDifficulty <= K_DIFFICULTY_HARD) 
		ds_list_add(enemyPool, A2_1_advancedTurtles, A2_1_advancedTurtles, A2_1_advancedTurtles, A2_2_smgDuck, A2_2_smgDuck, A2_3_heavyPistolDuck ); 
	else if (global.currentDifficulty <= K_DIFFICULTY_EXTREME) 
		ds_list_add(enemyPool, A3_1_turtleMachinegunners, A3_1_turtleMachinegunners, A3_1_turtleMachinegunners, A3_3_duckSquad, A3_3_duckSquad, A3_2_turtleSniper );
	else if (global.currentDifficulty <= K_DIFFICULTY_LEGENDARY) 
		ds_list_add(enemyPool, A4_1_turtleBigMachinegunSquad, A4_1_turtleBigMachinegunSquad, A4_1_turtleBigMachinegunSquad, A4_2_duckAssaultRifle, A4_2_duckAssaultRifle, A4_3_duckRocket );
	else 
		ds_list_add(enemyPool, A4_1_turtleBigMachinegunSquad, A4_1_turtleBigMachinegunSquad, A4_1_turtleBigMachinegunSquad, A4_2_duckAssaultRifle, A4_2_duckAssaultRifle, A4_3_duckRocket );
}
else if (global.spawnRotation == 2) // Rotation B, Kami
{
	ds_list_add(enemyPool, B1_1_kamikaze );
}
else if (global.spawnRotation == 3) // Rotation C, Undead
{	
	ds_list_add(enemyPool, C1_1_spookyZombies );
}

///Add everything to cleanUp list

if (ds_exists(cleanUp,ds_type_list))
{
    ds_list_add(cleanUp, A1_1_smallTurtles);
    ds_list_add(cleanUp, A1_2_smallTurtlesWithShotgun);
	ds_list_add(cleanUp, A1_3_oneDucanSquad);
	ds_list_add(cleanUp, A2_1_advancedTurtles);
	ds_list_add(cleanUp, A2_2_smgDuck);
	ds_list_add(cleanUp, A2_3_heavyPistolDuck);
	ds_list_add(cleanUp, A3_1_turtleMachinegunners);
	ds_list_add(cleanUp, A3_2_turtleSniper);
	ds_list_add(cleanUp, A3_3_duckSquad);
	ds_list_add(cleanUp, A4_1_turtleBigMachinegunSquad);
	ds_list_add(cleanUp, A4_2_duckAssaultRifle);
	ds_list_add(cleanUp, A4_3_duckRocket);
	
	ds_list_add(cleanUp, B1_1_kamikaze);
    
	ds_list_add(cleanUp, C1_1_spookyZombies);
	
    ds_list_add(cleanUp, enemyPool);
}

