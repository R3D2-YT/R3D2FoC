require("eawx-util/UnitUtil")
require("PGStoryMode")
require("PGSpawnUnits")
require("SetFighterResearch")

return {
	on_enter = function(self, state_context)

		self.CoronaEvent = false
		self.NCMPEvent = false
		self.ViscountEvent = false
		
		self.entry_time = GetCurrentTime()

		if self.entry_time <= 5 then
			if GlobalValue.Get("IS_DCC") == true then
				UnitUtil.SetLockList("EMPIRE", {
					"Eidolon",
					"Imperial_PX10_Company",
					"Imperial_Navy_Commando_Squad"
				}, false)
			else
				UnitUtil.SetLockList("EMPIRE", {
					"Eclipse_Star_Destroyer",
					"Sovereign",
					"MTC_Sensor",
					"MTC_Support",
					"Hunter_Killer_Probot",
					"Imperial_Chrysalide_Company",
					"Imperial_Dark_Jedi_Squad",
					"Imperial_Compforce_Assault_Squad",
					"Imperial_XR85_Company",
					"Imperial_AT_AT_Refit_Company",
					"Imperial_AT_ST_A_Company",
					"Imperial_Dark_Stormtrooper_Squad"})

				UnitUtil.SetLockList("EMPIRE", {
					"Generic_Executor",
					"Eidolon",
					"Imperial_PX10_Company",
					"Imperial_AT_ST_Company",
					"Imperial_AT_AT_Company",
					-- Historical-only units
					"Imperial_Navy_Commando_Squad"
				}, false)
			end

			UnitUtil.SetLockList("REBEL", {
				"Calamari_Cruiser",
				"MC30c",
				"MC40a",
				"Rebel_Infantry_Squad",
				"Rebel_Snowspeeder_Wing",
				"Incom_HQ",
				"Bulwark_III",
				"Jedi_Squad",
				"Jedi_Temple",
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
		else
			
			UnitUtil.SetLockList("REBEL", {
				"Calamari_Cruiser",
				"MC30c",
				"MC40a",
				"Rebel_Infantry_Squad",
				"Rebel_Snowspeeder_Wing",
				"Incom_HQ"
			}, false)
			
			UnitUtil.SetLockList("REBEL", {
				"MC90", "AckbarHO2GV", "NantzIn2FW", 
				"Defense_Trooper_Squad",
				"Rebel_Vwing_Group",
			})

			UnitUtil.SetLockList("EMPIRE", {
				"Imperial_AT_ST_Company",
				"Imperial_AT_AT_Company",
			}, false)

			UnitUtil.SetLockList("EMPIRE", {	 
				"Imperial_AT_AT_Refit_Company",
				"Imperial_AT_ST_A_Company",
			})
		end
	end,
	on_update = function(self, state_context)  
	end,
	on_exit = function(self, state_context)
	end
}
