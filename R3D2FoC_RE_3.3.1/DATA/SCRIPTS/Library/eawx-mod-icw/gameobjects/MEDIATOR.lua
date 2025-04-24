return {
	Ship_Crew_Requirement = 50,
	Fighters = {
		["E-WING_SQUADRON"] = {
			HOSTILE = {Initial = 1, Reserve = 2},
			REBEL = {Initial = 1, Reserve = 2},
			INDEPENDENT_FORCES = {Initial = 1, Reserve = 2},
			WARLORDS = {Initial = 1, Reserve = 2}
		},
		["A-WING_SQUADRON"] = {
			HOSTILE = {Initial = 1, Reserve = 2},
			REBEL = {Initial = 1, Reserve = 2, ResearchType = "~CoS_Shesh", HeroOverride = {{"TALLON_SILENT_WATER"}, {"A-WING_SQUADRON_DOUBLE"}}},
			INDEPENDENT_FORCES = {Initial = 1, Reserve = 2},
			WARLORDS = {Initial = 1, Reserve = 2}
		},
		["A9_SQUADRON"] = {
			REBEL = {Initial = 1, Reserve = 2, ResearchType = "CoS_Shesh"}
		}
	},
	Scripts = {"multilayer", "fighter-spawn", "single-unit-retreat"}
}