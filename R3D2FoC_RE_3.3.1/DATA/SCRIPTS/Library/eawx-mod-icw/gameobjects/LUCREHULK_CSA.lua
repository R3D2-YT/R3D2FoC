return {
	Ship_Crew_Requirement = 50,
	Fighters = {
		["IRD_SQUADRON_DOUBLE"] = {
			CORPORATE_SECTOR = {Initial = 3, Reserve = 12},
			INDEPENDENT_FORCES = {Initial = 3, Reserve = 12},
			HOSTILE = {Initial = 3, Reserve = 12},
			WARLORDS = {Initial = 3, Reserve = 12}
		},
		["Z95_HEADHUNTER_SQUADRON_DOUBLE"] = {
			REBEL = {Initial = 3, Reserve = 12, TechLevel = LessThan(4)}
		},
		["DEFENDER_STARFIGHTER_SQUADRON_DOUBLE"] = {
			REBEL = {Initial = 3, Reserve = 12, TechLevel = GreaterOrEqualTo(4)}
		},
		["MANKVIM_SQUADRON_DOUBLE"] = {
			CORPORATE_SECTOR = {Initial = 2, Reserve = 4},
			INDEPENDENT_FORCES = {Initial = 2, Reserve = 4},
			HOSTILE = {Initial = 2, Reserve = 4},
			WARLORDS = {Initial = 2, Reserve = 4}
		},
		["A-WING_SQUADRON_DOUBLE"] = {
			REBEL = {Initial = 2, Reserve = 4}
		},
		["BTLB_Y-WING_SQUADRON_DOUBLE"] = {
			CORPORATE_SECTOR = {Initial = 3, Reserve = 12},
			INDEPENDENT_FORCES = {Initial = 3, Reserve = 12},
			HOSTILE = {Initial = 3, Reserve = 12},
			WARLORDS = {Initial = 3, Reserve = 12}
		},	
		["Y-WING_SQUADRON_DOUBLE"] = {
			REBEL = {Initial = 3, Reserve = 12, TechLevel = LessThan(4)}
		},
		["B-WING_SQUADRON_DOUBLE"] = {
			REBEL = {Initial = 3, Reserve = 12, TechLevel = GreaterOrEqualTo(4), ResearchType = "~BwingE"}
		},
		["B-WING_E_SQUADRON_DOUBLE"] = {
			REBEL = {Initial = 3, Reserve = 12, TechLevel = GreaterOrEqualTo(4), ResearchType = "BwingE"}
		}
	},
	Scripts = {"multilayer", "fighter-spawn"}
}