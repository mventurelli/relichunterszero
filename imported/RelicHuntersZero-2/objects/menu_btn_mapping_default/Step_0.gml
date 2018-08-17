///Button Action
event_inherited();

if (executeAction)
{
    ini_open( working_directory + "\\saveData.ini" );
    ini_section_delete( "Mapping" );
    ini_close();
    save_sync_read();
    executeAction = false;
    show_debug_message("All keys reset to Default");
    room_goto(room_mapping);
}

