return {
	Ship_Crew_Requirement = 35,
	Fighters = {
		["MIYTIL_FIGHTER_SQUADRON_DOUBLE"] = {
			HAPES_CONSORTIUM = {Initial = 2, Reserve = 5}
		},
		["CLOAKSHAPE_NEW_SQUADRON_DOUBLE"] = {
			HUTT_CARTELS = {Initial = 2, Reserve = 5}
		},
		["REBEL_X-WING_SQUADRON"] = {
			REBEL = {Initial = 3, Reserve = 8}
		},
		["TIE_GT_SQUADRON"] = {
			HOSTILE = {Initial = 3, Reserve = 8},
			IMPERIAL = {Initial = 3, Reserve = 8},
			INDEPENDENT_FORCES = {Initial = 3, Reserve = 8}
		},
		["ARC_170_SQUADRON"] = {
			INDEPENDENT_FORCES = {Initial = 1, Reserve = 2},
			WARLORDS = {Initial = 1, Reserve = 2}
		},
		["TIE_DEFENDER_SQUADRON"] = {
			EMPIRE = {Initial = 1, Reserve = 2},
			ERIADU_AUTHORITY = {Initial = 1, Reserve = 2},
			GREATER_MALDROOD = {Initial = 1, Reserve = 2},
			HOSTILE = {Initial = 1, Reserve = 2},
			PENTASTAR = {Initial = 1, Reserve = 2},
			REBEL = {Initial = 1, Reserve = 2},
			ZSINJ_EMPIRE = {Initial = 1, Reserve = 2}
		},
		["MIYTIL_BOMBER_SQUADRON_DOUBLE"] = {
			HAPES_CONSORTIUM = {Initial = 1, Reserve = 3}
		},
		["MIYTIL_BOMBER_SQUADRON"] = {
			HAPES_CONSORTIUM = {Initial = 1, Reserve = 2}
		},
		["SCURRG_H6_SQUADRON_DOUBLE"] = {
			HUTT_CARTELS = {Initial = 1, Reserve = 3}
		},
		["KIMOGILA_SQUADRON"] = {
			HUTT_CARTELS = {Initial = 1, Reserve = 2}
		},
		["TIE_BOMBER_SQUADRON_DOUBLE"] = {
			EMPIRE = {Initial = 1, Reserve = 2, TechLevel = IsOneOf({1, 2, 4, 5, 6})},
			ERIADU_AUTHORITY = {Initial = 1, Reserve = 2},
			GREATER_MALDROOD = {Initial = 1, Reserve = 2},
			HOSTILE = {Initial = 1, Reserve = 2},
			PENTASTAR = {Initial = 1, Reserve = 2},
			INDEPENDENT_FORCES = {Initial = 1, Reserve = 2},
			WARLORDS = {Initial = 1, Reserve = 2},
			ZSINJ_EMPIRE = {Initial = 1, Reserve = 2}
		},
		["SCIMITAR_SQUADRON_DOUBLE"] = {
			EMPIRE = {Initial = 1, Reserve = 2, TechLevel = IsOneOf({3, 7, 8, 9, 10, 11})}
		},
		["Y-WING_SQUADRON_DOUBLE"] = {
			REBEL = {Initial = 1, Reserve = 2}
		},
		["HWING_SQUADRON"] = {
			INDEPENDENT_FORCES = {Initial = 1, Reserve = 4},
			REBEL = {Initial = 1, Reserve = 4, TechLevel = LessThan(4)}
		},
		["K-WING_SQUADRON"] = {
			REBEL = {Initial = 1, Reserve = 4, TechLevel = GreaterOrEqualTo(4)}
		},
		["TIE_HEAVY_BOMBER_SQUADRON"] = {
			EMPIRE = {Initial = 1, Reserve = 4},
			ERIADU_AUTHORITY = {Initial = 1, Reserve = 4},
			GREATER_MALDROOD = {Initial = 1, Reserve = 4},
			HOSTILE = {Initial = 1, Reserve = 4},
			WARLORDS = {Initial = 1, Reserve = 4},
			ZSINJ_EMPIRE = {Initial = 1, Reserve = 4}
		},
		["TIE_TERROR_SQUADRON"] = {
			PENTASTAR = {Initial = 1, Reserve = 4}
		}
	},
	Scripts = {"multilayer", "fighter-spawn"}
}