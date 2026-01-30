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
			EMPIRE = {Initial = 1, Reserve = 2},
			ERIADU_AUTHORITY = {Initial = 1, Reserve = 2, ResearchType = "~EATIEShields"},
			GREATER_MALDROOD = {Initial = 1, Reserve = 2},
			HOSTILE = {Initial = 1, Reserve = 2},
			PENTASTAR = {Initial = 1, Reserve = 2},
			INDEPENDENT_FORCES = {Initial = 1, Reserve = 2},
			WARLORDS = {Initial = 1, Reserve = 2},
			ZSINJ_EMPIRE = {Initial = 1, Reserve = 2}
		},
		["SHIELDED_INTERCEPTOR_SQUADRON"] = {
			ERIADU_AUTHORITY = {Initial = 1, Reserve = 2, ResearchType = "EATIEShields"}
		},
		["MIYTIL_BOMBER_SQUADRON"] = {
			HAPES_CONSORTIUM = {Initial = 1, Reserve = 2}
		},
		["KIMOGILA_SQUADRON"] = {
			HUTT_CARTELS = {Initial = 1, Reserve = 2}
		},
		["TIE_BOMBER_SQUADRON"] = {
			HOSTILE = {Initial = 1, Reserve = 2},
			IMPERIAL = {Initial = 1, Reserve = 2},
			INDEPENDENT_FORCES = {Initial = 1, Reserve = 2}
		},
		["Y-WING_SQUADRON"] = {
			REBEL = {Initial = 1, Reserve = 2}
		}
	},
	Scripts = {"multilayer", "fighter-spawn", "single-unit-retreat"}
}