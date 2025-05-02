return {
	Ship_Crew_Requirement = 10,
	Fighters = {
		["SHIELDED_TIE_SQUADRON"] = {
			REBEL = {Initial = 1, Reserve = 3}
		},
		["TIE_FIGHTER_SQUADRON"] = {
			EMPIRE = {Initial = 1, Reserve = 3, TechLevel = LessThan(6)},
			ERIADU_AUTHORITY = {Initial = 1, Reserve = 3},
			GREATER_MALDROOD = {Initial = 1, Reserve = 3},
			HAPES_CONSORTIUM = {Initial = 1, Reserve = 3},
			HOSTILE = {Initial = 1, Reserve = 3},
			PENTASTAR = {Initial = 1, Reserve = 3},
			INDEPENDENT_FORCES = {Initial = 1, Reserve = 3},
			WARLORDS = {Initial = 1, Reserve = 3},
			ZSINJ_EMPIRE = {Initial = 1, Reserve = 3},
			HUTT_CARTELS = {Initial = 1, Reserve = 3}
		},
		["SUPER_TIE_SQUADRON"] = {
			EMPIRE = {Initial = 1, Reserve = 3, TechLevel = GreaterOrEqualTo(6)}
		}
	},
	Scripts = {"multilayer", "fighter-spawn", "single-unit-retreat", "interdictor-ai"},
	Flags = {HANGAR = true}
}