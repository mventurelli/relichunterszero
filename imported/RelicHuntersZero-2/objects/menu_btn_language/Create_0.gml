///Button Config

event_inherited();
isAvailable = true;
myBoxSprite = spr_toggle_box_small;

if (global.language == lang_english) myVariable = lang_english;
if (global.language == lang_ptbr) myVariable = lang_ptbr;
if (global.language == lang_huebr) myVariable = lang_huebr;
if (global.language == lang_russian) myVariable = lang_russian;
if (global.language == lang_japanese) myVariable = lang_japanese;
if (global.language == lang_german) myVariable = lang_german;
if (global.language == lang_french) myVariable = lang_french;
if (global.language == lang_spanish) myVariable = lang_spanish;
if (global.language == lang_czech) myVariable = lang_czech;
if (global.language == lang_korean) myVariable = lang_korean;
if (global.language == lang_dutch) myVariable = lang_dutch;
if (global.language == lang_italian) myVariable = lang_italian;
//if (global.language == lang_chineseTr) myVariable = lang_chineseTr;
//if (global.language == lang_chineseSp) myVariable = lang_chineseSp;

myVariableMax = lang_italian; //<--- put the last language on the list here

labelString = loc_key("SETTINGS_LANGUAGE");
myValueString = string(myVariable);

textOffsetX = (point_distance(x,y,bbox_right,y)) - 62;
textOffsetY = 0;

starPositionX = -1 * (point_distance(x,y,bbox_right,y)) + 32;
starPositionY = 0;

