///Explode unless invulnerable
if (!isInvulnerable) explode = true;
else
{
    if (!ds_list_find_index(hitList,id))
    {
        ds_list_add(hitList,id);
        other.hp -= trampleDamage;
        other.shake_direction = direction;
        other.hitDirection = direction;
        other.shake += 4;
        other.hit_taken = true;   
    }
}



