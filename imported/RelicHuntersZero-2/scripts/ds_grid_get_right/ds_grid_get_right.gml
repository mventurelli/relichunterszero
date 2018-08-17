///ds_grid_get_right(grid,x,y)
// Returns the best possible value to the right of the indicated coordinates, or return -1

var myGrid = argument0;
var myX = argument1;
var myY = argument2;

var toReturn = -1;
var candidate = noone;

//Go straight right
for (var i=myX+1; i<ds_grid_width(myGrid); i++)
{
    candidate = ds_grid_get(myGrid,i,myY);
    if (candidate) && (instance_exists(candidate))
    {
        if (candidate.isSelected == false || candidate.allowMultipleSelection) 
        {
            toReturn = candidate.id; 
            break;
        }
    }
}

//If still didnt find anyone, check all the height by moving like a pendulum on the column
if (toReturn == -1)
{
    for (var j=1; j<=ds_grid_height(myGrid); j++)
    {
        candidate = ds_grid_get(myGrid, myX+1, myY - j);  
        if (candidate) && (instance_exists(candidate))
        {
            if (candidate.isSelected == false || candidate.allowMultipleSelection) 
            {
                toReturn = candidate.id; 
                break;
            }
        }
        
        candidate = ds_grid_get(myGrid, myX+1, myY + j);  
        if (candidate) && (instance_exists(candidate))
        {
            if (candidate.isSelected == false || candidate.allowMultipleSelection) 
            {
                toReturn = candidate.id; 
                break;
            }
        }  
    }  
}

//If still didnt find anyone, get the very own coordinates
if (toReturn == -1)
{
    candidate = ds_grid_get(myGrid,myX,myY);
    if (candidate) && (instance_exists(candidate))
    {
        toReturn = candidate.id;
    }
}

//End
return toReturn;
