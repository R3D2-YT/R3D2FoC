return {
	Ship_Crew_Requirement = 10,
	Fighters = {
		["MIYTIL_FIGHTER_SQUADRON_DOUBLE"] = {
			HAPES_CONSORTIUM = {Initial = 1, Reserve = 2}
		},
		["DUNELIZARD_FIGHTER_SQUADRON_DOUBLE"] = {
			HUTT_CARTELS = {Initial = 1, Reserve = 2}
		},
		["TIE_FIGHTER_SQUADRON_DOUBLE"] = {
			HOSTILE = {Initial = 1, Reserve = 2},
			IMPERIAL = {Initial = 1, Reserve = 2},
			INDEPENDENT_FORCES = {Initial = 1, Reserve = 2}
		},
		["Z95_HEADHUNTER_SQUADRON_DOUBLE"] = {
			REBEL = {Initial = 1, Reserve = 2, TechLevel = LessThan(4)}
		},
		["DEFENDER_STARFIGHTER_SQUADRON_DOUBLE"] = {
			REBEL = {Initial = 1, Reserve = 2, TechLevel = GreaterOrEqualTo(4)}
		},
		["MIYTIL_BOMBER_SQUADRON_DOUBLE"] = {
			HAPES_CONSORTIUM = {Initial = 1, Reserve = 2}
		},
		["SCURRG_H6_SQUADRON_DOUBLE"] = {
			HUTT_CARTELS = {Initial = 1, Reserve = 2}
		},
		["TIE_BOMBER_SQUADRON_DOUBLE"] = {
			HOSTILE = {Initial = 1, Reserve = 2},
			IMPERIAL = {Initial = 1, Reserve = 2},
			INDEPENDENT_FORCES = {Initial = 1, Reserve = 2}
		},
		["Y-WING_SQUADRON_DOUBLE"] = {
			REBEL = {Initial = 1, Reserve = 2}
		}
	},
	Scripts = {"multilayer", "fighter-spawn", "single-unit-retreat"}
}