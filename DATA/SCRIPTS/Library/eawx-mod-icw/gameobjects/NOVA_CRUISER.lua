return {
	Ship_Crew_Requirement = 5,
	Fighters = {
		["MIYTIL_FIGHTER_SQUADRON"] = {
			HAPES_CONSORTIUM = {Initial = 1, Reserve = 1},
			HOSTILE = {Initial = 1, Reserve = 1},
			INDEPENDENT_FORCES = {Initial = 1, Reserve = 1}
		},
		["REBEL_X-WING_SQUADRON"] = {
			REBEL = {Initial = 1, Reserve = 1}
		},
		["DUNELIZARD_FIGHTER_SQUADRON"] = {
			HUTT_CARTELS = {Initial = 1, Reserve = 1}
		},
		["TIE_FIGHTER_SQUADRON"] = {
			IMPERIAL = {Initial = 1, Reserve = 1}
		},
		["MIYTIL_BOMBER_SQUADRON_HALF"] = {
			HAPES_CONSORTIUM = {Initial = 1, Reserve = 1},
			HOSTILE = {Initial = 1, Reserve = 1},
			INDEPENDENT_FORCES = {Initial = 1, Reserve = 1}
		},
		["TIE_BOMBER_SQUADRON_HALF"] = {
			IMPERIAL = {Initial = 1, Reserve = 1}
		},
		["SCURRG_H6_SQUADRON_HALF"] = {
			HUTT_CARTELS = {Initial = 1, Reserve = 1}
		},
		["Y-WING_SQUADRON_HALF"] = {
			REBEL = {Initial = 1, Reserve = 1}
		}
	},
	Scripts = {"multilayer", "fighter-spawn", "single-unit-retreat"},
	Flags = {HANGAR = true}
}