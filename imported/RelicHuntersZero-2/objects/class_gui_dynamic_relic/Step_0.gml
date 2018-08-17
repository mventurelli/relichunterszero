///Self-Activation

event_inherited();

if (!timedActive) isActive = false;

if (global.pauseMenu) || (room == room_endShop)
{
    isActive = true;
}

///My Relic

mySprite = noone;
myString = "";

if (global.relic_slot[myNumber] == "pineapple") { mySprite = spr_pineapple_pudding; myString = loc_key("RELIC_PINEAPPLE_SHORT");   }
if (global.relic_slot[myNumber] == "yottabyte") { mySprite = spr_yottabyte_drive; myString = loc_key("RELIC_YOTTABYTE_SHORT");   }
if (global.relic_slot[myNumber] == "alcoholic") { mySprite = spr_alcoholic_carrot; myString = loc_key("RELIC_ALCOHOLIC_SHORT");   }
if (global.relic_slot[myNumber] == "infinity") { mySprite = spr_infinity_battery; myString = loc_key("RELIC_INFINITY_SHORT");   }
if (global.relic_slot[myNumber] == "midnight") { mySprite = spr_midnight_beer; myString = loc_key("RELIC_MIDNIGHT_SHORT");   }
if (global.relic_slot[myNumber] == "watchful") { mySprite = spr_watchful_eye; myString = loc_key("RELIC_WATCHFUL_SHORT");   }
if (global.relic_slot[myNumber] == "crystal") { mySprite = spr_crystal_bacon; myString = loc_key("RELIC_CRYSTAL_SHORT");   }
if (global.relic_slot[myNumber] == "dev") { mySprite = spr_dev_potion; myString = loc_key("RELIC_DEV_SHORT");   }

if (global.relic_slot[myNumber] == "morning_star") { mySprite = spr_morning_star; myString = loc_key("RELIC_MORNINGSTAR_SHORT");   }
if (global.relic_slot[myNumber] == "pineapple_pie") { mySprite = spr_pineapple_pie; myString = loc_key("RELIC_PINEAPPLEPIE_SHORT");   }
if (global.relic_slot[myNumber] == "rabbit_foot") { mySprite = spr_rabbit_foot; myString = loc_key("RELIC_RABBITFOOT_SHORT");   }
if (global.relic_slot[myNumber] == "midnight_meal") { mySprite = spr_midnight_meal; myString = loc_key("RELIC_MIDNIGHTMEAL_SHORT");   }
if (global.relic_slot[myNumber] == "yottabyte_processor") { mySprite = spr_yottabyte_processor; myString = loc_key("RELIC_PROCESSOR_SHORT");   }
if (global.relic_slot[myNumber] == "mega_quantum_chip") { mySprite = spr_mega_quantum_chip; myString = loc_key("RELIC_MEGAQUANTUMCHIP_SHORT");   }











