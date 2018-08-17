///add_screen_shake(amount,direction,randomize_direction);

if instance_exists(controller_camera)
{
    controller_camera.screen_shake += argument0;
    if (argument2) controller_camera.shake_direction = irandom(359);
    else controller_camera.shake_direction = argument1;
}
