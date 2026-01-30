return {
	Ship_Crew_Requirement = 10,
	Fighters = {
		["HOWLRUNNER_SQUADRON_HALF"] = {
			IMPERIAL = {Initial = 1, Reserve = 1}
		},
		["MIYTIL_FIGHTER_SQUADRON_HALF"] = {
			HAPES_CONSORTIUM = {Initial = 1, Reserve = 1}
		},
		["CLOAKSHAPE_NEW_SQUADRON"] = {
			HUTT_CARTELS = {Initial = 1, Reserve = 1}
		},
		["REBEL_X-WING_SQUADRON_HALF"] = {
			HOSTILE = {Initial = 1, Reserve = 1},
			REBEL = {Initial = 1, Reserve = 1},
			INDEPENDENT_FORCES = {Initial = 1, Reserve = 1}
		}
	},
	Scripts = {"multilayer", "fighter-spawn", "single-unit-retreat"},
	Flags = {HANGAR = true}
}