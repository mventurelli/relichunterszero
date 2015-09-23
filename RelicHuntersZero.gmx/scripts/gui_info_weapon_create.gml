///gui_info_weapon_create(owner,color,string);

var owner,color,text;

owner=argument0;
color=argument1;
text=argument2;

if instance_exists(owner)
{
    var guiInfo = instance_create(owner.x,owner.y,gui_info);
    
    guiInfo.colorMain = color;
    guiInfo.myString = text;
    guiInfo.owner = owner;
    
    return true;
}
else return false;
