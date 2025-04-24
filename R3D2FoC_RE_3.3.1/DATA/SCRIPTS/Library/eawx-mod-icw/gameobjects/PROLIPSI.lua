return {
	Ship_Crew_Requirement = 10,
	Fighters = {
		["NSSIS_SQUADRON_HALF"] = {
			EMPIREOFTHEHAND = {Initial = 1, Reserve = 2},
			HOSTILE = {Initial = 1, Reserve = 2},
			INDEPENDENT_FORCES = {Initial = 1, Reserve = 2}
		},
		["MIYTIL_FIGHTER_SQUADRON_HALF"] = {
			HAPES_CONSORTIUM = {Initial = 1, Reserve = 2}
		},
		["DUNELIZARD_FIGHTER_SQUADRON"] = {
			HUTT_CARTELS = {Initial = 1, Reserve = 2}
		},
		["REBEL_X-WING_SQUADRON_HALF"] = {
			REBEL = {Initial = 1, Reserve = 2}
		},
		["TIE_FIGHTER_SQUADRON_HALF"] = {
			IMPERIAL = {Initial = 1, Reserve = 2}
		}
	},
	Scripts = {"multilayer", "fighter-spawn", "single-unit-retreat", "interdictor-ai"},
	Flags = {HANGAR = true}
}