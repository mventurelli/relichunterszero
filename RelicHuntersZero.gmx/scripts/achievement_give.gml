///achievement_give(string);
//awards the Steam Achievement

var achString = argument0;

if !steam_get_achievement(achString) 
{
    steam_set_achievement(achString);
    show_debug_message('Awarded the '+achString+' achievement');
}
else show_debug_message('Tried to award the '+achString+' achievement, but player already has it.');
