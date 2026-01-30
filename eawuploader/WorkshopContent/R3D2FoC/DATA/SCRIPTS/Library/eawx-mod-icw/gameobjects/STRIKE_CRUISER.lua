return {
	Ship_Crew_Requirement = 10,
	Fighters = {
		["IRD_SQUADRON"] = {
			CORPORATE_SECTOR = {Initial = 1, Reserve = 2}
		},
		["TIE_FIGHTER_SQUADRON"] = {
			EMPIRE = {Initial = 1, Reserve = 2, TechLevel = LessThan(6)},
			ERIADU_AUTHORITY = {Initial = 1, Reserve = 2},
			GREATER_MALDROOD = {Initial = 1, Reserve = 2},
			HAPES_CONSORTIUM = {Initial = 1, Reserve = 2},
			HOSTILE = {Initial = 1, Reserve = 2},
			PENTASTAR = {Initial = 1, Reserve = 2},
			INDEPENDENT_FORCES = {Initial = 1, Reserve = 2},
			WARLORDS = {Initial = 1, Reserve = 2},
			ZSINJ_EMPIRE = {Initial = 1, Reserve = 2},
		},
		["SUPER_TIE_SQUADRON"] = {
			EMPIRE = {Initial = 1, Reserve = 2, TechLevel = GreaterOrEqualTo(6)}
		},
		["Z95_HEADHUNTER_SQUADRON"] = {
			REBEL = {Initial = 1, Reserve = 2, TechLevel = LessThan(4)},
			HUTT_CARTELS = {Initial = 1, Reserve = 2}
		},
		["DEFENDER_STARFIGHTER_SQUADRON"] = {
			REBEL = {Initial = 1, Reserve = 2, TechLevel = GreaterOrEqualTo(4)}
		}
	},
	Scripts = {"multilayer", "fighter-spawn", "single-unit-retreat"},
	Flags = {HANGAR = true}
}