///Button Action
event_inherited();

if (executeAction)
{
    if file_exists(working_directory + "\\saveData.ini")
    {
        file_delete(working_directory + "\\saveData.ini");
    }

    room_goto(room_menu);
}

