///Stats Init

totalPlayTime = global.statTotalTime;
totalPlayTimeHours = totalPlayTime div 3600;
totalPlayTimeMinutes = (totalPlayTime mod 3600) div 60; 
playTimeString = string(totalPlayTimeHours) + "h " + string(totalPlayTimeMinutes) + "m";


bountyString = string(global.statTotalBounty);
killsString = string(global.statKills);
deathsString = string(global.statTotalDeaths);
bossKillsString = string(global.statBossKills);


bestEndlessString = string(global.scoreEndlessBest);
bestLoopString = string(global.statBestLoop);


bestRunTime = global.statRunBest;
bestRunTimeMinutes = bestRunTime div 60;
bestRunTimeSeconds = bestRunTime mod 60;
bestRunTimeString = string(bestRunTimeMinutes) + "m " + string(bestRunTimeSeconds);

longestRunTime = global.statLongestRun;
longestRunTimeMinutes = longestRunTime div 60;
longestRunTimeSeconds = longestRunTime mod 60;
longestRunTimeString = string(longestRunTimeMinutes) + "m " + string(longestRunTimeSeconds);

image_yscale = 1.65;
