return {
	Ship_Crew_Requirement = 25,
	Fighters = {
		["NSSIS_SQUADRON_DOUBLE"] = {
			EMPIREOFTHEHAND = {Initial = 1, Reserve = 2, TechLevel = LessThan(4)},
			HOSTILE = {Initial = 1, Reserve = 2, TechLevel = LessThan(4)},
			INDEPENDENT_FORCES = {Initial = 1, Reserve = 2, TechLevel = LessThan(4)}
		},
		["SCARSSIS_SQUADRON_DOUBLE"] = {
			HOSTILE = {Initial = 1, Reserve = 2, TechLevel = GreaterOrEqualTo(4)},
			EMPIREOFTHEHAND = {Initial = 1, Reserve = 2, TechLevel = GreaterOrEqualTo(4)},
			INDEPENDENT_FORCES = {Initial = 1, Reserve = 2, TechLevel = GreaterOrEqualTo(4)}
		},
		["HOWLRUNNER_SQUADRON_DOUBLE"] = {
			IMPERIAL = {Initial = 1, Reserve = 2, TechLevel = LessThan(4)}
		},
		["TIE_AVENGER_SQUADRON_DOUBLE"] = {
			IMPERIAL = {Initial = 1, Reserve = 2, TechLevel = GreaterOrEqualTo(4)}
		},
		["MIYTIL_FIGHTER_SQUADRON_DOUBLE"] = {
			HAPES_CONSORTIUM = {Initial = 1, Reserve = 2}
		},
		["DUNELIZARD_FIGHTER_SQUADRON_DOUBLE"] = {
			HUTT_CARTELS = {Initial = 1, Reserve = 2}
		},
		["REBEL_X-WING_SQUADRON_DOUBLE"] = {
			REBEL = {Initial = 1, Reserve = 2, TechLevel = LessThan(4)}
		},
		["E-WING_SQUADRON_DOUBLE"] = {
			REBEL = {Initial = 1, Reserve = 2, TechLevel = GreaterOrEqualTo(4)}
		},
		["MIYTIL_BOMBER_SQUADRON_DOUBLE"] = {
			HAPES_CONSORTIUM = {Initial = 1, Reserve = 2}
		},
		["KIMOGILA_SQUADRON_DOUBLE"] = {
			HUTT_CARTELS = {Initial = 1, Reserve = 2}
		},
		["SYCA_BOMBER_SQUADRON_DOUBLE"] = {
			EMPIREOFTHEHAND = {Initial = 1, Reserve = 2},
			HOSTILE = {Initial = 1, Reserve = 2},
			INDEPENDENT_FORCES = {Initial = 1, Reserve = 2}
		},
		["TIE_BOMBER_SQUADRON_DOUBLE"] = {
			IMPERIAL = {Initial = 1, Reserve = 2}
		},
		["Y-WING_SQUADRON_DOUBLE"] = {
			REBEL = {Initial = 1, Reserve = 2}
		}
	},
	Scripts = {"multilayer", "fighter-spawn", "single-unit-retreat"}
}