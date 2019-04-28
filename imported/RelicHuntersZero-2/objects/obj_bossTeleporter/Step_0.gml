///Activate

event_inherited();

active = false;

if (canSummonBoss) || (global.stormPhase == K_STORMPHASE_CLEAR)
{
	active = true;
	
	if (instance_exists_fast(activationClient))
    {
        if (point_distance(x,y,activationClient.x,activationClient.y) <= range) in_range = true;    
        
        if (wantToActivate) && (in_range)
        {
			if (canSummonBoss)
			{
				var boss = instance_create_layer(x,y,"Interactive",fx_enemyTeleport);
				boss.enemy = obj_krekStorm;
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
