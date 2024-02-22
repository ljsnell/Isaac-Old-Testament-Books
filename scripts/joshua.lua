-- Joshua: Passive horn which destroys all rocks every 7 new rooms. Maybe damage buff for the room?
function MOD:JoshuaNeutral(target)
    
    local room_counter = 1
    if room_counter ~= 7 then
        --Game():GetRoom():DestroyGrid(Game():GetLevel():GetCurrentRoomIndex(), true)
        --print(Game():GetLevel():GetCurrentRoomIndex())
        -- check if room contains living enemies, if not we don't count it
        local is_new_room = false
        for i, entity in ipairs(Isaac.GetRoomEntities()) do
            if entity:IsEnemy() then
                is_new_room = true
                -- print('is a new room')
            end
        end
        if is_new_room then
            room_counter = room_counter + 1
            print('in if if')
            print(room_counter)
        end
    else
        -- audio queue?
        -- reset room counter
        room_counter = 1
        print('in else!')
        print(room_counter)
        -- Call code to destory rocks
		-- https://wofsauge.github.io/IsaacDocs/rep/Room.html?h=destroy#destroygrid
        
    end
end

MOD:AddCallback(ModCallbacks.MC_POST_NEW_ROOM,MOD.JoshuaNeutral)

-- Angel familiar for Joshua 15:15?
