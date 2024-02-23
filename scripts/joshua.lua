-- Joshua: Passive horn which destroys all rocks every 7 new rooms.
local joshua = Isaac.GetItemIdByName("Joshua 6:20")
local room_counter = 1
local flat_increase = .7
local per_room_decrease = .1
local player = Isaac.GetPlayer()
function MOD:JoshuaNeutral(target)
    local item_count = Isaac.GetPlayer():GetCollectibleNum(joshua)
    if item_count > 0 then
        if room_counter ~= 2 then
            print('in if')
            print(room_counter)
            -- if is_new_room then increment by +1
            -- slowly reduce stats back to near starting level (net +.1 per cycle)
            room_counter = room_counter + 1
            player.Damage = player.Damage - per_room_decrease
            player.Luck = player.Luck - per_room_decrease
        else
            print(room_counter)
            -- audio queue?
            -- reset room counter
            room_counter = 1
            -- Call code to destroy rocks
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
            -- Increase damage & luck temporarily
            player.Damage = player.Damage + flat_increase
            player.Luck = player.Luck + flat_increase
        end
    end
end

MOD:AddCallback(ModCallbacks.MC_POST_NEW_ROOM,MOD.JoshuaNeutral)

-- Angel familiar for Joshua 15:15?
