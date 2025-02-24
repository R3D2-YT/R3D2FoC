return {
	Ship_Crew_Requirement = 50,
	Fighters = {
		["REBEL_X-WING_SQUADRON_DOUBLE"] = {
			DEFAULT = {Initial = 1, Reserve = 1, ResearchType = "~CoS_Tevv"},
		},
		["DREXL_SQUADRON_DOUBLE"] = {
			DEFAULT = {Initial = 1, Reserve = 1, ResearchType = "CoS_Tevv"}
		},
		["A-WING_SQUADRON"] = {
			DEFAULT = {Initial = 1, Reserve = 1, HeroOverride = {{"TALLON_SILENT_WATER"}, {"A-WING_SQUADRON_DOUBLE"}}}
		},
		["B-WING_SQUADRON"] = {
			DEFAULT = {Initial = 1, Reserve = 1, ResearchType = "~BwingE"}
		},
		["B-WING_E_SQUADRON"] = {
			DEFAULT = {Initial = 1, Reserve = 1, ResearchType = "BwingE"}
		},
	},
	Scripts = {"multilayer", "fighter-spawn", "single-unit-retreat"},
	Flags = {HANGAR = true}
}