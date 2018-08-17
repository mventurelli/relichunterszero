///Text Time!

draw_self();


var textX = x+16;
var textY = y+24;
var numberX = textX + 240;
var numberY = textY;
var lineSpacing = 24;


draw_set_font(global.font_numberSmall);
draw_set_valign(fa_center);
draw_set_halign(fa_left);
draw_set_color(c_white);


draw_text(textX,textY,string_hash_to_newline(loc_key("STATS_TOTALTIME")));  textY+=lineSpacing;
draw_text(textX,textY,string_hash_to_newline(loc_key("STATS_TOTALBOUNTY")));  textY+=lineSpacing;
draw_text(textX,textY,string_hash_to_newline(loc_key("STATS_BEST_ENDLESS")));  textY+=lineSpacing;
draw_text(textX,textY,string_hash_to_newline(loc_key("STATS_KILLS")));  textY+=lineSpacing;
draw_text(textX,textY,string_hash_to_newline(loc_key("STATS_DEATHS")));  textY+=lineSpacing;
draw_text(textX,textY,string_hash_to_newline(loc_key("STATS_BOSSKILLS")));  textY+=lineSpacing;
draw_text(textX,textY,string_hash_to_newline(loc_key("STATS_BESTLOOP")));  textY+=lineSpacing;
draw_text(textX,textY,string_hash_to_newline(loc_key("STATS_RUN_FASTER")));  textY+=lineSpacing;
draw_text(textX,textY,string_hash_to_newline(loc_key("STATS_RUN_LONGEST")));  textY+=lineSpacing;


draw_text(numberX,numberY,string_hash_to_newline(playTimeString));          numberY+=lineSpacing;
draw_text(numberX,numberY,string_hash_to_newline(bountyString));            numberY+=lineSpacing;
draw_text(numberX,numberY,string_hash_to_newline(bestEndlessString));       numberY+=lineSpacing;
draw_text(numberX,numberY,string_hash_to_newline(killsString));             numberY+=lineSpacing;
draw_text(numberX,numberY,string_hash_to_newline(deathsString));            numberY+=lineSpacing;
draw_text(numberX,numberY,string_hash_to_newline(bossKillsString));         numberY+=lineSpacing;
draw_text(numberX,numberY,string_hash_to_newline(bestLoopString));          numberY+=lineSpacing;
draw_text(numberX,numberY,string_hash_to_newline(bestRunTimeString));       numberY+=lineSpacing;
draw_text(numberX,numberY,string_hash_to_newline(longestRunTimeString));    numberY+=lineSpacing;

