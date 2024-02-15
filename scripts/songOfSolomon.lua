
-- Song of Solomon (neutral): Charms all enemies in room, 4 room charge ✅
local sosBook = Isaac.GetItemIdByName("Song of Solomon")
function MOD:SongOfSolomonUse(item)    
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

MOD:AddCallback(ModCallbacks.MC_USE_ITEM, MOD.SongOfSolomonUse, sosBook)