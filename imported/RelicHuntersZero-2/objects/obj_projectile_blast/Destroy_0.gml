///Create mini-explosion
var blast = instance_create_layer(x,y,"Interactive",fx_explosion_mini);
var blastDamage = damage * 4;

if (global.relic_midnight_beer == 2) blastDamage += round(blastDamage*global.midnightDamageMultiplier ); //Midnight Beer
if (global.relic_midnight_meal == 2) blastDamage += round(blastDamage*global.midnightDamageMultiplier ); //Midnight Meal
if (global.relic_black_cat == 2) if (random(1) <= 0.25) blastDamage += blastDamage;

blast.damage = blastDamage;

