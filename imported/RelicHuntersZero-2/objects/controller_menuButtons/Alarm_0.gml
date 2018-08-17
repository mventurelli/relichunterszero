///Allow Input & Gives Grid Order to Buttons

allowInput = true;

var verticalList = ds_priority_create();
var horizontalList = ds_priority_create();

var targetButton;
var buttonCount = instance_number(class_menu_button);

for (i=0; i<buttonCount; i++)
{
    targetButton = instance_find(class_menu_button,i);
    ds_priority_add(verticalList,targetButton,targetButton.y);
    ds_priority_add(horizontalList,targetButton,targetButton.x);
}

var selectionOrderVertical = 0;
var selectionOrderHorizontal = 0;

while (!ds_priority_empty(verticalList))
{
    targetButton = ds_priority_find_min(verticalList);
    if (targetButton.allowConsoleSelection)
    {
        targetButton.selectionOrderVertical = selectionOrderVertical;
        selectionOrderVertical++;
    }
    ds_priority_delete_min(verticalList);
    
}

ds_priority_destroy(verticalList);

while (!ds_priority_empty(horizontalList))
{
    targetButton = ds_priority_find_min(horizontalList);
    if (targetButton.allowConsoleSelection)
    {
        targetButton.selectionOrderHorizontal = selectionOrderHorizontal;
        selectionOrderHorizontal++;
    }
    ds_priority_delete_min(horizontalList);
    
}

ds_priority_destroy(horizontalList);



