require("eawx-util/UnitUtil")
require("PGStoryMode")
require("PGSpawnUnits")
require("SetFighterResearch")

return {
	on_enter = function(self, state_context)

		self.NCMPEvent = false
		self.ViscountEvent = false

		self.entry_time = GetCurrentTime()

		if self.entry_time <= 5 then	
			UnitUtil.SetLockList("REBEL", {
				"Calamari_Cruiser",
				"MC30c",
				"MC40a",
				"Rebel_Infantry_Squad",
				"Rebel_Snowspeeder_Wing",
				"Incom_HQ",
				"Bulwark_III",
				"Jedi_Temple",
				"Jedi_Squad",
				"Nebulon_B_Frigate", 
				"Nebulon_B_Tender", 
				"Sienar_HQ"
			}, false)
			
			UnitUtil.SetLockList("REBEL", {
				"Wedge_Lusankya",
				"Sacheen", 
				"Hajen", 
				"Corona",
				"Belarus",
				"Republic_SD", 
				"SnunbUpgrade", 
				"REC_HQ"
			})

			UnitUtil.SetLockList("EMPIRE", {
				"Generic_Executor",
				"Eidolon",
				"Imperial_Dark_Jedi_Squad",
				"Imperial_PX10_Company",
				"Imperial_AT_ST_Company",
				"Imperial_AT_AT_Company",
				-- Historical-only units
				"Imperial_Navy_Commando_Squad" 
			}, false)

			UnitUtil.SetLockList("EMPIRE", {
				"Delta_JV7_Squadron",
				"Cygnus_HQ",
				"Imperial_AT_AT_Refit_Company",
				"Imperial_AT_ST_A_Company",
			})
			
			UnitUtil.SetLockList("PENTASTAR", {
				"Cygnus_HQ",
				"Merkuni_HQ"
			})
			
			UnitUtil.SetLockList("CORPORATE_SECTOR", {
				"MTC_Combat",
				"MTC_Support"
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
		else
			UnitUtil.SetLockList("CORPORATE_SECTOR", {
				"MTC_Combat",
				"MTC_Support"
			})
		end
	end,
	on_update = function(self, state_context)   
	end,
	on_exit = function(self, state_context)
	end
}