///draw_healthbar_delayed(bar name,x1,y1,x2,y2,value,valueMax,col,backCol,delayCol,speed,delay,dir,showBack,showBorder);
//Draws a healthbar that shows damage before updating

// Need to **initialize first** with draw_healthbar_delayed_init();

var iD = argument0; 
var x1 = argument1;
var y1 = argument2;
var x2 = argument3;
var y2 = argument4;
var value = argument5;
var valueMax = argument6;
var color = argument7;
var backColor = argument8;
var delayColor = argument9;

drawHealthbarCatchupSpeed[iD] = argument10; //Suggested: 0.0025;
drawHealthbarDelayTime[iD] = argument11; //Suggested: room_speed*2;

var dir = argument12;
var showBack = argument13;
var showBorder = argument14;

//Update

if (value == drawHealthbarStoredTargetValue[iD])
{
    if (!drawHealthbarIsUpdating[iD])
    {
        //Countdown, then trigger Update
        drawHealthbarDelayTimeCurrent[iD]++;
        if (drawHealthbarDelayTimeCurrent[iD] >= drawHealthbarDelayTime[iD])
        {
            drawHealthbarIsUpdating[iD] = true;
            drawHealthbarDelayTimeCurrent[iD] = 0;
        }
    }
    else
    {
        //check and update
        if (drawHealthbarDelayedValue[iD] != value)
        {
            if (drawHealthbarDelayedValue[iD] > value) { drawHealthbarDelayOrientation[iD] = "minus"; drawHealthbarDelayedValue[iD] -= min( (drawHealthbarCatchupSpeed[iD]*valueMax), abs(drawHealthbarDelayedValue[iD]-value) ); } 
            if (drawHealthbarDelayedValue[iD] < value) { drawHealthbarDelayOrientation[iD] = "plus"; drawHealthbarDelayedValue[iD] += min( (drawHealthbarCatchupSpeed[iD]*valueMax), abs(drawHealthbarDelayedValue[iD]-value) ); }
        }
        else{
            drawHealthbarDelayedValue[iD] = value;
            drawHealthbarIsUpdating[iD] = false;
        }
    }
}
else
{
    if (value > drawHealthbarStoredTargetValue[iD]) drawHealthbarDelayOrientation[iD] = "plus";
    if (value < drawHealthbarStoredTargetValue[iD]) drawHealthbarDelayOrientation[iD] = "minus";
    
    drawHealthbarDelayTimeCurrent[iD] = 0;
    
    if (drawHealthbarIsUpdating[iD])
    {
        //Instantly catch up, then start again
        drawHealthbarDelayedValue[iD] = drawHealthbarStoredTargetValue[iD];
        drawHealthbarIsUpdating[iD] = false;
    }
}

//Update the stored value
drawHealthbarStoredTargetValue[iD] = value;
