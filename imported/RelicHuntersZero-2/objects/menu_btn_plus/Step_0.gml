///Button Action
event_inherited();

if (executeAction)
{
    if instance_exists(parentButton)
    {
        parentButton.myVariable++;
        parentButton.arrowClicked = true;
    }
    
    executeAction = false;
}

if (instance_exists(parentButton))
{
    if (parentButton.myVariable >= parentButton.myVariableMax) || ((!global.mouseActive) && (global.selectedButton[K_INPUT_ALL] != parentButton))
    {
        isAvailable = false;
    }
    else isAvailable = true;
}

