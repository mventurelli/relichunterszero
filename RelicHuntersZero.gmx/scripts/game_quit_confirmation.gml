///game_quit_confirmation

//Deactivate all menu objects then activate the confirmation ones
instance_deactivate_all(true);
instance_activate_object(global.pauseController);
instance_activate_object(global.pauseFX);
instance_activate_object(global.pauseButtonConfirmExit);
instance_activate_object(global.pauseButtonCancelExit);

// Menu button manager
instance_activate_object(global.pauseMenuButtonController);

//Initialize instances
with(global.pauseController) event_perform(ev_create,0);
with (global.pauseFX) event_perform(ev_create,0);
with (global.pauseButtonConfirmExit) event_perform(ev_create,0);
with (global.pauseButtonCancelExit) event_perform(ev_create,0);

with (global.pauseMenuButtonController) event_perform(ev_create,0);
