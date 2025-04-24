return {
	Ship_Crew_Requirement = 300,
	Fighters = {
		["DEFENDER_STARFIGHTER_SQUADRON_DOUBLE"] = {
			HOSTILE = {Initial = 1, Reserve = 6},
			REBEL = {Initial = 1, Reserve = 6, ResearchType = "~CoS_Shesh"},
			INDEPENDENT_FORCES = {Initial = 1, Reserve = 6},
			WARLORDS = {Initial = 1, Reserve = 6}
		},
		["A9_SQUADRON_DOUBLE"] = {
			REBEL = {Initial = 1, Reserve = 6, ResearchType = "CoS_Shesh"}
		},
		["E-WING_SQUADRON_DOUBLE"] = {
			HOSTILE = {Initial = 1, Reserve = 6},
			REBEL = {Initial = 1, Reserve = 6},
			INDEPENDENT_FORCES = {Initial = 1, Reserve = 6},
			WARLORDS = {Initial = 1, Reserve = 6}
		},
		["B-WING_SQUADRON"] = {
			HOSTILE = {Initial = 1, Reserve = 4},
			REBEL = {Initial = 1, Reserve = 4, ResearchType = "~BwingE"},
			INDEPENDENT_FORCES = {Initial = 1, Reserve = 4},
			WARLORDS = {Initial = 1, Reserve = 4}
		},
		["B-WING_E_SQUADRON"] = {
			REBEL = {Initial = 1, Reserve = 4, ResearchType = "BwingE"},
		},
		["K-WING_SQUADRON"] = {
			HOSTILE = {Initial = 1, Reserve = 2},
			REBEL = {Initial = 1, Reserve = 2},
			INDEPENDENT_FORCES = {Initial = 1, Reserve = 2},
			WARLORDS = {Initial = 1, Reserve = 2}
		}
	},
	Scripts = {"multilayer", "fighter-spawn", "persistent-damage"},
	Flags = {HANGAR = true}
}