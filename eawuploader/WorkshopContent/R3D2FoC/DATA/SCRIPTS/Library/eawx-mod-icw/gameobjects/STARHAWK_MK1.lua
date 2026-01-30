return {
	Ship_Crew_Requirement = 50,
	Fighters = {
		["HOWLRUNNER_SQUADRON"] = {
			IMPERIAL = {Initial = 1, Reserve = 2}
		},
		["TIE_INTERCEPTOR_SQUADRON_HALF"] = {
			IMPERIAL = {Initial = 1, Reserve = 3}
		},
		["TIE_BOMBER_SQUADRON_HALF"] = {
			IMPERIAL = {Initial = 1, Reserve = 1}
		},
		["REBEL_X-WING_SQUADRON"] = {
			HOSTILE = {Initial = 1, Reserve = 2},
			REBEL = {Initial = 1, Reserve = 2},
			INDEPENDENT_FORCES = {Initial = 1, Reserve = 2}
		},
		["A-WING_SQUADRON_HALF"] = {
			HOSTILE = {Initial = 1, Reserve = 3},
			REBEL = {Initial = 1, Reserve = 3, HeroOverride = {{"TALLON_SILENT_WATER"}, {"A-WING_SQUADRON"}}},
			INDEPENDENT_FORCES = {Initial = 1, Reserve = 3}
		},
		["Y-WING_SQUADRON_HALF"] = {
			HOSTILE = {Initial = 1, Reserve = 1},
			REBEL = {Initial = 1, Reserve = 1},
			INDEPENDENT_FORCES = {Initial = 1, Reserve = 1}
		}
	},
	Scripts = {"multilayer", "fighter-spawn", "single-unit-retreat"}
}