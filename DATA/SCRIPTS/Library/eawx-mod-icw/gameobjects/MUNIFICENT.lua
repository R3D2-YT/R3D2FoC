return {
	Ship_Crew_Requirement = 10,
	Fighters = {
		["IRD_SQUADRON"] = {
			CORPORATE_SECTOR = {Initial = 1, Reserve =1}
		},
		["MIYTIL_FIGHTER_SQUADRON"] = {
			HAPES_CONSORTIUM = {Initial = 1, Reserve = 1}
		},
		["TIE_FIGHTER_SQUADRON"] = {
			HOSTILE = {Initial = 1, Reserve = 1},
			IMPERIAL = {Initial = 1, Reserve = 1},
			INDEPENDENT_FORCES = {Initial = 1, Reserve = 1}
		},
		["Z95_HEADHUNTER_SQUADRON"] = {
			REBEL = {Initial = 1, Reserve = 1, TechLevel = LessThan(4)},
			HUTT_CARTELS = {Initial = 1, Reserve = 1}
		},
		["DEFENDER_STARFIGHTER_SQUADRON"] = {
			REBEL = {Initial = 1, Reserve = 1, TechLevel = GreaterOrEqualTo(4)}
		},
		["ADVANCED_SKIPRAY_SQUADRON_HALF"] = {
			PENTASTAR = {Initial = 1, Reserve = 1}
		},
		["EARLY_SKIPRAY_SQUADRON_HALF"] = {
			CORPORATE_SECTOR = {Initial = 1, Reserve = 1},
			HAPES_CONSORTIUM = {Initial = 1, Reserve = 1},
			INDEPENDENT_FORCES = {Initial = 1, Reserve = 1},
			HUTT_CARTELS = {Initial = 1, Reserve = 1},
			REBEL = {Initial = 1, Reserve = 1}
		},
		["SKIPRAY_SQUADRON_HALF"] = {
			EMPIRE = {Initial = 1, Reserve = 1},
			ERIADU_AUTHORITY = {Initial = 1, Reserve = 1},
			GREATER_MALDROOD = {Initial = 1, Reserve = 1},
			HOSTILE = {Initial = 1, Reserve = 1},
			WARLORDS = {Initial = 1, Reserve = 1},
			ZSINJ_EMPIRE = {Initial = 1, Reserve = 1}
		}
	},
	Scripts = {"multilayer", "fighter-spawn", "single-unit-retreat"},
	Flags = {HANGAR = true}
}