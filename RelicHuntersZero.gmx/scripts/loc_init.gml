///loc_init();
//Checks the current language and sets it for the whole game with the "global.loc_map" variable
//If the variable was not initialized at this point, initialize it first like this:
//          global.loc_map = noone;
//          loc_init();

ThisStringTestsForCharacters = 'áéíóúâêîôûãõäëïöüçàèìòù';
ThisOneForCzechCharacters = 'úáůčýďžéěíňóřšť';

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

if (global.language == lang_russian)
{
    targetColumn = lang_russian;
    global.font_shopPrice = ftRU_shopPrice;
    global.font_numberSmall = ftRU_numberSmall;
    global.font_numberMedium = ftRU_numberMedium;
    global.font_numberLarge = ftRU_numberLarge;
    global.font_numberVeryLarge = ftRU_numberVeryLarge;
    global.font_tinyText = ftRU_tinyText;
    global.font_balloonText = ftRU_balloonText;
    global.font_menuSmall = ftRU_menuSmall;
    global.font_menuMedium = ftRU_menuMedium;
    global.font_menuLarge = ftRU_menuLarge;
    global.font_menuLargest = ftRU_menuLargest;
}

if (global.language == lang_japanese)
{
    targetColumn = lang_japanese;
    global.font_shopPrice = ftJP_shopPrice;
    global.font_numberSmall = ftJP_numberSmall;
    global.font_numberMedium = ftJP_numberMedium;
    global.font_numberLarge = ftJP_numberLarge;
    global.font_numberVeryLarge = ftJP_numberVeryLarge;
    global.font_tinyText = ftJP_tinyText;
    global.font_balloonText = ftJP_balloonText;
    global.font_menuSmall = ftJP_menuSmall;
    global.font_menuMedium = ftJP_menuMedium;
    global.font_menuLarge = ftJP_menuLarge;
    global.font_menuLargest = ftJP_menuLargest;
}

if (global.language == lang_german)
{
    targetColumn = lang_german;
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

if (global.language == lang_french) 
{
    targetColumn = lang_french;
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

if (global.language == lang_spanish) 
{
    targetColumn = lang_spanish;
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

if (global.language == lang_czech) 
{
    targetColumn = lang_czech;
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

if (global.language == lang_korean)
{
    targetColumn = lang_korean;
    global.font_shopPrice = ftKR_shopPrice;
    global.font_numberSmall = ftKR_numberSmall;
    global.font_numberMedium = ftKR_numberMedium;
    global.font_numberLarge = ftKR_numberLarge;
    global.font_numberVeryLarge = ftKR_numberVeryLarge;
    global.font_tinyText = ftKR_tinyText;
    global.font_balloonText = ftKR_balloonText;
    global.font_menuSmall = ftKR_menuSmall;
    global.font_menuMedium = ftKR_menuMedium;
    global.font_menuLarge = ftKR_menuLarge;
    global.font_menuVeryLarge = ftKR_menuVeryLarge;
    global.font_menuLargest = ftKR_menuLargest;
}

if (global.language == lang_dutch)
{
    targetColumn = lang_dutch;
}


if (global.language == lang_italian)
{
    targetColumn = lang_italian;
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


if (global.language == lang_chineseTr)
{
    targetColumn = lang_chineseTr;
    global.font_menuLarge = ftCH_menuLarge;
}


if (global.language == lang_chineseSp)
{
    targetColumn = lang_chineseSp;
    global.font_shopPrice = ftCH_menuLarge;
    global.font_numberSmall = ftCH_menuLarge;
    global.font_numberMedium = ftCH_menuLarge;
    global.font_numberLarge = ftCH_menuLarge;
    global.font_numberVeryLarge = ftCH_menuLarge;
    global.font_tinyText = ftCH_menuLarge;
    global.font_balloonText = ftCH_menuLarge;
    global.font_menuSmall = ftCH_menuLarge;
    global.font_menuMedium = ftCH_menuLarge;
    global.font_menuLarge = ftCH_menuLarge;
    global.font_menuLargest = ftCH_menuLarge;
}

if (global.language == lang_indonesian)
{
    targetColumn = lang_indonesian;
}

if (global.language == lang_polish)
{
    targetColumn = lang_polish;
}

if (global.language == lang_hungary)
{
    targetColumn = lang_hungary;
}

if (global.language == lang_thai)
{
    targetColumn = lang_thai;
}

if (global.language == lang_norwegian)
{
    targetColumn = lang_norwegian;
}

if (global.language == lang_danish)
{
    targetColumn = lang_danish;
}

if (global.language == lang_roumanian)
{
    targetColumn = lang_roumanian;
}

if (global.language == lang_pirate)
{
    targetColumn = lang_pirate;
}

if (global.language == lang_hebrew)
{
    targetColumn = lang_hebrew;
}

if (global.language == lang_swedish)
{
    targetColumn = lang_swedish;
}

if (global.language == lang_greek)
{
    targetColumn = lang_greek;
}

if (global.language == lang_vietnam)
{
    targetColumn = lang_vietnam;
}

if (global.language == lang_turkish)
{
    targetColumn = lang_turkish;
}

if (global.language == lang_arabic)
{
    targetColumn = lang_arabic;
}

if (global.language == lang_ptpt)
{
    targetColumn = lang_ptpt;
}

if (global.language == lang_suomi)
{
    targetColumn = lang_suomi;
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
