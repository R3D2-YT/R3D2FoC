return {
	Ship_Crew_Requirement = 10,
	Fighters = {
		["E-WING_SQUADRON"] = {
			HOSTILE = {Initial = 1, Reserve = 3},
			REBEL = {Initial = 1, Reserve = 3},
			INDEPENDENT_FORCES = {Initial = 1, Reserve = 3}
		},
		["MIYTIL_FIGHTER_SQUADRON"] = {
			HAPES_CONSORTIUM = {Initial = 1, Reserve = 3}
		},
		["TIE_AVENGER_SQUADRON"] = {
			IMPERIAL = {Initial = 1, Reserve = 3}
		},
		["DUNELIZARD_FIGHTER_SQUADRON"] = {
			HUTT_CARTELS = {Initial = 1, Reserve = 3}
		},
		["B-WING_SQUADRON"] = {
			HOSTILE = {Initial = 1, Reserve = 3, TechLevel = LessThan(4)},
			REBEL = {Initial = 1, Reserve = 3, ResearchType = "~BwingE"},
			INDEPENDENT_FORCES = {Initial = 1, Reserve = 3, TechLevel = LessThan(4)}
		},
		["B-WING_E_SQUADRON"] = {
			HOSTILE = {Initial = 1, Reserve = 3, TechLevel = GreaterOrEqualTo(4)},
			REBEL = {Initial = 1, Reserve = 3, ResearchType = "BwingE"},
			INDEPENDENT_FORCES = {Initial = 1, Reserve = 3, TechLevel = GreaterOrEqualTo(4)}
		},
		["STARWING_SQUADRON"] = {
			IMPERIAL = {Initial = 1, Reserve = 3}
		},
		["K-WING_SQUADRON"] = {
			HOSTILE = {Initial = 1, Reserve = 3},
			REBEL = {Initial = 1, Reserve = 3},
			INDEPENDENT_FORCES = {Initial = 1, Reserve = 3}
		},
		["MIYTIL_BOMBER_SQUADRON_DOUBLE"] = {
			HAPES_CONSORTIUM = {Initial = 1, Reserve = 3}
		},
		["KIMOGILA_SQUADRON_DOUBLE"] = {
			HUTT_CARTELS = {Initial = 1, Reserve = 3}
		},
		["TIE_HEAVY_BOMBER_SQUADRON"] = {
			IMPERIAL = {Initial = 1, Reserve = 3}
		}
	},
	Scripts = {"multilayer", "fighter-spawn", "single-unit-retreat"}
}