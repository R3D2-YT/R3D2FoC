return {
	Ship_Crew_Requirement = 5,
	Fighters = {
		["MIYTIL_FIGHTER_SQUADRON"] = {
			HAPES_CONSORTIUM = {Initial = 1, Reserve = 0},
			HOSTILE = {Initial = 1, Reserve = 0},
			INDEPENDENT_FORCES = {Initial = 1, Reserve = 0}
		},
		["REBEL_X-WING_SQUADRON"] = {
			REBEL = {Initial = 1, Reserve = 0}
		},
		["DUNELIZARD_FIGHTER_SQUADRON"] = {
			HUTT_CARTELS = {Initial = 1, Reserve = 0}
		},
		["TIE_FIGHTER_SQUADRON"] = {
			IMPERIAL = {Initial = 1, Reserve = 0}
		}
	},
	Scripts = {"multilayer", "fighter-spawn", "single-unit-retreat"},
	Flags = {HANGAR = true}
}