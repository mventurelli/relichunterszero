ugcItemId = argument0;

//set as mod
isMod = true;

configDataMap = global.steamUGCItemsDataMap[? ugcItemId];

// load data
name = configDataMap[? "name"];
weaponClass = configDataMap[? "weapon_class"];
sound = configDataMap[? "sound"];
projectile_damage = configDataMap[? "projectile_damage"];
projectile_range = configDataMap[? "projectile_range"];
projectile_piercing = configDataMap[? "projectile_piercing"];
projectile_recoil = configDataMap[? "projectile_recoil"];
projectile_power = configDataMap[? "projectile_power"];
projectile_speed = configDataMap[? "projectile_speed"];
projectile_speed_decay = configDataMap[? "projectile_speed_decay"];
accuracy = configDataMap[? "accuracy"];
accuracy_aiming = configDataMap[? "accuracy_aiming"];
ammo = configDataMap[? "ammo"];
ammo_type_name = configDataMap[? "ammo_type"];
ammo_cost = configDataMap[? "ammo_cost"];
reload_time = configDataMap[? "reload_time"] * s_to_ms;
fire_rate = configDataMap[? "fire_rate"] * s_to_ms;
fire_rate_decay = configDataMap[? "fire_rate_decay"] * s_to_ms;
fire_rate_decay_recovery = configDataMap[? "fire_rate_decay_recovery"] * s_to_ms;
fire_rate_decay_min = configDataMap[? "fire_rate_decay_min"] * s_to_ms;
fire_amount = configDataMap[? "fire_amount"];
fire_burst = configDataMap[? "fire_burst"];
fire_burst_rate = configDataMap[? "fire_burst_rate"] * s_to_ms;
shake_amount = configDataMap[? "shake_amount"];
crosshair_recoil = configDataMap[? "crosshair_recoil"];
joypadRumbleFactor = configDataMap[? "joypad_rumble_factor"];
projectile_obj_name = configDataMap[? "projectile"];
beamThickness = configDataMap[? "beam_thickness"];
beam_color_r = configDataMap[? "beam_color_r"];
beam_color_g = configDataMap[? "beam_color_g"];
beam_color_b = configDataMap[? "beam_color_b"];
origin_x = configDataMap[? "origin_x"];
origin_y = configDataMap[? "origin_y"];
sprite_w = configDataMap[? "sprite_w"];
sprite_h = configDataMap[? "sprite_h"];	
price = configDataMap[? "price"];
tier = configDataMap[? "tier"];
	
// booleans 
fire_automatic = configDataMap[? "fire_automatic"] == 1;
dropCasing = configDataMap[? "drop_casing"] == 1;
goesThroughWalls = configDataMap[? "goes_through_walls"] == 1;
projectileBounce = configDataMap[? "projectile_bounce"] == 1;
projectileBouceMax = configDataMap[? "projectile_bouce_max"] == 1;

//build vars

//limit data
// load data
projectile_damage = max(1, min(350, projectile_damage));
projectile_range = max(0, min(1200, projectile_range));
projectile_piercing = max(0, min(5, projectile_piercing));
projectile_recoil = max(0, min(10, projectile_recoil));
projectile_power = max(0, min(20, projectile_power));
projectile_speed = max(0, min(100, projectile_speed));
projectile_speed_decay = max(-1, min(1, projectile_speed_decay));
accuracy = max(1, min(50, accuracy));
accuracy_aiming = max(1, min(20, accuracy_aiming));
ammo = max(1, min(999, ammo));
ammo_cost = max(0, min(50, ammo_cost));
reload_time = max(0 * s_to_ms, min(10 * s_to_ms, reload_time));
fire_rate = max(0 * s_to_ms, min(10 * s_to_ms, fire_rate));
fireRateDecay = max(-0.01 * s_to_ms, min(0 * s_to_ms, fire_rate_decay));
fireRateDecayRecovery = max(0 * s_to_ms, min(1 * s_to_ms, fire_rate_decay_recovery));
fireRateDecayMin = max((-1 * fire_rate), min(0* s_to_ms, fire_rate_decay_min));
fire_amount = max(1, min(20, fire_amount));
fire_burst = max(0, min(50, fire_burst));
fire_burst_rate = max(0 * s_to_ms, min(1 * s_to_ms, fire_burst_rate));
shake_amount = max(0, min(100, shake_amount));
crosshair_recoil = max(0, min(2, crosshair_recoil));
joypadRumbleFactor = max(0, min(1, joypadRumbleFactor));
beamThickness = max(1, min(20, beamThickness));
beam_color_r = max(0, min(255, beam_color_r));
beam_color_g = max(0, min(255, beam_color_g));
beam_color_b = max(0, min(255, beam_color_b));
price = max(100, min(10000, price));
tier = max(1, min(3, tier));
	
// object type
//default,blast,beam,plasma,skull,flak,flakRelic,sonicBoom,rocket,kamiRocket,flame
switch (projectile_obj_name) {
	//case "default": projectile_obj = obj_projectile_player; break;
	case "blast": projectile_obj = obj_projectile_blast; break;
	case "beam": projectile_obj = obj_projectile_beam; break;
	case "plasma": projectile_obj = obj_projectile_plasma; break;
	case "skull": projectile_obj = obj_projectile_skull; break;
	case "flak": projectile_obj = obj_projectile_flak; break;
	case "flakRelic": projectile_obj = obj_projectile_flakRelic; break;
	case "sonicBoom": projectile_obj = obj_sonicboom; break;
	case "rocket": projectile_obj = obj_rocket; break;
	case "kamiRocket": projectile_obj = obj_kamiRocket; break;
	case "flame": projectile_obj = obj_flame; break;
	default: projectile_obj = obj_projectile_player;
}
	
//ammo type
switch (ammo_type_name) {
	case "light": ammo_type = type_light; break;
	case "medium": ammo_type = type_medium; break;
	case "heavy": ammo_type = type_heavy; break;
	default: ammo_type = type_light;
}
	
// beam color
beamColor = make_color_rgb(beam_color_r, beam_color_g, beam_color_b);

load_weapon_mod_spritesheet();

gui_info_weapon_create(instance_nearest(x,y,class_player),c_white,name);
