///score_add(points,is_headshot)

if (global.gameMode == gamemode_adventure) global.score_total += argument0;
else if (global.gameMode == gamemode_endless) 
{
    global.bountyEndless += argument0;
    global.scoreEndless += argument0;
}
global.statTotalBounty += argument0;
 

//show score
var layer_id = layer_get_id("GUI");
layer_add_instance(layer_id, global.guiScore);
global.statKills++; 
with (global.guiScore) {
	showScore = true;
	orientation = 0; //0=growth, 1=shrink, 2=stable
	size_current = size_start;
	size_speed_current = 0;
	duration_current = 0;
	coin = false;
	setup = false;	
	
	value += argument0;
	kill_count++;

	if (argument1) 
		headshot = true;
	else 
		headshot = false;
}
