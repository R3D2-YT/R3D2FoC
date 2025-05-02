return {
	Ship_Crew_Requirement = 50,
	Fighters = {
		["E-WING_SQUADRON_DOUBLE"] = {
			DEFAULT = {Initial = 1, Reserve = 4}
		},
		["A-WING_SQUADRON"] = {
			DEFAULT = {Initial = 1, Reserve = 5, HeroOverride = {{"TALLON_SILENT_WATER"}, {"A-WING_SQUADRON_DOUBLE"}}}
		},
		["B-WING_SQUADRON_DOUBLE"] = {
			DEFAULT = {Initial = 1, Reserve = 3, ResearchType = "~BwingE"}
		},
		["B-WING_E_SQUADRON_DOUBLE"] = {
			DEFAULT = {Initial = 1, Reserve = 3, ResearchType = "BwingE"}
		},
		["K-WING_SQUADRON_DOUBLE"] = {
			DEFAULT = {Initial = 1, Reserve = 2}
		}
	},
	Scripts = {"multilayer", "fighter-spawn", "single-unit-retreat"}
}