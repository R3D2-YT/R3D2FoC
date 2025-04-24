return {
	Ship_Crew_Requirement = 15,
	Fighters = {
		["HOWLRUNNER_SQUADRON"] = {
			IMPERIAL = {Initial = 1, Reserve = 2}
		},
		["REBEL_X-WING_SQUADRON"] = {
			HOSTILE = {Initial = 1, Reserve = 2},
			REBEL = {Initial = 1, Reserve = 2},
			INDEPENDENT_FORCES = {Initial = 1, Reserve = 2},
			HAPES_CONSORTIUM = {Initial = 1, Reserve = 2},
			HUTT_CARTELS = {Initial = 1, Reserve = 2}
		},
		["TIE_BOMBER_SQUADRON"] = {
			IMPERIAL = {Initial = 1, Reserve = 2}
		},
		["Y-WING_SQUADRON"] = {
			HOSTILE = {Initial = 1, Reserve = 2},
			REBEL = {Initial = 1, Reserve = 2},
			INDEPENDENT_FORCES = {Initial = 1, Reserve = 2},
			HAPES_CONSORTIUM = {Initial = 1, Reserve = 2},
			HUTT_CARTELS = {Initial = 1, Reserve = 2}
		}
	},
	Scripts = {"multilayer", "fighter-spawn", "single-unit-retreat"}
}