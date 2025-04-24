return {
	Ship_Crew_Requirement = 15,
	Fighters = {
		["DREXL_SQUADRON"] = {
			CORPORATE_SECTOR = {Initial = 1, Reserve = 2},
			HOSTILE = {Initial = 1, Reserve = 2},
			INDEPENDENT_FORCES = {Initial = 1, Reserve = 2}
		},
		["MIYTIL_FIGHTER_SQUADRON"] = {
			HAPES_CONSORTIUM = {Initial = 2, Reserve = 5}
		},
		["CLOAKSHAPE_NEW_SQUADRON"] = {
			HUTT_CARTELS = {Initial = 2, Reserve = 5}
		},
		["REBEL_X-WING_SQUADRON"] = {
			REBEL = {Initial = 1, Reserve = 2, TechLevel = LessThan(4)}
		},
		["E-WING_SQUADRON"] = {
			REBEL = {Initial = 1, Reserve = 2, TechLevel = GreaterOrEqualTo(4)}
		},
		["TIE_AVENGER_SQUADRON"] = {
			EMPIRE = {Initial = 1, Reserve = 2},
			WARLORDS = {Initial = 1, Reserve = 2}
		},
		["A-WING_SQUADRON"] = {
			REBEL = {Initial = 1, Reserve = 3}
		},
		["MANKVIM_SQUADRON"] = {
			CORPORATE_SECTOR = {Initial = 1, Reserve = 3},
			HOSTILE = {Initial = 1, Reserve = 3},
			INDEPENDENT_FORCES = {Initial = 1, Reserve = 3}
		},
		["TIE_INTERCEPTOR_SQUADRON"] = {
			EMPIRE = {Initial = 1, Reserve = 3},
			WARLORDS = {Initial = 1, Reserve = 3}
		},
		["B-WING_SQUADRON_DOUBLE"] = {
			REBEL = {Initial = 1, Reserve = 3, ResearchType = "~BwingE"}
		},
		["B-WING_E_SQUADRON_DOUBLE"] = {
			REBEL = {Initial = 1, Reserve = 3, ResearchType = "BwingE"}
		},
		["BTLB_Y-WING_SQUADRON_DOUBLE"] = {
			CORPORATE_SECTOR = {Initial = 1, Reserve = 3},
			HOSTILE = {Initial = 1, Reserve = 3},
			INDEPENDENT_FORCES = {Initial = 1, Reserve = 3},
			HUTT_CARTELS = {Initial = 1, Reserve = 3}
		},
		["MIYTIL_BOMBER_SQUADRON_DOUBLE"] = {
			HAPES_CONSORTIUM = {Initial = 1, Reserve = 3}
		},
		["STARWING_SQUADRON_DOUBLE"] = {
			EMPIRE = {Initial = 1, Reserve = 3},
			WARLORDS = {Initial = 1, Reserve = 3}
		}
	},
	Scripts = {"multilayer", "fighter-spawn"}
}