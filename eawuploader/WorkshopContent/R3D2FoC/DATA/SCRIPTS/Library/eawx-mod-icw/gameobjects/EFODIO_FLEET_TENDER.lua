return {
	Ship_Crew_Requirement = 25,
	Fighters = {
		["NSSIS_SQUADRON"] = {
			EMPIREOFTHEHAND = {Initial = 1, Reserve = 1},
			HOSTILE = {Initial = 1, Reserve = 1},
			INDEPENDENT_FORCES = {Initial = 1, Reserve = 1}
		},
		["HOWLRUNNER_SQUADRON"] = {
			IMPERIAL = {Initial = 1, Reserve = 1}
		},
		["MIYTIL_FIGHTER_SQUADRON"] = {
			HAPES_CONSORTIUM = {Initial = 2, Reserve = 1}
		},
		["REBEL_X-WING_SQUADRON"] = {
			REBEL = {Initial = 1, Reserve = 1}
		},
		["A-WING_SQUADRON"] = {
			REBEL = {Initial = 1, Reserve = 0}
		},
		["SCARSSIS_SQUADRON"] = {
			EMPIREOFTHEHAND = {Initial = 1 ,Reserve = 0},
			HOSTILE = {Initial = 1 ,Reserve = 0},
			INDEPENDENT_FORCES = {Initial = 1 ,Reserve = 0}
		},
		["TIE_INTERCEPTOR_SQUADRON"] = {
			IMPERIAL = {Initial = 1, Reserve = 0}
		},
		["DUNELIZARD_FIGHTER_SQUADRON_DOUBLE"] = {
			HUTT_CARTELS = {Initial = 1, Reserve = 0}
		}
	},
	Scripts = {"multilayer", "fighter-spawn", "single-unit-retreat"}
}