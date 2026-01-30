return {
	Ship_Crew_Requirement = 10,
	Fighters = {
		["TIE_FIGHTER_SQUADRON_HALF"] = {
			IMPERIAL = {Initial = 1, Reserve = 3}
		},
		["Z95_HEADHUNTER_SQUADRON_HALF"] = {
			HAPES_CONSORTIUM = {Initial = 1, Reserve = 3},
			HOSTILE = {Initial = 1, Reserve = 3, TechLevel = LessThan(4)},
			REBEL = {Initial = 1, Reserve = 3, TechLevel = LessThan(4), ResearchType = "~CoS_Shesh"},
			INDEPENDENT_FORCES = {Initial = 1, Reserve = 3},
			HUTT_CARTELS = {Initial = 1, Reserve = 3}
		},
		["DEFENDER_STARFIGHTER_SQUADRON_HALF"] = {
			HOSTILE = {Initial = 1, Reserve = 3, TechLevel = GreaterOrEqualTo(4)},
			REBEL = {Initial = 1, Reserve = 3, TechLevel = GreaterOrEqualTo(4), ResearchType = "~CoS_Shesh"},
		},
		["A9_SQUADRON_HALF"] = {
			REBEL = {Initial = 1, Reserve = 3, ResearchType = "CoS_Shesh"}
		},
		["HOWLRUNNER_SQUADRON_HALF"] = {
			HAPES_CONSORTIUM = {Initial = 1, Reserve = 3},
			IMPERIAL = {Initial = 1, Reserve = 3}
		},
		["REBEL_X-WING_SQUADRON_HALF"] = {
			HOSTILE = {Initial = 1, Reserve = 3},
			REBEL = {Initial = 1, Reserve = 3, ResearchType = "~CoS_Tevv"},
			INDEPENDENT_FORCES = {Initial = 1, Reserve = 3}
		},
		["DREXL_SQUADRON_HALF"] = {
			REBEL = {Initial = 1, Reserve = 3, ResearchType = "CoS_Tevv"}
		},
		["DUNELIZARD_FIGHTER_SQUADRON_HALF"] = {
			HUTT_CARTELS = {Initial = 1, Reserve = 3}
		},
	},
	Scripts = {"multilayer", "fighter-spawn", "single-unit-retreat"}
}