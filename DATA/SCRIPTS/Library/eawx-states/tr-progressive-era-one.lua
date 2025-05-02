require("eawx-util/StoryUtil")
require("PGStoryMode")
require("PGSpawnUnits")

return {
    on_enter = function(self, state_context)

        GlobalValue.Set("CURRENT_ERA", 1)

        self.LeaderApproach = false
        
        self.Active_Planets = StoryUtil.GetSafePlanetTable()
        self.entry_time = GetCurrentTime()
        self.plot = Get_Story_Plot("Conquests\\Events\\EventLogRepository.xml")

        StoryUtil.SetPlanetRestricted("DOORNIK", 1)
        StoryUtil.SetPlanetRestricted("ZFELL", 1)
        StoryUtil.SetPlanetRestricted("NZOTH", 1)
        StoryUtil.SetPlanetRestricted("JTPTAN", 1)
        StoryUtil.SetPlanetRestricted("POLNEYE", 1)
        StoryUtil.SetPlanetRestricted("PRILDAZ", 1)

        if Find_Player("local") == Find_Player("Rebel") then
            StoryUtil.Multimedia("TEXT_CONQUEST_WARLORDS_NR_INTRO_MOTHMA", 15, nil, "Mon_Mothma_Loop", 0)
            Story_Event("NEWREP_PESTAGE_STARTED")
        elseif Find_Player("local") == Find_Player("Pentastar") then
            StoryUtil.Multimedia("TEXT_CONQUEST_PENTASTAR_INTRO_E1", 15, nil, "Kaine_Loop", 0)
            Story_Event("PENTASTAR_ERAONE_STARTED")
        elseif Find_Player("local") == Find_Player("Eriadu_Authority") then
            StoryUtil.Multimedia("TEXT_CONQUEST_ERIADU_INTRO_E1", 15, nil, "Delvardus_Loop", 0)
            Story_Event("ERIADU_ERAONE_STARTED")
        elseif Find_Player("local") == Find_Player("Greater_Maldrood") then
            StoryUtil.Multimedia("TEXT_CONQUEST_MALDROOD_INTRO_E1", 15, nil, "Treuten_Teradoc_Loop", 0)
            Story_Event("MALDROOD_ERAONE_STARTED")
        elseif Find_Player("local") == Find_Player("Zsinj_Empire") then
            StoryUtil.Multimedia("TEXT_CONQUEST_ZSINJ_INTRO_E1", 15, nil, "Zsinj_Loop", 0)
            Story_Event("ZSINJ_ERAONE_STARTED")
        elseif Find_Player("local") == Find_Player("EmpireoftheHand") then
            StoryUtil.Multimedia("TEXT_CONQUEST_EOTH_INTRO_E1", 15, nil, "Thrawn_Loop", 0)
            Story_Event("HAND_ERAONE_STARTED")
        elseif Find_Player("local") == Find_Player("Hapes_Consortium") then
            StoryUtil.Multimedia("TEXT_CONQUEST_INTRO_TAA_ONE", 15, nil, "TaaChume_Loop", 0)
            Story_Event("HAPES_TAA_START")
        elseif Find_Player("local") == Find_Player("Corporate_Sector") then
            StoryUtil.Multimedia("TEXT_CONQUEST_INTRO_ODUMIN", 15, nil, "Odumin_Loop", 0)
            Story_Event("CSA_STARTED")
        end

        self.Starting_Spawns = require("eawx-mod-icw/spawn-sets/EraOneStartSet")
        for faction, herolist in pairs(self.Starting_Spawns) do
            for planet, spawnlist in pairs(herolist) do
                StoryUtil.SpawnAtSafePlanet(planet, Find_Player(faction), self.Active_Planets, spawnlist)  
            end
        end

        crossplot:publish("CONQUER_CENTARES", "empty")
        crossplot:publish("CONQUER_KASHYYYK", "empty")
        crossplot:publish("CONQUER_MANDALORE_EMPIRE", "empty")
        --For era 1 starts, no empty publication seems necessary for crossplot to pick up CONQUER_MANDALORE_NR when playing as NR. ~Mord
        crossplot:publish("CONQUER_MANDALORE_NR", "empty")

    end,
    on_update = function(self, state_context)
    end,
    on_exit = function(self, state_context)
    end
}