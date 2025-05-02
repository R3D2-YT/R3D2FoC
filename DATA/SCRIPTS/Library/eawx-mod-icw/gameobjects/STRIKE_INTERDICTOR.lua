return {
	Ship_Crew_Requirement = 10,
	Fighters = {
		["TIE_FIGHTER_SQUADRON"] = {
			EMPIRE = {Initial = 1, Reserve = 1, TechLevel = LessThan(6)},
			ERIADU_AUTHORITY = {Initial = 1, Reserve = 1},
			GREATER_MALDROOD = {Initial = 1, Reserve = 1},
			HAPES_CONSORTIUM = {Initial = 1, Reserve = 1},
			HOSTILE = {Initial = 1, Reserve = 1},
			PENTASTAR = {Initial = 1, Reserve = 1},
			INDEPENDENT_FORCES = {Initial = 1, Reserve = 1},
			WARLORDS = {Initial = 1, Reserve = 1},
			ZSINJ_EMPIRE = {Initial = 1, Reserve = 1}
		},
		["SUPER_TIE_SQUADRON"] = {
			EMPIRE = {Initial = 1, Reserve = 1, TechLevel = GreaterOrEqualTo(6)}
		},
		["Z95_HEADHUNTER_SQUADRON"] = {
			REBEL = {Initial = 1, Reserve = 1, TechLevel = LessThan(4)},
			HUTT_CARTELS = {Initial = 1, Reserve = 1}
		},
		["DEFENDER_STARFIGHTER_SQUADRON"] = {
			REBEL = {Initial = 1, Reserve = 1, TechLevel = GreaterOrEqualTo(4)}
		}
	},
	Scripts = {"multilayer", "fighter-spawn", "interdictor-ai", "single-unit-retreat"},
	Flags = {HANGAR = true}
}