return {
	Ship_Crew_Requirement = 5,
	Fighters = {
		["IRD_SQUADRON_HALF"] = {
			CORPORATE_SECTOR = {Initial = 1, Reserve = 0}
		},
		["TIE_FIGHTER_SQUADRON_HALF"] = {
			EMPIRE = {Initial = 1, Reserve = 0, TechLevel = LessThan(6)},
			ERIADU_AUTHORITY = {Initial = 1, Reserve = 0},
			GREATER_MALDROOD = {Initial = 1, Reserve = 0},
			HOSTILE = {Initial = 1, Reserve = 0},
			PENTASTAR = {Initial = 1, Reserve = 0},
			WARLORDS = {Initial = 1, Reserve = 0},
			INDEPENDENT_FORCES = {Initial = 1, Reserve = 0},
			ZSINJ_EMPIRE = {Initial = 1, Reserve = 0}
		},
		["SUPER_TIE_SQUADRON_HALF"] = {
			EMPIRE = {Initial = 1, Reserve = 0, TechLevel = GreaterOrEqualTo(6)}
		},
		["Z95_HEADHUNTER_SQUADRON_HALF"] = {
			HUTT_CARTELS = {Initial = 1, Reserve = 0, TechLevel = GreaterOrEqualTo(6)}
		}
	},
	Scripts = {"multilayer", "single-unit-retreat"},
	Flags = {HANGAR = true}
}