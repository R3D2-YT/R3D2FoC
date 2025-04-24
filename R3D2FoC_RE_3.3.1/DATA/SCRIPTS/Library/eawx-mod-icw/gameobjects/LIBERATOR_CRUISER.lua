return {
	Ship_Crew_Requirement = 10,
	Fighters = {
		["A-WING_SQUADRON"] = {
			REBEL = {Initial = 1, Reserve = 3, HeroOverride = {{"TALLON_SILENT_WATER"}, {"A-WING_SQUADRON_DOUBLE"}}}
		},
		["MIYTIL_FIGHTER_SQUADRON"] = {
			HAPES_CONSORTIUM = {Initial = 1, Reserve = 3}
		},
		["DUNELIZARD_FIGHTER_SQUADRON"] = {
			HUTT_CARTELS = {Initial = 1, Reserve = 3}
		},
		["T-WING_SQUADRON"] = {
			CORPORATE_SECTOR = {Initial = 1, Reserve = 3},
			HOSTILE = {Initial = 1, Reserve = 3},
			INDEPENDENT_FORCES = {Initial = 1, Reserve = 3}
		},
		["V38_SQUADRON"] = {
			IMPERIAL = {Initial = 1, Reserve = 3}
		},
		["HWING_SQUADRON"] = {
			CORPORATE_SECTOR = {Initial = 1, Reserve = 1},
			HOSTILE = {Initial = 1, Reserve = 1},
			REBEL = {Initial = 1, Reserve = 1},
			INDEPENDENT_FORCES = {Initial = 1, Reserve = 1}
		},
		["MIYTIL_BOMBER_SQUADRON"] = {
			HAPES_CONSORTIUM = {Initial = 1, Reserve = 1}
		},
		["SCURRG_H6_SQUADRON"] = {
			HUTT_CARTELS = {Initial = 1, Reserve = 1}
		},
		["TIE_HEAVY_BOMBER_SQUADRON"] = {
			IMPERIAL = {Initial = 1, Reserve = 1}
		}
	},
	Scripts = {"multilayer", "fighter-spawn", "single-unit-retreat"}
}