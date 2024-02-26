-- Job (neutral): 10% Chance of spawning an item on taking damage
local job = Isaac.GetItemIdByName("Job 39:13-18")
function MOD:jobNeutral(target)
    local item_count = Isaac.GetPlayer():GetCollectibleNum(job)
    if item_count > 0 then
        if target.Type == EntityType.ENTITY_PLAYER then
            -- 10% chance
            local random_num = math.random(10)
            if random_num == 5 then
                Isaac.Spawn(EntityType.ENTITY_PICKUP, PickupVariant.PICKUP_COLLECTIBLE, 0,
                    Vector(320,280), Vector(0,0), nil)
            end
      end
    end
end

MOD:AddCallback(ModCallbacks.MC_ENTITY_TAKE_DMG,MOD.jobNeutral)