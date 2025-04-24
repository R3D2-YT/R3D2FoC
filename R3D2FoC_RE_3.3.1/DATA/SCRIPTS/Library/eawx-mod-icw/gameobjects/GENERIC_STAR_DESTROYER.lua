return {
	Ship_Crew_Requirement = 30,
	Fighters = {
		["IRD_SQUADRON"] = {
			CORPORATE_SECTOR = {Initial = 1, Reserve = 2}
		},
		["MIYTIL_FIGHTER_SQUADRON_DOUBLE"] = {
			HAPES_CONSORTIUM = {Initial = 1, Reserve = 2}
		},
		["MIYTIL_FIGHTER_SQUADRON_HALF"] = {
			HAPES_CONSORTIUM = {Initial = 1, Reserve = 1}
		},
		["DUNELIZARD_FIGHTER_SQUADRON_DOUBLE"] = {
			HUTT_CARTELS = {Initial = 1, Reserve = 2}
		},
		["CLOAKSHAPE_NEW_SQUADRON_HALF"] = {
			HUTT_CARTELS = {Initial = 1, Reserve = 1}
		},
		["TIE_FIGHTER_SQUADRON"] = {
			EMPIRE = {Initial = 1, Reserve = 2, TechLevel = LessThan(4)},
			ERIADU_AUTHORITY = {Initial = 1, Reserve = 2, ResearchType = "~EATIEShields"},
			GREATER_MALDROOD = {Initial = 1, Reserve = 2},
			HOSTILE = {Initial = 1, Reserve = 2},
			PENTASTAR = {Initial = 1, Reserve = 2},
			INDEPENDENT_FORCES = {Initial = 1, Reserve = 2},
			WARLORDS = {Initial = 1, Reserve = 2},
			ZSINJ_EMPIRE = {Initial = 1, Reserve = 2}
		},
		["TIE_DROID_SQUADRON"] = {
			EMPIRE = {Initial = 1, Reserve = 2, TechLevel = IsOneOf({4, 5})}
		},
		["SUPER_TIE_SQUADRON"] = {
			EMPIRE = {Initial = 1, Reserve = 2, TechLevel = GreaterOrEqualTo(6)}
		},
		["SHIELDED_TIE_SQUADRON"] = {
			ERIADU_AUTHORITY = {Initial = 1, Reserve = 2, ResearchType = "EATIEShields"},
			REBEL = {Initial = 1, Reserve = 2}			
		},
		["A-WING_SQUADRON"] = {
			REBEL = {Initial = 1, Reserve = 2}
		},
		["MANKVIM_SQUADRON"] = {
			CORPORATE_SECTOR = {Initial = 1, Reserve = 2}
		},
		["TIE_INTERCEPTOR_SQUADRON"] = {
			EMPIRE = {Initial = 1, Reserve = 2, TechLevel = LessOrEqualTo(3)},
			ERIADU_AUTHORITY = {Initial = 1, Reserve = 2, ResearchType = "~EATIEShields"},
			GREATER_MALDROOD = {Initial = 1, Reserve = 2},
			HOSTILE = {Initial = 1, Reserve = 2},
			PENTASTAR = {Initial = 1, Reserve = 2},
			INDEPENDENT_FORCES = {Initial = 1, Reserve = 2},
			WARLORDS = {Initial = 1, Reserve = 2}
		},
		["A9_SQUADRON"] = {
			EMPIRE = {Initial = 1, Reserve = 2, TechLevel = IsOneOf({4, 6})}
		},
		["ROYAL_GUARD_INTERCEPTOR_SQUADRON"] = {
			EMPIRE = {Initial = 1, Reserve = 2, TechLevel = IsOneOf({5})}
		},
		["PREYBIRD_SQUADRON"] = {
			EMPIRE = {Initial = 1, Reserve = 2, TechLevel = GreaterOrEqualTo(7)}
		},
		["SHIELDED_INTERCEPTOR_SQUADRON"] = {
			ERIADU_AUTHORITY = {Initial = 1, Reserve = 2, ResearchType = "EATIEShields"}
		},
		["TIE_RAPTOR_SQUADRON"] = {
			ZSINJ_EMPIRE = {Initial = 1, Reserve = 2}
		},
		["ADVANCED_SKIPRAY_SQUADRON_HALF"] = {
			PENTASTAR = {Initial = 1, Reserve = 1}
		},
		["EARLY_SKIPRAY_SQUADRON_HALF"] = {
			CORPORATE_SECTOR = {Initial = 1, Reserve = 1},
			ERIADU_AUTHORITY = {Initial = 1, Reserve = 1},
			GREATER_MALDROOD = {Initial = 1, Reserve = 1},
			HAPES_CONSORTIUM = {Initial = 1, Reserve = 1},
			HOSTILE = {Initial = 1, Reserve = 1},
			REBEL = {Initial = 1, Reserve = 1},
			INDEPENDENT_FORCES = {Initial = 1, Reserve = 1},
			WARLORDS = {Initial = 1, Reserve = 1}
		},
		["SKIPRAY_SQUADRON_HALF"] = {
			EMPIRE = {Initial = 1, Reserve = 1},
			ZSINJ_EMPIRE = {Initial = 1, Reserve = 1}
		},
		["BTLB_Y-WING_SQUADRON_HALF"] = {
			CORPORATE_SECTOR = {Initial = 1, Reserve = 1}
		},
		["MIYTIL_BOMBER_SQUADRON_HALF"] = {
			HAPES_CONSORTIUM = {Initial = 1, Reserve = 1}
		},
		["KIMOGILA_SQUADRON_HALF"] = {
			HUTT_CARTELS = {Initial = 1, Reserve = 1}
		},
		["TIE_BOMBER_SQUADRON_HALF"] = {
			EMPIRE = {Initial = 1, Reserve = 1, TechLevel = IsOneOf({1, 2, 4, 5, 6})},
			ERIADU_AUTHORITY = {Initial = 1, Reserve = 1},
			GREATER_MALDROOD = {Initial = 1, Reserve = 1},
			HOSTILE = {Initial = 1, Reserve = 1},
			PENTASTAR = {Initial = 1, Reserve = 1},
			INDEPENDENT_FORCES = {Initial = 1, Reserve = 1},
			WARLORDS = {Initial = 1, Reserve = 1},
			ZSINJ_EMPIRE = {Initial = 1, Reserve = 1}
		},
		["SCIMITAR_SQUADRON_HALF"] = {
			EMPIRE = {Initial = 1, Reserve = 1, TechLevel = IsOneOf({3, 7, 8, 9, 10, 11})}
		},
		["Y-WING_SQUADRON_HALF"] = {
			REBEL = {Initial = 1, Reserve = 1}
		}
	},
	Scripts = {"multilayer", "fighter-spawn"}
}