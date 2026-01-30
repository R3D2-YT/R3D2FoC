return {
	Ship_Crew_Requirement = 15,
	Fighters = {
		["A-WING_SQUADRON"] = {
			REBEL = {Initial = 1, Reserve = 1, HeroOverride = {{"TALLON_SILENT_WATER"}, {"A-WING_SQUADRON_DOUBLE"}}}
		},
		["T-WING_SQUADRON"] = {
			CORPORATE_SECTOR = {Initial = 1, Reserve = 1},
			HAPES_CONSORTIUM = {Initial = 1, Reserve = 1},
			HOSTILE = {Initial = 1, Reserve = 1},
			INDEPENDENT_FORCES = {Initial = 1, Reserve = 1}
		},
		["V38_SQUADRON"] = {
			EMPIRE = {Initial = 1, Reserve = 1}
		},
		["DUNELIZARD_FIGHTER_SQUADRON"] = {
			HUTT_CARTELS = {Initial = 1, Reserve = 1}
		},
		["B-WING_SQUADRON"] = {
			HAPES_CONSORTIUM = {Initial = 1, Reserve = 1},
			HOSTILE = {Initial = 1, Reserve = 1, TechLevel = LessThan(6)},
			REBEL = {Initial = 1, Reserve = 1, ResearchType = "~BwingE"},
			INDEPENDENT_FORCES = {Initial = 1, Reserve = 1, TechLevel = LessThan(6)}
		},
		["B-WING_E_SQUADRON"] = {
			HOSTILE = {Initial = 1, TechLevel = GreaterOrEqualTo(6), Reserve = 1},
			REBEL = {Initial = 1, Reserve = 1, ResearchType = "BwingE"},
			INDEPENDENT_FORCES = {Initial = 1, TechLevel = GreaterOrEqualTo(6), Reserve = 1}
		},
		["BTLB_Y-WING_SQUADRON"] = {
			CORPORATE_SECTOR = {Initial = 1, Reserve = 1}
		},
		["KIMOGILA_SQUADRON"] = {
			HUTT_CARTELS = {Initial = 1, Reserve = 1}
		},
		["STARWING_SQUADRON"] = {
			EMPIRE = {Initial = 1, Reserve = 1}
		}
	},
	Scripts = {"multilayer", "fighter-spawn", "single-unit-retreat"}
}