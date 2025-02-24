require("eawx-util/StoryUtil")
require("PGStoryMode")
require("PGSpawnUnits")

return {
    on_enter = function(self, state_context)

        GlobalValue.Set("CURRENT_ERA", 2)
       
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

            if Find_Player("local") == Find_Player("Rebel") then
                StoryUtil.Multimedia("TEXT_CONQUEST_ISARD_NR_INTRO_MOTHMA", 15, nil, "Mon_Mothma_Loop", 0)
                Story_Event("NEWREP_ISARD_STARTED")
            elseif Find_Player("local") == Find_Player("Pentastar") then
                StoryUtil.Multimedia("TEXT_CONQUEST_PENTASTAR_INTRO_E2", 15, nil, "Kaine_Loop", 0)
                Story_Event("PENTASTAR_ERATWO_STARTED")
            elseif Find_Player("local") == Find_Player("Eriadu_Authority") then
                StoryUtil.Multimedia("TEXT_CONQUEST_ERIADU_INTRO_E2", 15, nil, "Delvardus_Loop", 0)
                Story_Event("ERIADU_ERATWO_STARTED")
            elseif Find_Player("local") == Find_Player("Greater_Maldrood") then
                StoryUtil.Multimedia("TEXT_CONQUEST_MALDROOD_INTRO_E2", 15, nil, "Treuten_Teradoc_Loop", 0)
                Story_Event("MALDROOD_ERATWO_STARTED")
            elseif Find_Player("local") == Find_Player("Zsinj_Empire") then
                StoryUtil.Multimedia("TEXT_CONQUEST_ZSINJ_INTRO_E2", 15, nil, "Zsinj_Loop", 0)
                Story_Event("ZSINJ_ERATWO_STARTED")
            elseif Find_Player("local") == Find_Player("EmpireoftheHand") then
                StoryUtil.Multimedia("TEXT_CONQUEST_EOTH_INTRO_E2", 15, nil, "Thrawn_Loop", 0)
                Story_Event("HAND_ERATWO_STARTED")
            elseif Find_Player("local") == Find_Player("Hapes_Consortium") then
                StoryUtil.Multimedia("TEXT_CONQUEST_INTRO_TAA_ONE", 15, nil, "TaaChume_Loop2", 0)
                Story_Event("HAPES_TAA_START")
            end

            self.Starting_Spawns = require("eawx-mod-icw/spawn-sets/EraTwoStartSet")
            for faction, herolist in pairs(self.Starting_Spawns) do
                for planet, spawnlist in pairs(herolist) do
                    StoryUtil.SpawnAtSafePlanet(planet, Find_Player(faction), self.Active_Planets, spawnlist)  
                end
            end

            self.CCoGMSpawns = require("eawx-mod-icw/spawn-sets/EraTwoCCoGMProgressSetWarlord")
            if self.Active_Planets["KESSEL"] then
                for planet, spawnlist in pairs(self.CCoGMSpawns) do
                    SpawnList(spawnlist, FindPlanet("Kessel"), Find_Player("Warlords"), true, false)  
                end
            end
            
            self.CiutricSpawns = require("eawx-mod-icw/spawn-sets/EraTwoWarlordStartSet")
            if self.Active_Planets["CIUTRIC"] then
                for planet, spawnlist in pairs(self.CiutricSpawns) do
                    SpawnList(spawnlist, FindPlanet("Ciutric"), Find_Player("Warlords"), true, false)  
                end
            end

            crossplot:publish("CONQUER_MANDALORE_EMPIRE", "empty")
            crossplot:publish("empty", "empty") --This is here on purpose; without it, crossplot won't pick up CONQUER_MANDALORE_NR when playing as NR. ~Mord
            crossplot:publish("CONQUER_MANDALORE_NR", "empty")

        else
            
            self.Starting_Spawns = require("eawx-mod-icw/spawn-sets/EraTwoProgressSet")
            for faction, herolist in pairs(self.Starting_Spawns) do
                for planet, spawnlist in pairs(herolist) do
                    StoryUtil.SpawnAtSafePlanet(planet, Find_Player(faction), self.Active_Planets, spawnlist)  
                end
            end

            crossplot:publish("ERA_TWO_TRANSITION", "empty")
        end

    end,
    on_update = function(self, state_context)
    end,
    on_exit = function(self, state_context)
    end
}