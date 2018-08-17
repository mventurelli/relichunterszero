///ds_grid_get_above(grid,x,y)
// Returns the best possible value above the indicated coordinates, or return -1

var myGrid = argument0;
var myX = argument1;
var myY = argument2;

var toReturn = -1;
var candidate = noone;

//Go straight up
for (var i=myY-1; abs(i)<ds_grid_height(myGrid); i--)
{
    candidate = ds_grid_get(myGrid,myX,i);
    if (candidate) && (instance_exists(candidate))
    {
        if (candidate.isSelected == false || candidate.allowMultipleSelection) 
        {
            toReturn = candidate.id; 
            break;
        }
    }
}

//If still didnt find anyone, check all the width by moving like a pendulum on the row
if (toReturn == -1)
{
    for (var j=1; j<=ds_grid_width(myGrid); j++)
    {
        candidate = ds_grid_get(myGrid, myX - j, myY-1);  
        if (candidate) && (instance_exists(candidate))
        {
            if (candidate.isSelected == false || candidate.allowMultipleSelection) 
            {
                toReturn = candidate.id; 
                break;
            }
        }
        
        candidate = ds_grid_get(myGrid, myX + j, myY-1);  
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
