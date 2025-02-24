return {
	Ship_Crew_Requirement = 15,
	Fighters = {
		["E-WING_SQUADRON"] = {
			REBEL = {Initial = 1, Reserve = 3, ResearchType = "~CoS_Tevv"},
			HOSTILE = {Initial = 1, Reserve = 3}
		},
		["DREXL_SQUADRON"] = {
			REBEL = {Initial = 1, Reserve = 3, ResearchType = "CoS_Tevv"},
			INDEPENDENT_FORCES = {Initial = 1, Reserve = 3}
		},
		["MIYTIL_FIGHTER_SQUADRON"] = {
			HAPES_CONSORTIUM = {Initial = 1, Reserve = 3}
		},
		["DUNELIZARD_FIGHTER_SQUADRON"] = {
			HUTT_CARTELS = {Initial = 1, Reserve = 3}
		},
		["TIE_AVENGER_SQUADRON"] = {
			IMPERIAL = {Initial = 1, Reserve = 3}
		},
		["B-WING_SQUADRON_HALF"] = {
			REBEL = {Initial = 1, Reserve = 1, ResearchType = "~BwingE"},
			INDEPENDENT_FORCES = {Initial = 1, Reserve = 1},
			HOSTILE = {Initial = 1, Reserve = 1}
		},
		["B-WING_E_SQUADRON_HALF"] = {
			REBEL = {Initial = 1, Reserve = 1, ResearchType = "BwingE"}
		},
		["MIYTIL_BOMBER_SQUADRON_HALF"] = {
			HAPES_CONSORTIUM = {Initial = 1, Reserve = 1}
		},
		["SCURRG_H6_SQUADRON"] = {
			HUTT_CARTELS = {Initial = 1, Reserve = 1}
		},
		["STARWING_SQUADRON_HALF"] = {
			IMPERIAL = {Initial = 1, Reserve = 1}
		}
	},
	Scripts = {"multilayer", "fighter-spawn"}
}