///draw_healthbar_delayed_init(id);
//Call on Create event to initialize for use of draw_healthbar_delayed();

var iD = argument0;

drawHealthbarCatchupSpeed[iD] = 0;
drawHealthbarDelayTime[iD] = 0;
drawHealthbarDelayTimeCurrent[iD] = 0;

drawHealthbarIsUpdating[iD] = false;

drawHealthbarStoredTargetValue[iD] = 0;

drawHealthbarDelayedValue[iD] = 0;

drawHealthbarDelayOrientation[iD] = "plus";
