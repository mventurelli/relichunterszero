///Unlock Relic Part
event_inherited();
price = global.price_midnight3;

if (unlock)
{
    global.relic_midnight3 = 1;
    
    relicSprite1 = spr_midnight1;
    relicSprite2 = spr_midnight2;
    relicSprite3 = spr_midnight3;
    
    if (relicSprite1Draw) && (relicSprite2Draw) && (relicSprite3Draw)
    {
        announce.relicCompleteSprite = spr_midnight_beer;
        announce.textBig = fullRelicTextBig;
        announce.textSmall = fullRelicTextSmall;
    }
    
    relicSprite1Draw = global.relic_midnight1;
    relicSprite2Draw = global.relic_midnight2;
    relicSprite3Draw = global.relic_midnight3;

    announce.relicSprite1 = relicSprite1;
    announce.relicSprite1Draw = relicSprite1Draw;
    announce.relicSprite2 = relicSprite2;
    announce.relicSprite2Draw = relicSprite2Draw;
    announce.relicSprite3 = relicSprite3;
    announce.relicSprite3Draw = relicSprite3Draw;
    
    
    
    instance_destroy();
}

