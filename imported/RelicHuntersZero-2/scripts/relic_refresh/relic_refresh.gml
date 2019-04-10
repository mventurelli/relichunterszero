///relic_refresh
//Checks the Relic List for all currently active Relics and create their GUI objects correctly

var diffSize = 0.024;
var basePosX = 0.5;
var basePosY = 0.95;
var list = global.relicList;

if (instance_exists(gui_relic_new)) with (gui_relic_new) instance_destroy();

if ds_exists(list,ds_type_list)
{
	var listSize = ds_list_size(list);
	var startPosX = basePosX - (diffSize/2 * (listSize-1));
	for (var i=0; i<listSize; i++;)
	{
		var currentRelic = ds_list_find_value(list,i);
		var gui = instance_create_layer(0,0,"GUI_Pause",gui_relic_new);
		gui.offsetX = startPosX + i*diffSize;
		gui.offsetY = basePosY;
		gui.relic = currentRelic;
		with (gui) event_perform(ev_other,ev_user0);
	}
}
else show_debug_message("ERROR: relic_refresh() failed to find global.relicList!");