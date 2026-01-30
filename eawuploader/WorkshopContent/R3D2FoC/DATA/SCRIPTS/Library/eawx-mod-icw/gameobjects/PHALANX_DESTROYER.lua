return {
	Ship_Crew_Requirement = 30,
	Fighters = {
		["NSSIS_SQUADRON"] = {
			EMPIREOFTHEHAND = {Initial = 1, Reserve = 2},
			HOSTILE = {Initial = 1, Reserve = 2},
			INDEPENDENT_FORCES = {Initial = 1, Reserve = 2}
		},
		["HOWLRUNNER_SQUADRON"] = {
			IMPERIAL = {Initial = 1, Reserve = 2}
		},
		["MIYTIL_FIGHTER_SQUADRON_DOUBLE"] = {
			HAPES_CONSORTIUM = {Initial = 1, Reserve = 2}
		},
		["DUNELIZARD_FIGHTER_SQUADRON"] = {
			HUTT_CARTELS = {Initial = 1, Reserve = 2}
		},
		["REBEL_X-WING_SQUADRON"] = {
			REBEL = {Initial = 1, Reserve = 2}
		},
		["A-WING_SQUADRON"] = {
			REBEL = {Initial = 1, Reserve = 2}
		},
		["KRSSIS_INTERCEPTOR_SQUADRON"] = {
			EMPIREOFTHEHAND = {Initial = 1, Reserve = 2},
			HOSTILE = {Initial = 1, Reserve = 2},
			INDEPENDENT_FORCES = {Initial = 1, Reserve = 2}
		},
		["TIE_INTERCEPTOR_SQUADRON"] = {
			IMPERIAL = {Initial = 1, Reserve = 2}
		}
	},
	Scripts = {"multilayer", "fighter-spawn", "single-unit-retreat"},
	Flags = {FighterDespawnFactor = 2.5}
}