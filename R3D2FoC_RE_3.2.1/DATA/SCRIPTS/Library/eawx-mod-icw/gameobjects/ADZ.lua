return {
	Ship_Crew_Requirement = 1,
	Fighters = {
		["TIE_FIGHTER_SQUADRON_HALF"] = {
			EMPIRE = {Initial = 1, Reserve = 0},
			ERIADU_AUTHORITY = {Initial = 1, Reserve = 0, ResearchType = "~EATIEShields"},
			GREATER_MALDROOD = {Initial = 1, Reserve = 0},
			HOSTILE = {Initial = 1, Reserve = 0},
			PENTASTAR = {Initial = 1, Reserve = 0},
			WARLORDS = {Initial = 1, Reserve = 0},
			INDEPENDENT_FORCES = {Initial = 1, Reserve = 0},
			ZSINJ_EMPIRE = {Initial = 1, Reserve = 0}
		},
		["SHIELDED_TIE_SQUADRON_HALF"] = {
			ERIADU_AUTHORITY = {Initial = 1, Reserve = 0, ResearchType = "EATIEShields"}
		}
	},
	Scripts = {"multilayer", "fighter-spawn", "single-unit-retreat"},
	Flags = {HANGAR = true}
}