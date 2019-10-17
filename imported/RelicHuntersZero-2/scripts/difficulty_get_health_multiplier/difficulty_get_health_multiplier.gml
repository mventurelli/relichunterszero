///difficulty_get_health_multiplier()

var diff = global.currentDifficulty;
var toReturn = 1.0;

toReturn = global.healthMultiplierByDifficulty[min(diff,K_DIFFICULTY_ASCENDANT)];

if diff > K_DIFFICULTY_ASCENDANT
{
	toReturn += 0.5*(diff-K_DIFFICULTY_ASCENDANT);
}

if (global.masterDifficulty == K_DIFFICULTY_MASTER_EPIC) toReturn = toReturn * 2;

return toReturn;