///Activate
if (activationClient != noone) && (full_relic) && (active)
{
    if (point_distance(x,y,activationClient.x,activationClient.y) <= range) in_range = true;  
    
    if (wantToActivate) && (in_range)
    { 
        toggle = true;
        if (instance_exists(class_gui_dynamic_relic)) with (class_gui_dynamic_relic) timedActive = true;
    }
}

///myTable

if (myTable == noone) {
	myTable = instance_nearest(x,y,obj_altar_relic);
}
else 
{
    if (full_relic) && (active) && (equipped) myTable.active = true;
    else myTable.active = false;
}

