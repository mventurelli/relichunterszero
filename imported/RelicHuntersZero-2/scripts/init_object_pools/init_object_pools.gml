/// init game object pools

global.pool = array_create(pool_count, 0);
global.pool_at = array_create(pool_count, 0);

var psize = floor(global.max_casings * 0.5);
global.pool_size = array_create(pool_count, psize);

create_object_pool(blood_pool, fx_blood, psize, "Interactive");
create_object_pool(casing_pool, fx_casing, psize, "Interactive");
