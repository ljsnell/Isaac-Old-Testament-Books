-- Joshua: Passive horn which destroys all rocks every 7 new rooms. Maybe damage buff for the room?
local joshua = Isaac.GetItemIdByName("Joshua 6:20")
local room_counter = 1
function MOD:JoshuaNeutral(target)
    local item_count = Isaac.GetPlayer():GetCollectibleNum(joshua)
    if item_count > 0 then
        if room_counter ~= 2 then
            -- check if room contains living enemies, if not we don't count it
            -- local is_new_room = false
            -- if is_new_room then increment by +1
            room_counter = room_counter + 1
            print(room_counter)
        else
            -- audio queue?
            -- reset room counter
            room_counter = 1
            -- Call code to destory rocks
            local room = Game():GetRoom()
            for i = 0, room:GetGridSize() do
                local gridEntity = room:GetGridEntity(i)
                if gridEntity ~= nil then
                    if (gridEntity:GetType() == GridEntityType.GRID_ROCK or
                        gridEntity:GetType() == GridEntityType.GRID_ROCKT or
                        gridEntity:GetType() == GridEntityType.GRID_ROCK_SPIKED or
                        gridEntity:GetType() == GridEntityType.GRID_ROCK_SS) then
                        gridEntity:Destroy()
                    end
                end
            end
        end
    end
end

MOD:AddCallback(ModCallbacks.MC_POST_NEW_ROOM,MOD.JoshuaNeutral)

-- Angel familiar for Joshua 15:15?
