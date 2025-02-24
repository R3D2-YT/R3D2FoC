require("eawx-util/UnitUtil")
require("PGStoryMode")
require("PGSpawnUnits")
require("SetFighterResearch")

return {
	on_enter = function(self, state_context)

		self.entry_time = GetCurrentTime()

		self.GorathEvent = false
		self.NCMPEvent = false
		self.ViscountEvent = false

		if self.entry_time <= 5 then
			UnitUtil.SetLockList("REBEL", {
				"Calamari_Cruiser",
				"MC30c",
				"MC40a",
				"Rebel_Infantry_Squad",
				"Rebel_Snowspeeder_Wing",
				"Incom_HQ",
				"Bulwark_III",
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
				"Eidolon",
				"IPV1_System_Patrol_Craft",
				"Imperial_PX10_Company",
				"Imperial_AT_ST_Company",
				"Imperial_AT_AT_Company",
				"TaggeCo_HQ",
				-- Historical-only units
				"Imperial_Navy_Commando_Squad"
			}, false)
		
			UnitUtil.SetLockList("EMPIRE", {
				"Nebulon_B_Empire",
				"Crusader_Gunship",
				"Delta_JV7_Squadron",
				"Cygnus_HQ",
				"Imperial_Dwarf_Spider_Droid_Company",
				"Imperial_AT_AT_Refit_Company",
				"Imperial_AT_ST_A_Company",
			})

			UnitUtil.SetLockList("PENTASTAR", {
				"Cygnus_HQ",
				"Merkuni_HQ",
				"Adz"
			})
			
			UnitUtil.SetLockList("ZSINJ_EMPIRE", {
				"Adz"
			})
			
			UnitUtil.SetLockList("GREATER_MALDROOD", {
				"Adz"
			})
			
			UnitUtil.SetLockList("ERIADU_AUTHORITY", {
				"Adz",
				"IPV4"
			})

			UnitUtil.SetLockList("ERIADU_AUTHORITY", {
				"IPV1_System_Patrol_Craft"
			}, false)
			
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
			UnitUtil.SetLockList("REBEL", {
				"Jedi_Temple",
				"Jedi_Squad"
			})
			
			UnitUtil.SetLockList("PENTASTAR", {
				"Adz"
			})
			
			UnitUtil.SetLockList("ZSINJ_EMPIRE", {
				"Adz"
			})
			
			UnitUtil.SetLockList("GREATER_MALDROOD", {
				"Adz"
			})
			
			UnitUtil.SetLockList("ERIADU_AUTHORITY", {
				"Adz",
				"IPV4"
			})

			UnitUtil.SetLockList("ERIADU_AUTHORITY", {
				"IPV1_System_Patrol_Craft"
			}, false)
		end
	end,
	on_update = function(self, state_context)  
	end,
	on_exit = function(self, state_context)
	end
}