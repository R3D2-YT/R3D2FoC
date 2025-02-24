return {
	Ship_Crew_Requirement = 50,
	Fighters = {
		["REBEL_X-WING_SQUADRON"] = {
			HOSTILE = {Initial = 1, Reserve = 1},
			REBEL = {Initial = 1, Reserve = 1, ResearchType = "~CoS_Tevv"},
			INDEPENDENT_FORCES = {Initial = 1, Reserve = 1},
			WARLORDS = {Initial = 1, Reserve = 1}
		},
		["DREXL_SQUADRON"] = {
			REBEL = {Initial = 1, Reserve = 1, ResearchType = "CoS_Tevv"}
		},
		["A-WING_SQUADRON"] = {
			HOSTILE = {Initial = 1, Reserve = 1},
			REBEL = {Initial = 1, Reserve = 1, HeroOverride = {{"TALLON_SILENT_WATER"}, {"A-WING_SQUADRON_DOUBLE"}}},
			INDEPENDENT_FORCES = {Initial = 1, Reserve = 1},
			WARLORDS = {Initial = 1, Reserve = 1}
		},
		["B-WING_SQUADRON_DOUBLE"] = {
			HOSTILE = {Initial = 1, Reserve = 1, TechLevel = LessThan(6)},
			REBEL = {Initial = 1, Reserve = 1, ResearchType = "~BwingE"},
			INDEPENDENT_FORCES = {Initial = 1, Reserve = 1, TechLevel = LessThan(6)},
			WARLORDS = {Initial = 1, Reserve = 1, TechLevel = LessThan(6)}
		},
		["B-WING_E_SQUADRON_DOUBLE"] = {
			HOSTILE = {Initial = 1, Reserve = 1, TechLevel = GreaterOrEqualTo(6)},
			REBEL = {Initial = 1, Reserve = 1, ResearchType = "BwingE"},
			INDEPENDENT_FORCES = {Initial = 1, Reserve = 1, TechLevel = GreaterOrEqualTo(6)},
			WARLORDS = {Initial = 1, Reserve = 1, TechLevel = GreaterOrEqualTo(6)}
		}
	},
	Scripts = {"multilayer", "fighter-spawn", "single-unit-retreat"}
}