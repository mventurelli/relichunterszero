if instance_exists(owner)
{
    x=owner.x;
    y=owner.y;
    if (owner.shield) instance_destroy();
    depth=owner.depth-15;
}
else instance_destroy();

if (blue) sprite_index = spr_shield_down_blue;




