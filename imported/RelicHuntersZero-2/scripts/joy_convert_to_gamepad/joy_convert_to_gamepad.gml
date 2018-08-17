///joy_convert_to_gamepad(button)

var to_return = -1;

switch (argument0)
{
    case 1:
        to_return = gp_face1;
        break;
    
    case 2:
        to_return = gp_face2;
        break;
        
    case 3:
        to_return = gp_face3;
        break;
        
    case 4:
        to_return = gp_face4;
        break;
        
    case 5:
        to_return = gp_shoulderl;
        break;
        
    case 6:
        to_return = gp_shoulderr;
        break;
    
    case 7:
        to_return = gp_select;
        break;
    
    case 8:
        to_return = gp_start;
        break;
        
    case 9:
        to_return = gp_stickl;
        break;
        
    case 10:
        to_return = gp_stickr;
        break;
        
    case 15:
        to_return = gp_padu;
        break;
        
    case 16:
        to_return = gp_padd;
        break;

    case 17:
        to_return = gp_padl;
        break;
        
    case 18:
        to_return = gp_padr;
        break;
}

return to_return;
