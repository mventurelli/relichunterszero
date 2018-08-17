///Main Draw

if (myCharacter == char_pinky) sprite_index = spr_pinky_holo;
if (myCharacter == char_jimmy) sprite_index = spr_jimmy_holo;
if (myCharacter == char_raff) sprite_index = spr_raff_holo;
if (myCharacter == char_biu) sprite_index = spr_biu_holo;
if (myCharacter == char_punny) sprite_index = spr_punny_holo;
if (myCharacter == char_ass) sprite_index = spr_ass_holo;
if (myCharacter == char_rider) sprite_index = spr_rider_idle;

if (active) draw_self();

if (active) reflection_object_setup(0,-1,image_index);
else
{
    reflection_object_setup(0,spr_casing_blob,0);
    draw_set_font(global.font_numberSmall);
    draw_set_halign(fa_center);
    draw_set_valign(fa_bottom);
    draw_set_color(c_white);
    
    if (!unlock)
    {
        var stringUnlockCharacter = "";
        
        if (myCharacter == char_pinky) stringUnlockCharacter = "I AM ERROR";
        if (myCharacter == char_raff) stringUnlockCharacter = loc_key("HUD_UNLOCK_REQ_RAFF");
        if (myCharacter == char_biu) stringUnlockCharacter = loc_key("HUD_UNLOCK_REQ_BIU");
        if (myCharacter == char_punny) stringUnlockCharacter = loc_key("HUD_UNLOCK_REQ_PUNNY");
        if (myCharacter == char_jimmy) stringUnlockCharacter = "I AM ERROR";
        if (myCharacter == char_rider) stringUnlockCharacter = "I AM ERROR";
        
        draw_text_ext(x, y-28, string_hash_to_newline(stringUnlockCharacter), 19, 150);
    }
}


