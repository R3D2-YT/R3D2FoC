return {
	Ship_Crew_Requirement = 25,
	Fighters = {
		["A9_SQUADRON"] = {
			HAPES_CONSORTIUM = {Initial = 1, Reserve = 1},
			REBEL = {Initial = 1, Reserve = 1},
			INDEPENDENT_FORCES = {Initial = 1, Reserve = 1},
			HOSTILE = {Initial = 1, Reserve = 1}
		},
		["TIE_FIGHTER_SQUADRON"] = {
			IMPERIAL = {Initial = 1, Reserve = 1}
		},
		["E-WING_SQUADRON"] = {
			REBEL = {Initial = 1, Reserve = 1},
			INDEPENDENT_FORCES = {Initial = 1, Reserve = 1},
			HOSTILE = {Initial = 1, Reserve = 1}
		},
		["MIYTIL_FIGHTER_SQUADRON"] = {
			HAPES_CONSORTIUM = {Initial = 1, Reserve = 1}
		},
		["DUNELIZARD_FIGHTER_SQUADRON"] = {
			HUTT_CARTELS = {Initial = 1, Reserve = 1}
		},
		["TIE_AVENGER_SQUADRON"] = {
			IMPERIAL = {Initial = 1, Reserve = 1}
		}
	},
	Scripts = {"multilayer", "fighter-spawn", "single-unit-retreat", "interdictor-ai"}
}