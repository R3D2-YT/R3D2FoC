return {
	Ship_Crew_Requirement = 10,
	Fighters = {
		["MIYTIL_FIGHTER_SQUADRON"] = {
			HAPES_CONSORTIUM = {Initial = 1, Reserve = 2}
		},
		["TIE_SENTINEL_SQUADRON"] = {
			IMPERIAL = {Initial = 1, Reserve = 2},
			HOSTILE = {Initial = 1, Reserve = 2}
		},
		["Z95_HEADHUNTER_SQUADRON"] = {
			INDEPENDENT_FORCES = {Initial = 1, Reserve = 2},
			HUTT_CARTELS = {Initial = 1, Reserve = 2},
			REBEL = {Initial = 1, Reserve = 2, TechLevel = LessThan(4)}
		},
		["DEFENDER_STARFIGHTER_SQUADRON"] = {
			REBEL ={Initial = 1, Reserve = 2, TechLevel = GreaterOrEqualTo(4)}
		},
		["MIYTIL_BOMBER_SQUADRON_HALF"] = {
			HAPES_CONSORTIUM = {Initial = 1, Reserve = 3}
		},
		["TIE_BOMBER_SQUADRON_HALF"] = {
			IMPERIAL = {Initial = 1, Reserve = 3},
			INDEPENDENT_FORCES = {Initial = 1, Reserve = 3},
			HOSTILE = {Initial = 1, Reserve = 3}
		},
		["Y-WING_SQUADRON_HALF"] = {
			REBEL = {Initial = 1, Reserve = 3}
		},
		["SCURRG_H6_SQUADRON_HALF"] = {
			HUTT_CARTELS = {Initial = 1, Reserve = 3}
		}
	},
	Scripts = {"multilayer", "fighter-spawn", "single-unit-retreat"},
	Flags = {HANGAR = true}
}