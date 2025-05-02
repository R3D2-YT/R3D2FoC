return {
	Ship_Crew_Requirement = 1,
	Fighters = {
		["A9_SQUADRON_HALF"] = {
			HOSTILE = {Initial = 1, Reserve = 2},
			IMPERIAL = {Initial = 1, Reserve = 2},
			REBEL = {Initial = 1, Reserve = 2},
			INDEPENDENT_FORCES = {Initial = 1, Reserve = 2}
		},
		["STARWING_SQUADRON_HALF"] = {
			IMPERIAL = {Initial = 1, Reserve = 2}
		},
		["CLOAKSHAPE_NEW_SQUADRON_HALF"] = {
			HUTT_CARTELS = {Initial = 1, Reserve = 2}
		},
		["Y-WING_SQUADRON_HALF"] = {
			HOSTILE = {Initial = 1, Reserve = 2},
			REBEL = {Initial = 1, Reserve = 2},
			INDEPENDENT_FORCES = {Initial = 1, Reserve = 2}
		},
		["SCURRG_H6_SQUADRON_HALF"] = {
			HUTT_CARTELS = {Initial = 1, Reserve = 2}
		}
	},
	Scripts = {"multilayer", "fighter-spawn", "single-unit-retreat"},
	Flags = {HANGAR = true}
}