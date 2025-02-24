return {
	Ship_Crew_Requirement = 5,
	Fighters = {
		["A-WING_SQUADRON_HALF"] = {
			REBEL = {Initial = 1, Reserve = 1}
		},
		["KRSSIS_INTERCEPTOR_SQUADRON_HALF"] = {
			EMPIREOFTHEHAND = {Initial = 1, Reserve = 1},
			INDEPENDENT_FORCES = {Initial = 1, Reserve = 1}
		},
		["MIYTIL_FIGHTER_SQUADRON_HALF"] = {
			HAPES_CONSORTIUM = {Initial = 1, Reserve = 1}
		},
		["CLOAKSHAPE_NEW_SQUADRON_HALF"] = {
			HUTT_CARTELS = {Initial = 1, Reserve = 1}
		},
		["TIE_INTERCEPTOR_SQUADRON_HALF"] = {
			IMPERIAL = {Initial = 1, Reserve = 1}
		}
	},
	Scripts = {"multilayer", "fighter-spawn", "single-unit-retreat"},
	Flags = {HANGAR = true}
}