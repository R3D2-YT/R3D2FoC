require("deepcore/std/class")
require("PGSpawnUnits")
StoryUtil = require("eawx-util/StoryUtil")

---@class VentureUpgrade
PentastarTalks = class()

function PentastarTalks:new(gc)
    self.is_complete = false
    self.is_active = false
    self.ForPlayer = Find_Player("Pentastar")
    self.HumanPlayer = Find_Player("local")
    self.spawn_list = { "Ardus_Kaine_Team", "Gregor_Raquoran_Team", "Dekeet_Intractable", "Dynamic_Besk", "Otro_Enforcer"}
    self.Active_Planets = StoryUtil.GetSafePlanetTable()
end

function PentastarTalks:fulfill()
    --Logger:trace("entering PentastarTalks:fulfill")
        StoryUtil.SpawnAtSafePlanet("ENTRALLA", self.ForPlayer, self.Active_Planets, self.spawn_list) 

        if self.ForPlayer == self.HumanPlayer then
            StoryUtil.Multimedia("TEXT_CONQUEST_ALIGN_KAINE_RETURNS", 20, nil, "Kaine_Loop", 0)
        end
end

return PentastarTalks
