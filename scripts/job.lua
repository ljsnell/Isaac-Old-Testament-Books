-- Job (neutral): 10% Chance of spawning an item on taking damage
function MOD:onDMG(target)
    if target.Type == EntityType.ENTITY_PLAYER then
        local random_num = math.random(0,10)
        
        if random_num == 10 then
            Isaac.Spawn(EntityType.ENTITY_PICKUP, PickupVariant.PICKUP_COLLECTIBLE, 0,
                Vector(320,280), Vector(0,0), nil)
        end
  end
end

MOD:AddCallback(ModCallbacks.MC_ENTITY_TAKE_DMG,MOD.onDMG)