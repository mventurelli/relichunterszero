///ai_test_dash_chance(chance_multiplier);
if (ai_dash_cooldown_current >= ai_dash_cooldown) {
    if (random(100) <= (ai_dash_chance*argument0))  
        return true;
    else
        return false;
}
else
    return false;
