return {
	Fighters = {
		["IRDA_SQUADRON_DOUBLE"] = {
			CORPORATE_SECTOR = {Initial = 1, Reserve = 5}
		},
		["DREXL_SQUADRON_DOUBLE"] = {
			CORPORATE_SECTOR = {Initial = 1, Reserve = 5}
		},
		["REBEL_X-WING_SQUADRON_DOUBLE"] = {
			HOSTILE = {Initial = 1, Reserve = 5},
			REBEL = {Initial = 1, Reserve = 5, TechLevel = LessThan(3)},
			INDEPENDENT_FORCES = {Initial = 1, Reserve = 5},
			WARLORDS = {Initial = 1, Reserve = 5}
		},
		["E-WING_SQUADRON_DOUBLE"] = {
			REBEL = {Initial = 1, Reserve = 5, TechLevel = GreaterOrEqualTo(3)}
		},
		["A-WING_SQUADRON_DOUBLE"] = {
			HOSTILE = {Initial = 1, Reserve = 5},
			REBEL = {Initial = 1, Reserve = 5},
			INDEPENDENT_FORCES = {Initial = 1, Reserve = 5},
			WARLORDS = {Initial = 1, Reserve = 5}
		},
		["T-WING_SQUADRON_DOUBLE"] = {
			CORPORATE_SECTOR = {Initial = 1, Reserve = 5}
		},
		["BTLB_Y-WING_SQUADRON_DOUBLE"] = {
			CORPORATE_SECTOR = {Initial = 1, Reserve = 5}
		},
		["Y-WING_SQUADRON_DOUBLE"] = {
			REBEL = {Initial = 2, Reserve = 10, TechLevel = LessThan(3)}
		},
		["B-WING_SQUADRON_DOUBLE"] = {
			HOSTILE = {Initial = 2, Reserve = 10, TechLevel = LessThan(6)},
			REBEL = {Initial = 2, Reserve = 10, TechLevel = GreaterOrEqualTo(3), ResearchType = "~BwingE"},
			INDEPENDENT_FORCES = {Initial = 2, Reserve = 10, TechLevel = LessThan(6)},
			WARLORDS = {Initial = 2, Reserve = 10, TechLevel = LessThan(6)}
		},
		["B-WING_E_SQUADRON_DOUBLE"] = {
			HOSTILE = {Initial = 2, Reserve = 10, TechLevel = GreaterOrEqualTo(6)},
			REBEL = {Initial = 2, Reserve = 10, TechLevel = GreaterOrEqualTo(3), ResearchType = "BwingE"},
			INDEPENDENT_FORCES = {Initial = 2, Reserve = 10, TechLevel = GreaterOrEqualTo(6)},
			WARLORDS = {Initial = 2, Reserve = 10, TechLevel = GreaterOrEqualTo(6)}
		},
		["SKIRMISH_CR90"] = {
			REBEL = {Initial = 3, Reserve = 3}
		},
		["SKIRMISH_ETTI_LIGHTER"] = {
			CORPORATE_SECTOR = {Initial = 3, Reserve = 3}
		}
	},
	Scripts = {"fighter-spawn"}
}