-- Item Ideas --
-- Song of Solomon: Charms all enemies in room, 4 room charge ☑
-- Exodus: Opens a random door in the room (Like doorstop) ☑
-- Numbers: Increase one random stat by +.7. 6 room charge ☑
-- Lamentations: Doubles creep damage ☑
-- Judges: Spawns a random beggar, 6 room charge
-- Job: Temporary Transformation? Devolves all enemies 1 level?
-- Joel: Spawns Locusts, 3 room charge
-- Jonah: Resets angel chance to 100% on pickup, +1 speed, +.5 damage
----------------
local mod = RegisterMod("My Mod", 1)

local POLLEN_ITEM_ID = Isaac.GetItemIdByName("Pollen")
local POLLEN_POISON_CHANCE = 0.9
local POLLEN_POISON_LENGTH = 3
local ONE_INTERVAL_OF_POISON = 20

local game = Game()

function mod:PollenNewRoom()
    local playerCount = game:GetNumPlayers()

    for playerIndex = 0, playerCount - 1 do
        local player = Isaac.GetPlayer(playerIndex)
        local copyCount = player:GetCollectibleNum(POLLEN_ITEM_ID)
        
        if copyCount > 0 then
            local rng = player:GetCollectibleRNG(POLLEN_ITEM_ID)

            local entities = Isaac.GetRoomEntities()
            for _, entity in ipairs(entities) do
                if entity:IsActiveEnemy() and entity:IsVulnerableEnemy() then
                    if rng:RandomFloat() < POLLEN_POISON_CHANCE then
                        entity:AddPoison(
                            EntityRef(player),
                            POLLEN_POISON_LENGTH + (ONE_INTERVAL_OF_POISON * copyCount),
                            player.Damage
                        )
                    end
                end
            end
        end
    end
end

mod:AddCallback(ModCallbacks.MC_POST_NEW_ROOM, mod.PollenNewRoom)

-- local damagePotion = Isaac.GetItemIdByName("Damage Potion")
-- local damagePotionDamage = 1

-- function mod:EvaluateCache(player, cacheFlags)
--     if cacheFlags & CacheFlag.CACHE_DAMAGE == CacheFlag.CACHE_DAMAGE then
--         local itemCount = player:GetCollectibleNum(damagePotion)
--         local damageToAdd = damagePotionDamage * itemCount
--         player.Damage = player.Damage + damageToAdd
--     end
-- end

-- mod:AddCallback(ModCallbacks.MC_EVALUATE_CACHE, mod.EvaluateCache)

-- local bigRedButton = Isaac.GetItemIdByName("Big Red Button")

-- function mod:RedButtonUse(item)
--     local roomEntities = Isaac.GetRoomEntities()
--     for _, entity in ipairs(roomEntities) do
--         if entity:IsActiveEnemy() and entity:IsVulnerableEnemy() then
--             entity:Kill()
--         end
--     end

--     return {
--         Discharge = true,
--         Remove = false,
--         ShowAnim = true
--     }
-- end

-- mod:AddCallback(ModCallbacks.MC_USE_ITEM, mod.RedButtonUse, bigRedButton)
