///Purchase and Activate
event_inherited();

if (instance_exists_fast(activationClient))
{   
    if (unlock) && (spawnObject)
    {
        var spawnRelic = instance_create_layer(0,0,"Interactive",spawnObject);
        spawnRelic.activationOverride = true;
		owner_add_activated_instance_ex(spawnRelic, activationClient);
        spawnRelic.toggle = true;
        with (spawnRelic) {
            event_perform(ev_step,ev_step_begin);
            instance_destroy();
        }
        instance_destroy();
    }
}


