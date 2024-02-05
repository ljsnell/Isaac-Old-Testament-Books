-- Item Ideas --
-- Numbers: Increase one random stat by +.7. 6 room charge ☑
    -- Numbers: Guy who runs someone through with a spear (double damage for subsequent piercing shots)
-- Lamentations: Doubles creep damage ☑
-- Judges: Spawns a random beggar, 6 room charge
    -- Separate items for each judge?
-- Job: Temporary Transformation? Devolves all enemies 1 level?
-- Joel: Spawns Locusts, 3 room charge

-- 1 Angel, 1 Devil, 1 neutral? 
-- (Chapter & verse)
-- John 11:35?
-- Exodus: Devil Item: golden calf? (2 hearts for 4 bone hearts?)
----------------

local game = Game()
local mod = RegisterMod("Old Testament", 1)


-- Song of Solomon (neutral): Charms all enemies in room, 4 room charge ✅
local sosBook = Isaac.GetItemIdByName("Song of Solomon")
function mod:SongOfSolomonUse(item)    
    local roomEntities = Isaac.GetRoomEntities()
    for _, entity in ipairs(roomEntities) do
        if entity:IsActiveEnemy() and entity:IsVulnerableEnemy() then
            entity:AddCharmed(EntityRef(Isaac.GetPlayer()), 90) -- Charms all enemies in room for 3 seconds
        end
    end

    return {
        Discharge = true,
        Remove = false,
        ShowAnim = true
    }
end

mod:AddCallback(ModCallbacks.MC_USE_ITEM, mod.SongOfSolomonUse, sosBook)


-- Exodus (neutral): Opens a random door in the room (Like doorstop) Maybe use -isFirstEnemyDead?
local exodusBook = Isaac.GetItemIdByName("Exodus")
function mod:ExodusUse(item)
    local door_closed = true
    local room = Game():GetRoom()

    while door_closed do
        local grid_entity_door = room:GetDoor(math.random(0,7))
        if grid_entity_door ~= nil then
            grid_entity_door:Open()
            door_closed = false
        end
    end

    room:EmitBloodFromWalls(5, 25)

    return {
        Discharge = true,
        Remove = false,
        ShowAnim = true
    }
end

mod:AddCallback(ModCallbacks.MC_USE_ITEM, mod.ExodusUse, exodusBook)


-- Jonah: Resets angel chance to 100% on pickup, +.5 speed, +.5 damage
-- https://wofsauge.github.io/IsaacDocs/rep/faq/faq.html?h=ange#how-do-i-modify-the-devil-room-angel-room-chances
-- https://github.com/maya-bee/repentance-tutorials/tree/main
local jonahBook = Isaac.GetItemIdByName("Jonah")
local jonahDamage = .5
local jonahSpeed = .5
local firstPickup = true
function mod:EvaluateCache(player, cacheFlags)
    if cacheFlags & CacheFlag.CACHE_DAMAGE == CacheFlag.CACHE_DAMAGE then
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

mod:AddCallback(ModCallbacks.MC_EVALUATE_CACHE, mod.EvaluateCache)