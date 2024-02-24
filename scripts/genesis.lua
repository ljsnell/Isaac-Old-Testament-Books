-- Devil Item: 
-- Mark of Cain: Deals black heart damage anytime you take heart damage
-- Art based on this letter, theorized to be the mark of Cain: https://en.wikipedia.org/wiki/Waw_(letter)
local devilGenesis = Isaac.GetItemIdByName("Genesis")
function MOD:GenesisDevilItem()

end

MOD:AddCallback(ModCallbacks.MC_ENTITY_TAKE_DMG, MOD.GenesisDevilItem, EntityType.ENTITY_PLAYER)