///Unlock Relic Part
event_inherited();
price = global.price_watchful1;

if (unlock)
{
    global.relic_watchful1 = 1;
    
    relicSprite1 = spr_watchful1;
    relicSprite2 = spr_watchful2;
    relicSprite3 = spr_watchful3;
    
    relicSprite1Draw = global.relic_watchful1;
    relicSprite2Draw = global.relic_watchful2;
    relicSprite3Draw = global.relic_watchful3;

    if (relicSprite1Draw) && (relicSprite2Draw) && (relicSprite3Draw)
    {
        announce.relicCompleteSprite = spr_watchful_eye;
        announce.textBig = fullRelicTextBig;
        announce.textSmall = fullRelicTextSmall;
    }
    
    announce.relicSprite1 = relicSprite1;
    announce.relicSprite1Draw = relicSprite1Draw;
    announce.relicSprite2 = relicSprite2;
    announce.relicSprite2Draw = relicSprite2Draw;
    announce.relicSprite3 = relicSprite3;
    announce.relicSprite3Draw = relicSprite3Draw;
    
    
    instance_destroy();
}

