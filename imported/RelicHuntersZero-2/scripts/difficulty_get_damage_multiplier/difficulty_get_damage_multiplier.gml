///difficulty_get_damage_multiplier()

var diff = global.currentDifficulty;
var toReturn = 1.0;

toReturn = global.damageMultiplierByDifficulty[min(diff,K_DIFFICULTY_ASCENDANT)];

if diff > K_DIFFICULTY_ASCENDANT
{
	toReturn += diff-K_DIFFICULTY_ASCENDANT;
}

return toReturn;