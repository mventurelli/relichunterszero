///Draw Event

if (slotInput != -1 && slotCharacter != -1)
{
    draw_self();
    
    draw_set_font(global.font_menuMedium);
    draw_set_valign(fa_center);
    draw_set_halign(fa_left);
    draw_set_colour(c_white);
    
    draw_text(x+6,y+15,string_hash_to_newline(cardName));
    
    var stringCharacter;
    if slotCharacter == char_jimmy  { stringCharacter = loc_key("GENERAL_JIMMY");    cardSprite = spr_card_jimmy; }
    if slotCharacter == char_pinky  { stringCharacter = loc_key("GENERAL_PINKYY");   cardSprite = spr_card_pinky; }
    if slotCharacter == char_raff   { stringCharacter = loc_key("GENERAL_RAFF");     cardSprite = spr_card_raff; }
    if slotCharacter == char_biu    { stringCharacter = loc_key("GENERAL_BIU");      cardSprite = spr_card_biu; }
    if slotCharacter == char_punny  { stringCharacter = loc_key("GENERAL_PUNNY");    cardSprite = spr_card_punny; }
    if slotCharacter == char_ass    { stringCharacter = loc_key("GENERAL_ASS");      cardSprite = spr_card_ass; }
    if slotCharacter == char_rider    { stringCharacter = loc_key("GENERAL_RIDER");      cardSprite = spr_card_red; }
    if slotCharacter == char_random { stringCharacter = loc_key("GENERAL_RANDOM");   cardSprite = noone; }
    
    draw_set_halign(fa_right);
    draw_text(x+sprite_width-6,y+15,string_hash_to_newline(stringCharacter));
    
    var inputSprite = noone;
    if (slotInput == K_INPUT_KEYBOARD)  inputSprite = spr_char_inputKey;
    if (slotInput == K_INPUT_JOYSTICK1) inputSprite = spr_char_inputJoy1;
    if (slotInput == K_INPUT_JOYSTICK2) inputSprite = spr_char_inputJoy2;
    
    //draw portrait & input icon
    if (sprite_exists(cardSprite)) draw_sprite(cardSprite,0,x,y+280);
    if (sprite_exists(inputSprite)) draw_sprite(inputSprite,0,x+16,y+240);
}

