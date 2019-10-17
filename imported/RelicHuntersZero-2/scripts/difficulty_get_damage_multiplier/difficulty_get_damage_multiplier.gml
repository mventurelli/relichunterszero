///difficulty_get_damage_multiplier()

var diff = global.currentDifficulty;
var toReturn = 1.0;

toReturn = global.damageMultiplierByDifficulty[min(diff,K_DIFFICULTY_ASCENDANT)];

if diff > K_DIFFICULTY_ASCENDANT
{
	toReturn += 0.12*(diff-K_DIFFICULTY_ASCENDANT);
}

if (global.masterDifficulty == K_DIFFICULTY_MASTER_BEGINNER) toReturn = toReturn * 0.4;
else if (global.masterDifficulty == K_DIFFICULTY_MASTER_EPIC) toReturn = toReturn * 1.8;

return toReturn;