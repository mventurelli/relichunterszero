///Dynamic Bar

if (instance_exists(owner))
{
    if (instance_exists(owner.myGun))
    {
        if (owner.myGun.reloading)
        {
            var subImage = (owner.myGun.reload_time_current/owner.myGun.reload_time)*image_number;
            draw_sprite(sprite_index, subImage, owner.x+positionRelativeX, owner.y+positionRelativeY);
        }
    }
}

