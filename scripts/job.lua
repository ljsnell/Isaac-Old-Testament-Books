-- Job (neutral): After taking 8 total damage spawns two angel items
local jobBook = Isaac.GetItemIdByName("Job")
function MOD:JobUse(player)    
    if player:GetCollectibleNum(jobBook) > 0 then
        if player:GetTotalDamageTaken() > 0 then
            --https://wofsauge.github.io/IsaacDocs/rep/Isaac.html#spawn
            --https://www.youtube.com/watch?v=xn76bd8SccA
            Isaac.Spawn(EntityType.ENTITY_PICKUP, PickupVariant.PICKUP_COLLECTIBLE,
                Game:GetItemPool():GetCollectible(ItemPoolType.POOL_ANGEL, false, Game():GetRoom():GetSpawnSeed()))
        end
    end
end

MOD:AddCallback(ModCallbacks.MC_ENTITY_TAKE_DMG, MOD.JobUse)
