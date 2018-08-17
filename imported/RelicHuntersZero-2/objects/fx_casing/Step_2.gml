/// @description time based movement
//if (!active) return;

speed_per_second = max(0, speed_per_second - (friction_per_second * delta_time * ms_to_s_60));
speed = speed_per_second * delta_time * ms_to_s_60;
//friction = friction_per_second * delta_time * ms_to_s_60;