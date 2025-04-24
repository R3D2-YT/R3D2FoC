require("eawx-util/UnitUtil")
require("PGStoryMode")
require("PGSpawnUnits")
require("SetFighterResearch")

return {
    on_enter = function(self, state_context)

        self.NCMPEvent = false
        self.RepublicEvent = false

        self.entry_time = GetCurrentTime()

        if self.entry_time <= 5 then
            UnitUtil.SetLockList("REBEL", {
				"Bulwark_III", 
				"MC90", "AckbarHO2GV", "NantzIn2FW", 
				"Defense_Trooper_Squad",
				"Rebel_Vwing_Group",
				"Jedi_Temple",
				"Jedi_Squad"
			}, false)
			
            UnitUtil.SetLockList("EMPIRE", {
				"Generic_Executor",
				"Generic_Praetor",
				"Eidolon",
				"TaggeCo_HQ",
				"Imperial_PX10_Company",
				"Imperial_AT_AT_Refit_Company",
                "Imperial_AT_ST_A_Company",
				-- Historical-only units
				"Imperial_Navy_Commando_Squad"
            }, false)
			
			UnitUtil.SetLockList("REBEL", {
				"Wedge_Lusankya",
			})
			
			Set_Fighter_Hero("WEDGE_ANTILLES_ROGUE_TEAM", "HOME_ONE")
			
			UnitUtil.SetLockList("EMPIRE", {
				"Imperial_Boarding_Shuttle",
				"Imperial_Ysalamiri_Stormtrooper_Squad",
				"Noghri_Assassin_Squad"
            })
			
			UnitUtil.SetLockList("PENTASTAR", {
				"Cygnus_HQ",
				"Merkuni_HQ"
			})

            UnitUtil.SetLockList("ERIADU_AUTHORITY", {
                "TaggeCo_HQ",
                "BrilliantUpgradeEarly"
            }, false)

            UnitUtil.SetLockList("GREATER_MALDROOD", {
                "TaggeCo_HQ"
            }, false)

            UnitUtil.SetLockList("PENTASTAR", {
                "TaggeCo_HQ"
            }, false)

            UnitUtil.SetLockList("ZSINJ_EMPIRE", {
                "TaggeCo_HQ"
            }, false)
        end
    end,
    on_update = function(self, state_context)  
    end,
    on_exit = function(self, state_context)
    end
}