return {
	Ship_Crew_Requirement = 15,
	Fighters = {
		["DEFENDER_STARFIGHTER_SQUADRON"] = {
			HOSTILE = {Initial = 1, Reserve = 2},
			REBEL = {Initial = 1, Reserve = 2, ResearchType = "~CoS_Shesh"},
			INDEPENDENT_FORCES = {Initial = 1, Reserve = 2}
		},
		["A9_SQUADRON"] = {
			REBEL = {Initial = 1, Reserve = 2, ResearchType = "CoS_Shesh"}
		},
		["TIE_FIGHTER_SQUADRON"] = {
			IMPERIAL = {Initial = 1, Reserve = 2}
		},
		["E-WING_SQUADRON"] = {
			HOSTILE = {Initial = 1, Reserve = 1},
			REBEL = {Initial = 1, Reserve = 1, ResearchType = "~CoS_Tevv"},
			INDEPENDENT_FORCES = {Initial = 1, Reserve = 1}
		},
		["DREXL_SQUADRON"] = {
			REBEL = {Initial = 1, Reserve = 1, ResearchType = "CoS_Tevv"}
		},
		["MIYTIL_FIGHTER_SQUADRON"] = {
			HAPES_CONSORTIUM = {Initial = 2, Reserve = 3}
		},
		["DUNELIZARD_FIGHTER_SQUADRON"] = {
			HUTT_CARTELS = {Initial = 2, Reserve = 3}
		},
		["TIE_AVENGER_SQUADRON"] = {
			IMPERIAL = {Initial = 1, Reserve = 1}
		}
	},
	Scripts = {"multilayer", "fighter-spawn", "single-unit-retreat"}
}