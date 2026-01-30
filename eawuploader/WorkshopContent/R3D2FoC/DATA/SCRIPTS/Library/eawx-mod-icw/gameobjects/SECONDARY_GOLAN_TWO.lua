return {
	Fighters = {
		["IRD_SQUADRON"] = {
			CORPORATE_SECTOR = {Initial = 1, Reserve = 1}
		},
		["DUNELIZARD_FIGHTER_SQUADRON"] = {
			HUTT_CARTELS = {Initial = 1, Reserve = 1}
		},
		["TIE_FIGHTER_SQUADRON"] = {
			EMPIRE = {Initial = 1, Reserve = 1, TechLevel = LessThan(4)},
			ERIADU_AUTHORITY = {Initial = 1, Reserve = 1, ResearchType = "~EATIEShields"},
			GREATER_MALDROOD = {Initial = 1, Reserve = 1},
			INDEPENDENT_FORCES = {Initial = 1, Reserve = 1},
			WARLORDS = {Initial = 1, Reserve = 1}
		},
		["TIE_DROID_SQUADRON"] = {
			EMPIRE = {Initial = 1, Reserve = 1, TechLevel = IsOneOf({4, 5})}
		},
		["SUPER_TIE_SQUADRON"] = {
			EMPIRE = {Initial = 1, Reserve = 1, TechLevel = GreaterOrEqualTo(6)}
		},
		["SHIELDED_TIE_SQUADRON"] = {
			ERIADU_AUTHORITY = {Initial = 1, Reserve = 1, ResearchType = "EATIEShields"}
		},
		["TIE_GT_SQUADRON"] = {
			PENTASTAR = {Initial = 1, Reserve = 1}
		},
		["Z95_HEADHUNTER_SQUADRON"] = {
			REBEL = {Initial = 1, Reserve = 1, TechLevel = LessThan(6)},
			ZSINJ_EMPIRE = {Initial = 1, Reserve = 1}
		},
		["DEFENDER_STARFIGHTER_SQUADRON"] = {
			REBEL = {Initial = 1, Reserve = 1, TechLevel = GreaterOrEqualTo(6)}
		},
		["2_WARPOD_SQUADRON"] = {
			CORPORATE_SECTOR = {Initial = 1, Reserve = 1}
		},
		["SCURRG_H6_SQUADRON"] = {
			HUTT_CARTELS = {Initial = 1, Reserve = 1}
		},
		["TIE_BOMBER_SQUADRON"] = {
			IMPERIAL = {Initial = 1, Reserve = 1},
			INDEPENDENT_FORCES = {Initial = 1, Reserve = 1}
		},
		["Y-WING_SQUADRON"] = {
			REBEL = {Initial = 1, Reserve = 1}
		},
		["SKIRMISH_CR90"] = {
			REBEL = {Initial = 1, Reserve = 1}
		},
		["SKIRMISH_CUSTOMS_CORVETTE"] = {
			GREATER_MALDROOD = {Initial = 1, Reserve = 1}
		},
		["SKIRMISH_ETTI_LIGHTER"] = {
			CORPORATE_SECTOR = {Initial = 1, Reserve = 1}
		},
		["SKIRMISH_WARLORD_CRUISER"] = {
			HUTT_CARTELS = {Initial = 1, Reserve = 1}
		},
		["SKIRMISH_IPV1"] = {
			EMPIRE = {Initial = 1, Reserve = 1, TechLevel = LessThan(6)},
			ERIADU_AUTHORITY = {Initial = 1, Reserve = 1},
			INDEPENDENT_FORCES = {Initial = 1, Reserve = 1},
			WARLORDS = {Initial = 1, Reserve = 1}
		},
		["SKIRMISH_CRUSADER"] = {
			EMPIRE = {Initial = 1, Reserve = 1, TechLevel = GreaterOrEqualTo(6)}
		},
		["SKIRMISH_RAIDER_PENTASTAR"] = {
			PENTASTAR = {Initial = 1, Reserve = 1}
		},
		["SKIRMISH_ZSINJ_CR90"] = {
			ZSINJ_EMPIRE = {Initial = 1, Reserve = 1}
		},
		["NSSIS_SQUADRON"] = {
			EMPIREOFTHEHAND = {Initial = 1, Reserve = 1}
		},
		["SYCA_BOMBER_SQUADRON"] = {
			EMPIREOFTHEHAND = {Initial = 1, Reserve = 1}
		},
		["SKIRMISH_MUQARAEA"] = {
			EMPIREOFTHEHAND = {Initial = 1, Reserve = 1}
		}
	},
	Scripts = {"turn-station", "fighter-spawn"}
}