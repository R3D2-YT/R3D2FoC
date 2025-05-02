return {
	Ship_Crew_Requirement = 10,
	Fighters = {
		["KIMOGILA_SQUADRON_DOUBLE"] = {
			HUTT_CARTELS = {Initial = 1, Reserve = 3}
		},
		["DUNELIZARD_FIGHTER_SQUADRON_DOUBLE"] = {
			HUTT_CARTELS = {Initial = 1, Reserve = 4}
		},
		["ARC_170_SQUADRON"] = {
			INDEPENDENT_FORCES = {Initial = 1, Reserve = 3}
		},
		["HOWLRUNNER_SQUADRON"] = {
			HOSTILE = {Initial = 1, Reserve = 4},
			INDEPENDENT_FORCES = {Initial = 1, Reserve = 4},
			IMPERIAL = {Initial = 1, Reserve = 4}
		},
		["IRDA_SQUADRON"] = {
			CORPORATE_SECTOR = {Initial = 1, Reserve = 4}
		},
		["MIYTIL_FIGHTER_SQUADRON"] = {
			HAPES_CONSORTIUM = {Initial = 2, Reserve = 7}
		},
		["REBEL_X-WING_SQUADRON"] = {
			REBEL = {Initial = 1, Reserve = 4}
		},
		["PREYBIRD_SQUADRON"] = {
			CORPORATE_SECTOR = {Initial = 1, Reserve = 3}
		},
		["TIE_DEFENDER_SQUADRON"] = {
			HOSTILE = {Initial = 1, Reserve = 3},
			IMPERIAL = {Initial = 1, Reserve = 3},
			REBEL = {Initial = 1, Reserve = 3}
		},
		["B-WING_SQUADRON"] = {
			REBEL = {Initial = 1, Reserve = 4, ResearchType = "~BwingE"}
		},
		["B-WING_E_SQUADRON"] = {
			REBEL = {Initial = 1, Reserve = 4, ResearchType = "BwingE"}
		},
		["BTLB_Y-WING_SQUADRON"] = {
			CORPORATE_SECTOR = {Initial = 1, Reserve = 4}
		},
		["MIYTIL_BOMBER_SQUADRON"] = {
			HAPES_CONSORTIUM = {Initial = 2, Reserve = 7}
		},
		["STARWING_SQUADRON"] = {
			HOSTILE = {Initial = 1, Reserve = 4},
			IMPERIAL = {Initial = 1, Reserve = 4},
			INDEPENDENT_FORCES = {Initial = 1, Reserve = 4}
		},
		["HWING_SQUADRON"] = {
			CORPORATE_SECTOR = {Initial = 1, Reserve = 3},
			INDEPENDENT_FORCES = {Initial = 1, Reserve = 3},
			REBEL = {Initial = 1, Reserve = 3}
		},
		["TIE_HEAVY_BOMBER_SQUADRON"] = {
			EMPIRE = {Initial = 1, Reserve = 3},
			ERIADU_AUTHORITY = {Initial = 1, Reserve = 3},
			GREATER_MALDROOD = {Initial = 1, Reserve = 3},
			WARLORDS = {Initial = 1, Reserve = 3},
			ZSINJ_EMPIRE = {Initial = 1, Reserve = 3}
		},
		["TIE_TERROR_SQUADRON"] = {
			HOSTILE = {Initial = 1, Reserve = 3},
			PENTASTAR = {Initial = 1, Reserve = 3},
		}
	},
	Scripts = {"multilayer", "fighter-spawn"}
}