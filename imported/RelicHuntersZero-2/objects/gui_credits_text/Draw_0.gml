///Text

draw_set_alpha(blackAlpha*0.75);
draw_set_color(make_color_rgb(48,32,0));
draw_rectangle(0,0,1280,720,false);

draw_set_alpha(1);
draw_set_halign(fa_center);
draw_set_valign(fa_center);

var lineSpacing = 21;
var currentSpacing = 0;

draw_set_font(global.font_menuMedium);

//Endless Mode
if (room==room_end)
{
    draw_set_colour(c_white);
    draw_text(x,y+currentSpacing,string_hash_to_newline("THIS ADVENTURE HAS ENDED")); currentSpacing+=lineSpacing;
    currentSpacing += 2*lineSpacing;
    draw_text(x,y+currentSpacing,string_hash_to_newline("BUT OTHER WORLDS AWAIT YOU")); currentSpacing+=lineSpacing;
    currentSpacing += 4*lineSpacing;
    currentSpacing += 3*lineSpacing;
    draw_set_font(global.font_menuLargest);
    draw_set_colour(make_color_rgb(242,50,129));
    draw_text(x,y+currentSpacing,string_hash_to_newline("ENDLESS MODE")); currentSpacing+=lineSpacing;
    currentSpacing+=lineSpacing;
    draw_set_font(global.font_menuLarge);
    draw_set_colour(c_white);
    draw_text(x,y+currentSpacing,string_hash_to_newline("IS NOW AVAILABLE")); currentSpacing+=lineSpacing;
    currentSpacing += 4*lineSpacing;
    currentSpacing += 4*lineSpacing;
}

//Developed by
draw_set_font(global.font_menuMedium);
draw_set_colour(make_color_rgb(0,253,113));
draw_text(x,y+currentSpacing,string_hash_to_newline("DEVELOPED BY ROGUE SNAIL")); currentSpacing+=lineSpacing;

currentSpacing+=lineSpacing;

draw_set_colour(c_white);
draw_text(x,y+currentSpacing,string_hash_to_newline("Art by Betu Souza")); currentSpacing+=lineSpacing;
draw_text(x,y+currentSpacing,string_hash_to_newline("Design and Code by Mark Venturelli")); currentSpacing+=lineSpacing;
draw_text(x,y+currentSpacing,string_hash_to_newline("Sound Design by Raphael Muller")); currentSpacing+=lineSpacing;
draw_text(x,y+currentSpacing,string_hash_to_newline("Code by Luiz Henrique Gama")); currentSpacing+=lineSpacing;
currentSpacing+=lineSpacing;
draw_text(x,y+currentSpacing,string_hash_to_newline("Music by Anders \"Goto80\" Carlsson")); currentSpacing+=lineSpacing;
draw_text(x,y+currentSpacing,string_hash_to_newline("Additional Sound Design by Hermann Rauth")); currentSpacing+=lineSpacing;
draw_text(x,y+currentSpacing,string_hash_to_newline("\"Dig Dig Joy\" track by Raphael Muller")); currentSpacing+=lineSpacing;

currentSpacing += 4*lineSpacing;

//Published by
draw_set_colour(make_color_rgb(255,106,30));
draw_text(x,y+currentSpacing,string_hash_to_newline("PUBLISHED BY ZUEIRA DIGITAL")); currentSpacing+=lineSpacing;

currentSpacing+=lineSpacing;

draw_set_colour(c_white);
draw_text(x,y+currentSpacing,string_hash_to_newline("Anderson Vermonde . Public Relations")); currentSpacing+=lineSpacing;
draw_text(x,y+currentSpacing,string_hash_to_newline("Bruno Bulhoes . Account Manager")); currentSpacing+=lineSpacing;
draw_text(x,y+currentSpacing,string_hash_to_newline("Ingrid Skare . Project Manager")); currentSpacing+=lineSpacing;
draw_text(x,y+currentSpacing,string_hash_to_newline("Mauricio Perin . Design and Business")); currentSpacing+=lineSpacing;
currentSpacing += 4*lineSpacing;

//Collaborators
draw_set_colour(make_color_rgb(242,50,129));
draw_text(x,y+currentSpacing,string_hash_to_newline("OPEN SOURCE CONTRIBUTORS")); currentSpacing+=lineSpacing;

currentSpacing+=lineSpacing;

draw_set_colour(c_white);
draw_text(x,y+currentSpacing,string_hash_to_newline("Luca-Leon Happel")); currentSpacing+=lineSpacing;
draw_text(x,y+currentSpacing,string_hash_to_newline("Jonathan Quach")); currentSpacing+=lineSpacing;
draw_text(x,y+currentSpacing,string_hash_to_newline("Alexander Drogin")); currentSpacing+=lineSpacing;
currentSpacing += 4*lineSpacing;

//Thanks to
draw_set_colour(make_color_rgb(250,253,0));
draw_text(x,y+currentSpacing,string_hash_to_newline("THIS GAME WOULD NOT HAVE BEEN POSSIBLE WITHOUT")); currentSpacing+=lineSpacing;

currentSpacing+=lineSpacing;

draw_set_colour(c_white);
draw_text(x,y+currentSpacing,string_hash_to_newline("Abraao Santana")); currentSpacing+=lineSpacing;
draw_text(x,y+currentSpacing,string_hash_to_newline("Behold Studios")); currentSpacing+=lineSpacing;
draw_text(x,y+currentSpacing,string_hash_to_newline("BRKsEDU")); currentSpacing+=lineSpacing;
draw_text(x,y+currentSpacing,string_hash_to_newline("Daniel Silveira")); currentSpacing+=lineSpacing;
draw_text(x,y+currentSpacing,string_hash_to_newline("Goto80")); currentSpacing+=lineSpacing;
draw_text(x,y+currentSpacing,string_hash_to_newline("Hermann Rauth")); currentSpacing+=lineSpacing;
draw_text(x,y+currentSpacing,string_hash_to_newline("Raphael Muller")); currentSpacing+=lineSpacing;
currentSpacing+=lineSpacing;
draw_text(x,y+currentSpacing,string_hash_to_newline("The beautiful people at zueira digital")); currentSpacing+=lineSpacing;
draw_text(x,y+currentSpacing,string_hash_to_newline("Everyone who voted for us on greenlight")); currentSpacing+=lineSpacing;
draw_text(x,y+currentSpacing,string_hash_to_newline("Our amazing beta testers")); currentSpacing+=lineSpacing;
draw_text(x,y+currentSpacing,string_hash_to_newline("Our incredible community")); currentSpacing+=lineSpacing;
draw_text(x,y+currentSpacing,string_hash_to_newline("Our loved ones")); currentSpacing+=lineSpacing;

currentSpacing += 7*lineSpacing;


//Thanks for playing
draw_set_font(global.font_menuLargest);
draw_set_colour(make_color_rgb(242,50,129));
draw_text(x,y+currentSpacing,string_hash_to_newline("THANKS FOR PLAYING")); currentSpacing+=lineSpacing;
currentSpacing += 5*lineSpacing;

//Open Source
draw_set_font(global.font_menuMedium);
draw_set_colour(c_white);
draw_text(x,y+currentSpacing,string_hash_to_newline("This game is Open Source")); currentSpacing+=lineSpacing;
draw_text(x,y+currentSpacing,string_hash_to_newline("Find out more at our forums")); currentSpacing+=lineSpacing;
currentSpacing += 5*lineSpacing;

//Relic Hunters Website
draw_set_font(global.font_menuVeryLarge);
draw_set_colour(make_color_rgb(0,253,178));
draw_text(x,y+currentSpacing,string_hash_to_newline("WWW.RELICHUNTERS.COM.BR/FORUMS"));

