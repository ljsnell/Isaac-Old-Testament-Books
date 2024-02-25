-- Devil Item: 
-- Mark of Cain: Deals black heart damage anytime you take heart damage
-- Art based on this letter, theorized to be the mark of Cain: https://en.wikipedia.org/wiki/Waw_(letter)
local devilGenesis = Isaac.GetItemIdByName("Genesis 4:14-15")
function MOD:GenesisDevilItem()
    local player = Isaac.GetPlayer()
    local itemCount = player:GetCollectibleNum(devilGenesis)
    if itemCount > 0 then
       -- https://www.reddit.com/r/themoddingofisaac/comments/6c23d9/what_are_the_tags_to_cause_damage_to_entities/ 
       -- Deal 40 damage just like a black heart https://bindingofisaacrebirth.fandom.com/wiki/Hearts
        local entities = Isaac.GetRoomEntities()
        for i = 1, entities do
            if entities[i]:IsVulnerableEnemy() then
                entities[i]:TakeDamage(40, 0, EntityRef(Isaac.GetPlayer()), 1)
            end
        -- Black heart audio cue
        SFXManager():Play(SoundEffect.SOUND_UNHOLY, 1, 0, false, 1, 0)
        end
    end
end

MOD:AddCallback(ModCallbacks.MC_ENTITY_TAKE_DMG, MOD.GenesisDevilItem, EntityType.ENTITY_PLAYER)