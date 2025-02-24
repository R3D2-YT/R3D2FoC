return {
	Ship_Crew_Requirement = 35,
	Fighters = {
		["IRDA_SQUADRON_DOUBLE"] = {
			CORPORATE_SECTOR = {Initial = 1, Reserve = 2, HeroOverride = {{"KRIN_INVINCIBLE"}, {"SHIELDED_IRDA_SQUADRON_DOUBLE"}}},
			HOSTILE = {Initial = 1, Reserve = 2},
			INDEPENDENT_FORCES = {Initial = 1, Reserve = 2}
		},
		["MIYTIL_FIGHTER_SQUADRON_DOUBLE"] = {
			HAPES_CONSORTIUM = {Initial = 1, Reserve = 2}
		},
		["TIE_FIGHTER_SQUADRON_DOUBLE"] = {
			IMPERIAL = {Initial = 1, Reserve = 2}
		},
		["Z95_HEADHUNTER_SQUADRON_DOUBLE"] = {
			REBEL = {Initial = 1, Reserve = 2, TechLevel = LessThan(4)}
		},
		["DEFENDER_STARFIGHTER_SQUADRON_DOUBLE"] = {
			REBEL = {Initial = 1, Reserve = 2, TechLevel = GreaterOrEqualTo(4)}
		},
		["REBEL_X-WING_SQUADRON"] = {
			REBEL = {Initial = 1, Reserve = 4}
		},
		["TIE_GT_SQUADRON"] = {
			IMPERIAL = {Initial = 1, Reserve = 4}
		},
		["Z95_HEADHUNTER_SQUADRON"] = {
			CORPORATE_SECTOR = {Initial = 1, Reserve = 4},
			HAPES_CONSORTIUM = {Initial = 1, Reserve = 4},
			HOSTILE = {Initial = 1, Reserve = 4},
			INDEPENDENT_FORCES = {Initial = 1, Reserve = 4},
			HUTT_CARTELS = {Initial = 1, Reserve = 4}
		},
		["2_WARPOD_SQUADRON_DOUBLE"] = {
			CORPORATE_SECTOR = {Initial = 1, Reserve = 1},
			HOSTILE = {Initial = 1, Reserve = 1},
			INDEPENDENT_FORCES = {Initial = 1, Reserve = 1}
		},
		["MIYTIL_BOMBER_SQUADRON_DOUBLE"] = {
			HAPES_CONSORTIUM = {Initial = 1, Reserve = 1}
		},
		["BTLS1_Y-WING_SQUADRON"] = {
			HUTT_CARTELS = {Initial = 1, Reserve = 1}
		},
		["TIE_BOMBER_SQUADRON_DOUBLE"] = {
			IMPERIAL = {Initial = 1, Reserve = 1}
		},
		["Y-WING_SQUADRON_DOUBLE"] = {
			REBEL = {Initial = 1, Reserve = 1}
		}
	},
	Scripts = {"multilayer", "fighter-spawn"}
}