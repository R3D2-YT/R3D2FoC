return {
	Ship_Crew_Requirement = 50,
	Fighters = {
		["Z95_HEADHUNTER_SQUADRON"] = {
			REBEL = {Initial = 1, Reserve = 1}
		},
		["R22_SPEARHEAD_SQUADRON"] = {
			HOSTILE = {Initial = 1, Reserve = 1},
			REBEL = {Initial = 1, Reserve = 1},
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