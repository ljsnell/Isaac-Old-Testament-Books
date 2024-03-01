-- Item Ideas ---- 
    -- Numbers (Angel Item): Spear of Phineas (double damage for subsequent piercing shots)
-- Lamentations: Doubles creep damage ☑
-- Judges: Spawns a random beggar, 6 room charge
    -- Separate items for each judge?
-- Job: Temporary Transformation? Devolves all enemies 1 level?
    -- GetTotalDamageTaken() https://wofsauge.github.io/IsaacDocs/rep/EntityPlayer.html?h=player#int-gettotaldamagetaken
    -- https://www.reddit.com/r/themoddingofisaac/comments/5mxrxs/help_spawning_custom_item/
    -- Spawn angel after taking x amount of damage, maybe 6?
-- Joel: Spawns Locusts, 3 room charge

-- 1 Angel, 1 Devil, 1 neutral?
-- (Chapter & verse)
-- John 11:35?
-- Exodus: Devil Item: golden calf? (2 hearts for 4 bone hearts?)
----------------

MOD = RegisterMod("Old Testament", 1)

include("scripts.songOfSolomon")
include("scripts.exodus")
include("scripts.numbers")
include("scripts.jonah")
include("scripts.job")
include("scripts.joshua")
include("scripts.genesis")