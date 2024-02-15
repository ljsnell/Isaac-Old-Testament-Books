-- Exodus (neutral): Opens a random door in the room (Like doorstop) Maybe use -isFirstEnemyDead?
local exodusBook = Isaac.GetItemIdByName("Exodus")
function MOD:ExodusUse(item)
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

MOD:AddCallback(ModCallbacks.MC_USE_ITEM, MOD.ExodusUse, exodusBook)
