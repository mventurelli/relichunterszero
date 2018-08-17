/// @description time based movement
speed_per_second = max(0, speed_per_second - (friction_per_second * delta_time * ms_to_s_60));
speed = speed_per_second * delta_time * ms_to_s_60;
