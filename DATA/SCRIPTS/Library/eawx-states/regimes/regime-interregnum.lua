require("eawx-util/StoryUtil")
require("eawx-util/UnitUtil")
require("PGStoryMode")
require("PGSpawnUnits")

return {
    on_enter = function(self, state_context)
    
        self.Active_Planets = StoryUtil.GetSafePlanetTable()
        self.entry_time = GetCurrentTime()
        self.plot = Get_Story_Plot("Conquests\\Events\\EventLogRepository.xml")
    
        if self.Active_Planets["CIUTRIC"] then
            if FindPlanet("CIUTRIC").Get_Owner() == Find_Player("Warlords") then
                local check_list = {"Krennel_Warlord","Phulik_Binder","Darron_Direption","Brothic_Team"}
                local spawn_list = {}
                
                for i, check_object in pairs(check_list) do
                    if not Find_First_Object(check_object) then
                        table.insert(spawn_list,check_object)
                    end
                end
                
                SpawnList(spawn_list,FindPlanet("CIUTRIC"),Find_Player("Warlords"),true,false)
            end
        end
            
        UnitUtil.SetLockList("EMPIRE", {
            "Imperial_Boarding_Shuttle",
            "Imperial_Ysalamiri_Stormtrooper_Squad",
            "Noghri_Assassin_Squad",
            "Phennir_Location_Set"
        }, false)
        
        if Find_Player("local") == Find_Player("Empire") then
            StoryUtil.Multimedia("TEXT_CONQUEST_EVENT_IR_THRAWN_DEATH", 15, nil, "Imperial_Naval_Officer_Loop", 0)
        end

        Set_To_First_Extant_Host("TURR_PHENNIR_TIE_INTERCEPTOR_LOCATION_SET", Find_Player("Empire"), true)

        self.Starting_Spawns = require("eawx-mod-icw/spawn-sets/EmpireProgressSet")
        for planet, herolist in pairs(self.Starting_Spawns["THRAWN"]) do
            for _, hero_table in pairs(herolist) do
                if hero_table.remove == true then
                    local target_object = Find_First_Object(hero_table.object)
                    if hero_table.override then
                        target_object = Find_First_Object(hero_table.override)
                    end
                    if TestValid(target_object) then
                        target_object.Despawn()
                    end
                end
            end
        end

    end,
    on_update = function(self, state_context)
    end,
    on_exit = function(self, state_context)
    end
}