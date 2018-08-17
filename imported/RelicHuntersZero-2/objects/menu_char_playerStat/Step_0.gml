///Set Stats Correctly

if (owner) && (instance_exists(owner))
{
    if (owner.slotCharacter != -1)
    {
        if owner.slotCharacter == char_jimmy
        {
            statHealth = 3;
            statShield = 3;
            statMelee = 3;
            statStamina = 3;
            statSpeed = 3;
            myWeaponSprite = spr_pistol_jimmy;
            myString = loc_key("CHARSELECT_DESC_JIMMY");
        }
        
        if owner.slotCharacter == char_pinky
        {
            statHealth = 4;
            statShield = 3;
            statMelee = 5;
            statStamina = 4;
            statSpeed = 4;
            myWeaponSprite = spr_gloves_idle;
            myString = loc_key("CHARSELECT_DESC_PINKYY");
        }
        
        if owner.slotCharacter == char_raff
        {
            statHealth = 2;
            statShield = 3;
            statMelee = 3;
            statStamina = 3;
            statSpeed = 3;
            myWeaponSprite = spr_keytar;
            myString = loc_key("CHARSELECT_DESC_RAFF");
        }
        
        if owner.slotCharacter == char_biu
        {
            statHealth = 5;
            statShield = 1;
            statMelee = 4;
            statStamina = 3;
            statSpeed = 1;
            myWeaponSprite = spr_buckler_idle;
            myString = loc_key("CHARSELECT_DESC_BIU");
        }
        
        if owner.slotCharacter == char_punny
        {
            statHealth = 1;
            statShield = 4;
            statMelee = 1;
            statStamina = 3;
            statSpeed = 4;
            myWeaponSprite = spr_flamethrower;
            myString = loc_key("CHARSELECT_DESC_PUNNY");
        }
        
        if owner.slotCharacter == char_ass
        {
            statHealth = 1;
            statShield = 1;
            statMelee = 2;
            statStamina = 2;
            statSpeed = 3;
            myWeaponSprite = spr_pistol;
            myString = loc_key("CHARSELECT_DESC_ASS");
        }
        
        if owner.slotCharacter == char_rider
        {
            statHealth = 4;
            statShield = 1;
            statMelee = 5;
            statStamina = 3;
            statSpeed = 5;
            myWeaponSprite = spr_kamired_idle;
            myString = loc_key("CHARSELECT_DESC_RIDER");
        }
        
        if owner.slotCharacter == char_random
        {
            statHealth = 5;
            statShield = 5;
            statMelee = 5;
            statStamina = 5;
            statSpeed = 5;
            myWeaponSprite = noone;
            myString = "";
        }
    }
}

