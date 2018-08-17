///Unlock Relic Part
event_inherited();
price = global.price_crystal1;

if (unlock)
{
    global.relic_crystal1 = 1;
    
    relicSprite1 = spr_crystal1;
    relicSprite2 = spr_crystal2;
    relicSprite3 = spr_crystal3;
    
    relicSprite1Draw = global.relic_crystal1;
    relicSprite2Draw = global.relic_crystal2;
    relicSprite3Draw = global.relic_crystal3;

    if (relicSprite1Draw) && (relicSprite2Draw) && (relicSprite3Draw)
    {
        announce.relicCompleteSprite = spr_crystal_bacon;
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

