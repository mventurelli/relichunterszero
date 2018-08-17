///Button Action
event_inherited();

if (executeAction)
{
    ini_open(working_directory + "\\saveData.ini");
    ini_write_real("Input","Input1",global.input[1]);
    ini_close();
    
    room_goto(room_credits);
}

