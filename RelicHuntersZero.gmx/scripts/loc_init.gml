///loc_init();
//Checks the current language and sets it for the whole game with the "global.loc_map" variable
//If the variable was not initialized at this point, initialize it first like this:
//          global.loc_map = noone;
//          loc_init();

ThisStringTestsForCharacters = 'áéíóúâêîôûãõäëïöüçàèìòù';

if (!ds_exists(global.loc_map,ds_type_map)) global.loc_map = ds_map_create();
else ds_map_clear(global.loc_map);

global.font_shopPrice = ftEN_shopPrice;
global.font_numberSmall = ftEN_numberSmall;
global.font_numberMedium = ftEN_numberMedium;
global.font_numberLarge = ftEN_numberLarge;
global.font_numberVeryLarge = ftEN_numberVeryLarge;
global.font_tinyText = ftEN_tinyText;
global.font_balloonText = ftEN_balloonText;
global.font_menuSmall = ftEN_menuSmall;
global.font_menuMedium = ftEN_menuMedium;
global.font_menuLarge = ftEN_menuLarge;
global.font_menuVeryLarge = ftEN_menuVeryLarge;
global.font_menuLargest = ftEN_menuLargest;

var targetColumn = 1;

if (global.language == lang_english) 
{
    targetColumn = lang_english;
}

if (global.language == lang_ptbr)
{
    targetColumn = lang_ptbr;
    global.font_numberSmall = ftBR_numberSmall;
    global.font_numberMedium = ftBR_numberMedium;
    global.font_numberLarge = ftBR_numberLarge;
    global.font_numberVeryLarge = ftBR_numberVeryLarge;
    global.font_tinyText = ftBR_tinyText;
    global.font_menuSmall = ftBR_menuSmall;
    global.font_menuMedium = ftBR_menuMedium;
    global.font_menuLarge = ftBR_menuLarge;
    global.font_menuLargest = ftBR_menuLargest;
}

if (global.language == lang_huebr)
{
    targetColumn = lang_huebr;
    global.font_menuLarge = ftBR_menuLarge;
}

if (global.language == lang_russian)
{
    targetColumn = lang_russian;
    global.font_menuLarge = ftJP_menuLarge;
}

if (global.language == lang_japanese)
{
    targetColumn = lang_japanese;
    global.font_menuLarge = ftJP_menuLarge;
}

if (global.language == lang_german)
{
    targetColumn = lang_german;
}

if (global.language == lang_french) 
{
    targetColumn = lang_french;
}

//Parse CSV File
var localization = file_text_open_read(working_directory+"/locSheet.csv");

while (!file_text_eof(localization))
{
    var rowString = file_text_readln(localization);
    var stringLength = string_length(rowString);
    
    var key = '';
    var text = '';
    var column = 0;
    
    for (var i=1; i<stringLength; i++)
    {
        var char = string_char_at(rowString,i);

        if !( (char == ',') && (string_char_at(rowString,i+1) != ' ') )
        {
            if (column == 0) key+=char;
            if (column == targetColumn) text+=char;
        }
        else column++;
        
        if (column > targetColumn) break;
    }
    
    //Remove quotation marks from the CSV and resolve
    var textLength = string_length(text)
    if (string_char_at(text,0) == '"') text = string_delete(text,1,1);
    if (string_char_at(text,textLength-1) == '"') text = string_delete(text,textLength-1,1);
    
    ds_map_add(global.loc_map,key,text);
}

file_text_close(localization);
