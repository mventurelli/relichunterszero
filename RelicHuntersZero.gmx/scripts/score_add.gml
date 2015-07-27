///score_add(points,is_headshot)
var gui

global.score_total += argument0;
global.statTotalBounty += argument0;
 
gui = instance_create(0,0,gui_score);
gui.value += argument0;
gui.kill_count++;
if (argument1) gui.headshot = true;
else gui.headshot = false;
