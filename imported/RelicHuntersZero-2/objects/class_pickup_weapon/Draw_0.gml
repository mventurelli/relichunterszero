///Draw Arrow Feedback

if (sprite_exists(sprite_index)) draw_self();

arrowAnimation += arrowAnimationSpeed;
if (!in_range) && (room!=room_start) draw_sprite_ext(spr_fx_weaponGround,arrowAnimation,x+8,y-4,1.5,1.5,0,c_white,1);

if global.gameMode == gamemode_endless
{
	if (in_range) myRecycleInfo.allowDraw = true;
	else myRecycleInfo.allowDraw = false;
}