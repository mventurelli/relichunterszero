///gui_info_weapon_create(owner,color,string);

var owner,color,text;

owner=argument0;
color=argument1;
text=argument2;

if (owner != noone)
{
	gui_info_show_at(owner.id, owner.x, owner.y, "Interactive_Over", color, text);    
    return true;
}
else return false;
