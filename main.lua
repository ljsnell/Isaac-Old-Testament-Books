-- Item Ideas --
-- Numbers: Increase one random stat by +.7. 6 room charge ☑
-- Lamentations: Doubles creep damage ☑
-- Judges: Spawns a random beggar, 6 room charge
-- Job: Temporary Transformation? Devolves all enemies 1 level?
-- Joel: Spawns Locusts, 3 room charge
-- Jonah: Resets angel chance to 100% on pickup, +1 speed, +.5 damage
----------------

local game = Game()
local mod = RegisterMod("Old Testament", 1)


-- Song of Solomon: Charms all enemies in room, 4 room charge ✅
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


-- Exodus: Opens a random door in the room (Like doorstop) Maybe use -isFirstEnemyDead?
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