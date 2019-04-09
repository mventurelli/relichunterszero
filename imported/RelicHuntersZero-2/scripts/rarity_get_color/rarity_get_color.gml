///rarity_get_color(rarity)
//Returns the color when you input the Rarity
//All are Constants set on the #macros script

var rar = argument0;
var col = K_COLOR_COMMON;
switch (rar) {
	case 1: col = K_COLOR_UNCOMMON; break;
	case 2: col = K_COLOR_RARE  break;
	case 3: col = K_COLOR_EPIC break;
	case 4: col = K_COLOR_LEGENDARY break;
}

return col;