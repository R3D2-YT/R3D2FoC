return {
	Ship_Crew_Requirement = 10,
	Fighters = {
		["MIYTIL_FIGHTER_SQUADRON"] = {
			HAPES_CONSORTIUM = {Initial = 1, Reserve = 3}
		},
		["CLOAKSHAPE_NEW_SQUADRON"] = {
			HUTT_CARTELS = {Initial = 1, Reserve = 3}
		},
		["TIE_FIGHTER_SQUADRON_HALF"] = {
			IMPERIAL = {Initial = 1, Reserve = 3},
			INDEPENDENT_FORCES = {Initial = 1, Reserve = 3}
		},
		["Z95_HEADHUNTER_SQUADRON_HALF"] = {
			HAPES_CONSORTIUM = {Initial = 1, Reserve = 3},
			HUTT_CARTELS = {Initial = 1, Reserve = 3},
			HOSTILE = {Initial = 1, Reserve = 3, TechLevel = LessThan(4)},
			REBEL = {Initial = 1, Reserve = 3, TechLevel = LessThan(4), ResearchType = "~CoS_Shesh"}
		},
		["DEFENDER_STARFIGHTER_SQUADRON_HALF"] = {
			HOSTILE = {Initial = 1, Reserve = 3, TechLevel = GreaterOrEqualTo(4)},
			REBEL = {Initial = 1, Reserve = 3, TechLevel = GreaterOrEqualTo(4), ResearchType = "~CoS_Shesh"}
		},
		["A9_SQUADRON_HALF"] = {
			REBEL = {Initial = 1, Reserve = 3, ResearchType = "CoS_Shesh"}
		},
		["A-WING_SQUADRON_HALF"] = {
			HOSTILE = {Initial = 1, Reserve = 3},
			REBEL = {Initial = 1, Reserve = 3, HeroOverride = {{"TALLON_SILENT_WATER"}, {"A-WING_SQUADRON"}}},
			INDEPENDENT_FORCES = {Initial = 1, Reserve = 3}
		},
		["TIE_INTERCEPTOR_SQUADRON_HALF"] = {
			IMPERIAL = {Initial = 1, Reserve = 3}
		}
	},
	Scripts = {"multilayer", "fighter-spawn", "single-unit-retreat"},
	Flags = {HANGAR = true}
}