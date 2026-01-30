return {
	Ship_Crew_Requirement = 10,
	Fighters = {
		["A-WING_SQUADRON"] = {
			REBEL = {Initial = 1, Reserve = 2}
		},
		["MIYTIL_FIGHTER_SQUADRON"] = {
			HAPES_CONSORTIUM = {Initial = 1, Reserve = 2}
		},
		["DUNELIZARD_FIGHTER_SQUADRON"] = {
			HUTT_CARTELS = {Initial = 1, Reserve = 2}
		},
		["TIE_INTERCEPTOR_SQUADRON"] = {
			HOSTILE = {Initial = 1, Reserve = 2},
			IMPERIAL = {Initial = 1, Reserve = 2},
			INDEPENDENT_FORCES = {Initial = 1, Reserve = 2}
		},
		["B-WING_SQUADRON"] = {
			REBEL = {Initial = 1, Reserve = 2, ResearchType = "~BwingE"}
		},
		["B-WING_E_SQUADRON"] = {
			REBEL = {Initial = 1, Reserve = 2, ResearchType = "BwingE"}
		},
		["MIYTIL_BOMBER_SQUADRON"] = {
			HAPES_CONSORTIUM = {Initial = 1, Reserve = 2}
		},
		["KIMOGILA_SQUADRON"] = {
			HUTT_CARTELS = {Initial = 1, Reserve = 2}
		},
		["TIE_OPPRESSOR_SQUADRON"] = {
			HOSTILE = {Initial = 1, Reserve = 2},
			IMPERIAL = {Initial = 1, Reserve = 2},
			INDEPENDENT_FORCES = {Initial = 1, Reserve = 2}
		}
	},
	Scripts = {"multilayer", "fighter-spawn", "single-unit-retreat"}
}