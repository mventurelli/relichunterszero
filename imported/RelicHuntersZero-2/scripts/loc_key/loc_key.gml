///loc_key(keyString);
//Gets the correct localized string with the given key
//requires loc_init() and global.loc_map

if (ds_exists(global.loc_map,ds_type_map))
{
    var key = ds_map_find_value(global.loc_map , argument0 );
    
    if (!is_undefined(key)) return string(key);
    else{
        show_debug_message("ERROR: Missing key "+argument0);
        return "MISSING_LANG";
    }
}
else{
    show_debug_message("ERROR: Trying to use non-existent global.loc_map");
    return "";
}
