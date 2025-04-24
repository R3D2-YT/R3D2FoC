return {
	Ship_Crew_Requirement = 50,
	Fighters = {
		["IRD_SQUADRON_DOUBLE"] = {
			CORPORATE_SECTOR = {Initial = 1, Reserve = 2}
		},
		["REBEL_X-WING_SQUADRON_DOUBLE"] = {
			REBEL = {Initial = 1, Reserve = 2}
		},
		["MIYTIL_FIGHTER_SQUADRON_DOUBLE"] = {
			HAPES_CONSORTIUM = {Initial = 1, Reserve = 2}
		},
		["DUNELIZARD_FIGHTER_SQUADRON_DOUBLE"] = {
			HUTT_CARTELS = {Initial = 1, Reserve = 2}
		},
		["TIE_FIGHTER_SQUADRON_DOUBLE"] = {
			EMPIRE = {Initial = 1, Reserve = 2},
			ERIADU_AUTHORITY = {Initial = 1, Reserve = 2, ResearchType = "~EATIEShields"},
			GREATER_MALDROOD = {Initial = 1, Reserve = 2},
			HOSTILE = {Initial = 1, Reserve = 2},
			PENTASTAR = {Initial = 1, Reserve = 2},
			WARLORDS = {Initial = 1, Reserve = 2},
			INDEPENDENT_FORCES = {Initial = 1, Reserve = 2},
			ZSINJ_EMPIRE = {Initial = 1, Reserve = 2}
		},
		["SHIELDED_TIE_SQUADRON_DOUBLE"] = {
			ERIADU_AUTHORITY = {Initial = 1, Reserve = 2, ResearchType = "EATIEShields"}
		},
		["BTLB_Y-WING_SQUADRON"] = {
			CORPORATE_SECTOR = {Initial = 1, Reserve = 1}
		},
		["MIYTIL_BOMBER_SQUADRON"] = {
			HAPES_CONSORTIUM = {Initial = 1, Reserve = 1}
		},
		["Kimogila_Squadron"] = {
			HUTT_CARTELS = {Initial = 1, Reserve = 1}
		},
		["TIE_BOMBER_SQUADRON"] = {
			IMPERIAL = {Initial = 1, Reserve = 1},
			HOSTILE = {Initial = 1, Reserve = 1},
			INDEPENDENT_FORCES = {Initial = 1, Reserve = 1}
		},
		["Y-WING_SQUADRON"] = {
			REBEL = {Initial = 1, Reserve = 1}
		}
	},
	Scripts = {"multilayer", "fighter-spawn"}
}