///score_add(points,is_headshot)
var gui


if (global.gameMode == gamemode_adventure) global.score_total += argument0;
else if (global.gameMode == gamemode_endless) 
{
    global.bountyEndless += argument0;
    global.scoreEndless += argument0;
}
global.statTotalBounty += argument0;
 
gui = instance_create(0,0,gui_score);
gui.value += argument0;
gui.kill_count++;
global.statKills++;
if (argument1) gui.headshot = true;
else gui.headshot = false;
