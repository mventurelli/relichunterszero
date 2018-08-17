///Interaction Override

if (activationClient != noone) && (active)
{
    if (point_distance(x,y,activationClient.x,activationClient.y) <= range) in_range = true;  

    else in_range = false;
    
    if (wantToActivate) && (in_range)
    { 
        save_and_clean();
    
        if (room == room_tutorial)
        {
            global.tutorial_done = 1;
            ini_open(working_directory + "\\saveData.ini");
            ini_write_real("Ass","tutorial",1);
            ini_close();
            room_goto(room_start);
        }
        else room_goto(room_tutorial);
    }
}
else in_range = false;

