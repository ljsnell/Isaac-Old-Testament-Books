-- Numbers (Neutral): Increase one random stat by +1. 6 room charge
local numbersBook = Isaac.GetItemIdByName("Numbers")
local amountToIncreaseStatBy = 1
function MOD:NumbersUse(item)
    local random_num = math.random(0,5)
    local player = Isaac.GetPlayer()

    -- Should really write this as a case statement
    if random_num == 0 then
        player.MoveSpeed = player.MoveSpeed + amountToIncreaseStatBy
    end
    -- Higher chance of boosting damage because that's the best stat
    if random_num == 1 or random_num == 2 then
        player.Damage = player.Damage + amountToIncreaseStatBy
    end
    if random_num == 3 then
        player.TearRange = player.TearRange + amountToIncreaseStatBy
    end
    if random_num == 4 then
        player.ShotSpeed = player.ShotSpeed + amountToIncreaseStatBy
    end
    if random_num == 5 then
        player.Luck = player.Luck + amountToIncreaseStatBy
    end
end

MOD:AddCallback(ModCallbacks.MC_USE_ITEM, MOD.NumbersUse, numbersBook)


-- Numbers Devil Deal: Increase damage by .3 every time you use an active item?
-- Numbers 14:28-30
local evilNumbers = Isaac.GetItemIdByName("Numbers 14:28-30")
function MOD:NumbersDevilItem()
        local player = Isaac.GetPlayer()
        local itemCount = player:GetCollectibleNum(evilNumbers)
        player.Damage = player.Damage + (.3 * itemCount)
end

MOD:AddCallback(ModCallbacks.MC_USE_ITEM, MOD.NumbersDevilItem)


-- Numbers Angels Deal: Balaam's curse, every floor with a curse gets it removed multiplies damage by 1.5
local goodNumbers = Isaac.GetItemIdByName("Numbers 23:25-26")
local amountToMultiplyDamageStatBy = 1.5
function  MOD:NumbersAngelItem()
    local level = Game():GetLevel()
    local curseCount = level:GetCurses()
    local player = Isaac.GetPlayer()
    if curseCount ~= 0 and player:GetCollectibleNum(goodNumbers) > 0 then
        -- Remove all possible curses
        Game():GetLevel():RemoveCurses(LevelCurse.CURSE_OF_DARKNESS | LevelCurse.CURSE_OF_LABYRINTH | LevelCurse.CURSE_OF_THE_LOST | LevelCurse.CURSE_OF_THE_UNKNOWN | LevelCurse.CURSE_OF_THE_CURSED | LevelCurse.CURSE_OF_MAZE | LevelCurse.CURSE_OF_BLIND)
        player.Damage = player.Damage * amountToMultiplyDamageStatBy
    end
end

MOD:AddCallback(ModCallbacks.MC_POST_NEW_LEVEL, MOD.NumbersAngelItem)
