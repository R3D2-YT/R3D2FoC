require("eawx-util/StoryUtil")
require("PGStoryMode")
require("PGSpawnUnits")
require("eawx-util/ChangeOwnerUtilities")

return {
    on_enter = function(self, state_context)

        GlobalValue.Set("CURRENT_ERA", 5)

        self.LeaderApproach = false
        self.ResearchFired = false
        
        self.Active_Planets = StoryUtil.GetSafePlanetTable()
        self.entry_time = GetCurrentTime()
        self.plot = Get_Story_Plot("Conquests\\Events\\EventLogRepository.xml")

        StoryUtil.SetPlanetRestricted("DOORNIK", 1)
        StoryUtil.SetPlanetRestricted("ZFELL", 1)
        StoryUtil.SetPlanetRestricted("NZOTH", 1)
        StoryUtil.SetPlanetRestricted("JTPTAN", 1)
        StoryUtil.SetPlanetRestricted("POLNEYE", 1)
        StoryUtil.SetPlanetRestricted("PRILDAZ", 1)

        if self.entry_time <= 5 then
            self.ResearchFired = true
            if Find_Player("local") == Find_Player("Rebel") then
                StoryUtil.Multimedia("TEXT_CONQUEST_NR_INTRO_E5", 15, nil, "Mon_Mothma_Loop", 0)
                Story_Event("NEWREP_JAX_STARTED")
            elseif Find_Player("local") == Find_Player("Pentastar") then
                StoryUtil.Multimedia("TEXT_CONQUEST_PENTASTAR_INTRO_E5", 15, nil, nil, 0)
                Story_Event("PENTASTAR_ERAFIVE_STARTED")
            elseif Find_Player("local") == Find_Player("Eriadu_Authority") then
                StoryUtil.Multimedia("TEXT_CONQUEST_ERIADU_INTRO_E5", 15, nil, "Delvardus_Loop", 0)
                Story_Event("ERIADU_ERAFIVE_STARTED")
            elseif Find_Player("local") == Find_Player("Greater_Maldrood") then
                StoryUtil.Multimedia("TEXT_CONQUEST_MALDROOD_INTRO_E5", 15, nil, "Kosh_Teradoc_Loop", 0)
                Story_Event("MALDROOD_ERAFIVE_STARTED")
            elseif Find_Player("local") == Find_Player("EmpireoftheHand") then
                StoryUtil.Multimedia("TEXT_CONQUEST_EOTH_INTRO_E5", 15, nil, "Parck_Loop", 0)
                Story_Event("HAND_ERAFIVE_STARTED")
            elseif Find_Player("local") == Find_Player("Hapes_Consortium") then
                StoryUtil.Multimedia("TEXT_CONQUEST_INTRO_TENENIEL_ONE", 15, nil, "Teneniel_Loop2", 0)
                Story_Event("HAPES_TENENIEL_START")
            elseif Find_Player("local") == Find_Player("Corporate_Sector") then
                StoryUtil.Multimedia("TEXT_CONQUEST_INTRO_ODUMIN", 15, nil, "Odumin_Loop", 0)
                Story_Event("CSA_ERAONE_STARTED")
            end

            if self.Active_Planets["BYSS"] then
                Destroy_Planet("Byss")
            end
            if self.Active_Planets["DA_SOOCHA"] then
                Destroy_Planet("Da_Soocha")
            end

            self.Starting_Spawns = require("eawx-mod-icw/spawn-sets/EraFiveStartSet")
            for faction, herolist in pairs(self.Starting_Spawns) do
                for planet, spawnlist in pairs(herolist) do
                    StoryUtil.SpawnAtSafePlanet(planet, Find_Player(faction), self.Active_Planets, spawnlist)  
                end
            end
            
            self.Kalist_Spawns = require("eawx-mod-icw/spawn-sets/EraFiveWarlordStartSet")
            if self.Active_Planets["KALIST"] then
                for planet, spawnlist in pairs(self.Kalist_Spawns) do
                    SpawnList(spawnlist, FindPlanet("Kalist"), Find_Player("Warlords"), true, false)  
                end
            end

            crossplot:publish("CONQUER_MANDALORE_EMPIRE", "empty")
            crossplot:publish("empty", "empty") --This is here on purpose; without it, crossplot won't pick up CONQUER_MANDALORE_NR when playing as NR. ~Mord
            crossplot:publish("CONQUER_MANDALORE_NR", "empty")
            
        else

            self.Starting_Spawns = require("eawx-mod-icw/spawn-sets/EraFiveProgressSet")
            for faction, herolist in pairs(self.Starting_Spawns) do
                for planet, spawnlist in pairs(herolist) do
                    StoryUtil.SpawnAtSafePlanet(planet, Find_Player(faction), self.Active_Planets, spawnlist)  
                end
            end
            
            crossplot:publish("ERA_FIVE_TRANSITION", "empty")
        end

    end,
    on_update = function(self, state_context)
        local current = GetCurrentTime() - self.entry_time
        if (current >=5) and (self.ResearchFired == true)  then
            self.ResearchFired = false
            crossplot:publish("NCMP_RESEARCH_FINISHED", "empty")
            crossplot:publish("REPUBLIC_RESEARCH_FINISHED", "empty")
        end
    end,
    on_exit = function(self, state_context)
    end
}