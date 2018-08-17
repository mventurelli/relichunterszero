///Controller Grid Setup

if (!buttonSetupDone) && (instance_exists(class_menu_button))
{
    var buttonCount = instance_number(class_menu_button);
    var currentY = 0;
    var currentX = 0;
    
    //Vertical Coordinates
    var priorityVertical = ds_priority_create();
    
    for (var i=0; i<buttonCount; i++)
    {
        var buttonFound = instance_find(class_menu_button,i);
        ds_priority_add(priorityVertical, buttonFound.id, buttonFound.y);
    }
    
    if (!ds_priority_empty(priorityVertical))
    {
        var topmostButton = ds_priority_delete_min(priorityVertical);
        topmostButton.buttonGridY = 0;
    
        while (!ds_priority_empty(priorityVertical))
        {
            var nextButton = ds_priority_delete_min(priorityVertical);
            if (nextButton.allowConsoleSelection)
            {
                if (abs(nextButton.y - topmostButton.y) > buttonGridSize) currentY++;
                nextButton.buttonGridY = currentY;
                topmostButton = nextButton;
            }
        }
    }
    ds_priority_destroy(priorityVertical);
    
    //Horizontal Coordinates
    var priorityHorizontal = ds_priority_create();
    
    for (var i=0; i<buttonCount; i++)
    {
        var buttonFound = instance_find(class_menu_button,i);
        ds_priority_add(priorityHorizontal, buttonFound.id, buttonFound.x);
    }
    
    if (!ds_priority_empty(priorityHorizontal))
    {
        var leftmostButton = ds_priority_delete_min(priorityHorizontal);
        leftmostButton.buttonGridX = 0;
    
        
        
        while (!ds_priority_empty(priorityHorizontal))
        {
            var nextButton = ds_priority_delete_min(priorityHorizontal);
            if (nextButton.allowConsoleSelection)
            {
                if (abs(nextButton.x - leftmostButton.x) > buttonGridSize) currentX++;
                nextButton.buttonGridX = currentX;
                leftmostButton = nextButton;
            }
        }
    }
    ds_priority_destroy(priorityHorizontal);
    
    //Create the actual grid
    global.buttonGrid = ds_grid_create(currentX+1, currentY+1);
    with (class_menu_button)
    {
        if (allowConsoleSelection)
        {
            ds_grid_set(global.buttonGrid, buttonGridX, buttonGridY, id);
            
            if ds_grid_value_exists(global.buttonGrid, 0, 0, ds_grid_width(global.buttonGrid)-1, ds_grid_height(global.buttonGrid)-1, id)
            {
                var actualGridX = ds_grid_value_x(global.buttonGrid, 0, 0, ds_grid_width(global.buttonGrid), ds_grid_height(global.buttonGrid), id);
                var actualGridY = ds_grid_value_y(global.buttonGrid, 0, 0, ds_grid_width(global.buttonGrid), ds_grid_height(global.buttonGrid), id);
            }
        }
    }
    buttonSetupDone = true;
}

