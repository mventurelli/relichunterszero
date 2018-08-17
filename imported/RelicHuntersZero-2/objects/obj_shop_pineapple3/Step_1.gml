///Unlock Relic Part
event_inherited();
price = global.price_pineapple3;

if (unlock)
{
    global.relic_pineapple3 = 1;
    
    relicSprite1 = spr_pineapple1;
    relicSprite2 = spr_pineapple2;
    relicSprite3 = spr_pineapple3;
    
    relicSprite1Draw = global.relic_pineapple1;
    relicSprite2Draw = global.relic_pineapple2;
    relicSprite3Draw = global.relic_pineapple3;
    
    if (relicSprite1Draw) && (relicSprite2Draw) && (relicSprite3Draw)
    {
        announce.relicCompleteSprite = spr_pineapple_pudding;
        announce.textBig = fullRelicTextBig;
        announce.textSmall = fullRelicTextSmall;
        achievement_give("ACHIEVEMENT_FIRSTRELIC");
    }
    
    announce.relicSprite1 = relicSprite1;
    announce.relicSprite1Draw = relicSprite1Draw;
    announce.relicSprite2 = relicSprite2;
    announce.relicSprite2Draw = relicSprite2Draw;
    announce.relicSprite3 = relicSprite3;
    announce.relicSprite3Draw = relicSprite3Draw;
    
    instance_destroy();
}

