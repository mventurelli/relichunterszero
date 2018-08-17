///Draw if not digging
if (isActive) && (owner != noone)
{
    if (!owner.isDigging) && (owner.animation_current != "dig") draw_self();
}

