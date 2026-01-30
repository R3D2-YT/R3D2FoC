return {
	Ship_Crew_Requirement = 10,
	Fighters = {
		["MIYTIL_FIGHTER_SQUADRON"] = {
			HAPES_CONSORTIUM = {Initial = 1, Reserve = 1}
		},
		["PREYBIRD_SQUADRON"] = {
			ERIADU_AUTHORITY = {Initial = 1, Reserve = 1}
		},
		["REBEL_X-WING_SQUADRON"] = {
			REBEL = {Initial = 1, Reserve = 1}
		},
		["TIE_GT_SQUADRON"] = {
			EMPIRE = {Initial = 1, Reserve = 1, HeroOverride = {{"PANAKA_THEED"}, {"N1_SQUADRON"}}},
			GREATER_MALDROOD = {Initial = 1, Reserve = 1, HeroOverride = {{"PANAKA_THEED"}, {"N1_SQUADRON"}}},
			HOSTILE = {Initial = 1, Reserve = 1},
			PENTASTAR = {Initial = 1, Reserve = 1, HeroOverride = {{"PANAKA_THEED"}, {"N1_SQUADRON"}}},
			INDEPENDENT_FORCES = {Initial = 1, Reserve = 1}
		},
		["Z95_HEADHUNTER_SQUADRON"] = {
			CORPORATE_SECTOR = {Initial = 1, Reserve = 1},
			ZSINJ_EMPIRE = {Initial = 1, Reserve = 1},
			HUTT_CARTELS = {Initial = 1, Reserve = 1}
		},
		["2_WARPOD_SQUADRON_HALF"] = {
			INDEPENDENT_FORCES = {Initial = 1, Reserve = 1}
		},
		["B-WING_SQUADRON_HALF"] = {
			REBEL = {Initial = 1, Reserve = 1, ResearchType = "~BwingE"}
		},
		["B-WING_E_SQUADRON_HALF"] = {
			REBEL = {Initial = 1, ResearchType = "BwingE", Reserve = 1}
		},
		["BTLB_Y-WING_SQUADRON_HALF"] = {
			CORPORATE_SECTOR = {Initial = 1, Reserve = 1}
		},
		["MIYTIL_BOMBER_SQUADRON_HALF"] = {
			HAPES_CONSORTIUM = {Initial = 1, Reserve = 1}
		},
		["STARWING_SQUADRON_HALF"] = {
			EMPIRE = {Initial = 1, Reserve = 1},
			HOSTILE = {Initial = 1, Reserve = 1},
			PENTASTAR = {Initial = 1, Reserve = 1},
			ZSINJ_EMPIRE = {Initial = 1, Reserve = 1}
		},
		["TIE_BOMBER_SQUADRON_HALF"] = {
			ERIADU_AUTHORITY = {Initial = 1, Reserve = 1}
		},
		["TIE_OPPRESSOR_SQUADRON_HALF"] = {
			GREATER_MALDROOD = {Initial = 1, Reserve = 1}
		},
		["SCURRG_H6_SQUADRON_HALF"] = {
			HUTT_CARTELS = {Initial = 1, Reserve = 1}
		}
	},
	Scripts = {"multilayer", "fighter-spawn"}
}