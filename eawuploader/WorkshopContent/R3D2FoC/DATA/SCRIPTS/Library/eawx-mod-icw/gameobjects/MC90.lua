return {
	Ship_Crew_Requirement = 25,
	Fighters = {
		["E-WING_SQUADRON"] = {
			HOSTILE = {Initial = 1, Reserve = 2},
			REBEL = {Initial = 1, Reserve = 2},
			INDEPENDENT_FORCES = {Initial = 1, Reserve = 2}
		},
		["MIYTIL_FIGHTER_SQUADRON_DOUBLE"] = {
			HAPES_CONSORTIUM = {Initial = 1, Reserve = 2}
		},
		["DUNELIZARD_FIGHTER_SQUADRON_DOUBLE"] = {
			HUTT_CARTELS = {Initial = 1, Reserve = 2}
		},
		["TIE_AVENGER_SQUADRON"] = {
			IMPERIAL = {Initial = 1, Reserve = 2}
		},
		["A-WING_SQUADRON"] = {
			HOSTILE = {Initial = 1, Reserve = 2},
			REBEL = {Initial = 1, Reserve = 2, HeroOverride = {{"TALLON_SILENT_WATER"}, {"A-WING_SQUADRON_DOUBLE"}}},
			INDEPENDENT_FORCES = {Initial = 1, Reserve = 2}
		},
		["TIE_INTERCEPTOR_SQUADRON"] = {
			IMPERIAL = {Initial = 1, Reserve = 2}
		}
	},
	Scripts = {"multilayer", "fighter-spawn", "single-unit-retreat"}
}