-- Jonah: Resets angel chance to 100% on pickup, +.5 speed, +.5 damage
-- https://wofsauge.github.io/IsaacDocs/rep/faq/faq.html?h=ange#how-do-i-modify-the-devil-room-angel-room-chances
-- https://github.com/maya-bee/repentance-tutorials/tree/main
local jonahBook = Isaac.GetItemIdByName("Jonah")
local jonahDamage = .5
local jonahSpeed = .5
local firstPickup = true
function MOD:EvaluateCache(player, cacheFlags)
    if cacheFlags & CacheFlag.CACHE_SPEED == CacheFlag.CACHE_SPEED then
        local itemCount = player:GetCollectibleNum(jonahBook)
        
        -- Adds damage
        local damageToAdd = jonahDamage * itemCount
        player.Damage = player.Damage + damageToAdd
        
        -- Adds speed
        local speedToAdd = jonahSpeed * itemCount
        player.MoveSpeed = player.MoveSpeed + speedToAdd

        -- Resets the angel room chance and forces it to be angel
        if firstPickup == true then
            local level = Game():GetLevel()
            level:AddAngelRoomChance(1.0)
            level:InitializeDevilAngelRoom(true,false)
            level:SetStateFlag(LevelStateFlag.STATE_REDHEART_DAMAGED, false)
            firstPickup = false
        end
    end
end

MOD:AddCallback(ModCallbacks.MC_EVALUATE_CACHE, MOD.EvaluateCache)
