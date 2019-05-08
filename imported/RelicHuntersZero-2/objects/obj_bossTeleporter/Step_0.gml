///Activate

event_inherited();

active = false;

if (canSummonBoss) || (global.stormPhase == K_STORMPHASE_CLEAR)
{
	active = true;
	
	if (instance_exists_fast(activationClient))
    {
        if (point_distance(x,y,activationClient.x,activationClient.y) <= range) { 
			in_range = true;    
			global.teleporterFound = true;
		}
		
        if (wantToActivate) && (in_range)
        {
			if (canSummonBoss)
			{
				spawn_storm_boss(x,y,true,true);
				if (room == level_storm_4) spawn_storm_boss(x,y,false,false);
				
				global.stormPhase = K_STORMPHASE_TIMER;
				canSummonBoss = false;
			}
			
			if (global.stormPhase == K_STORMPHASE_CLEAR)
			{
				global.currentDifficulty+=1;
				global.level_complete = true;
			}
		}
	}
}
