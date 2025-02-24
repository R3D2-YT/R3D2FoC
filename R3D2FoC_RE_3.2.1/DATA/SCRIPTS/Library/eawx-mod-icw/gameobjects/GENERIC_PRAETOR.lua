return {
	Ship_Crew_Requirement = 150,
	Fighters = {
		["ARC_170_SQUADRON"] = {
			INDEPENDENT_FORCES = {Initial = 1, Reserve = 2},
			WARLORDS = {Initial = 1, Reserve = 2}
		},
		["TIE_DEFENDER_SQUADRON"] = {
			EMPIRE = {Initial = 1, Reserve = 2},
			ERIADU_AUTHORITY = {Initial = 1, Reserve = 2},
			GREATER_MALDROOD = {Initial = 1, Reserve = 2},
			HOSTILE = {Initial = 1, Reserve = 2},
			PENTASTAR = {Initial = 1, Reserve = 2},
			ZSINJ_EMPIRE = {Initial = 1, Reserve = 2},
		},
		["TIE_INTERCEPTOR_SQUADRON"] = {
			EMPIRE = {Initial = 2, Reserve = 5},
			ERIADU_AUTHORITY = {Initial = 2, Reserve = 5, ResearchType = "~EATIEShields"},
			GREATER_MALDROOD = {Initial = 2, Reserve = 5},
			HOSTILE = {Initial = 2, Reserve = 5},
			PENTASTAR = {Initial = 2, Reserve = 5},
			INDEPENDENT_FORCES = {Initial = 2, Reserve = 5},
			WARLORDS = {Initial = 2, Reserve = 5},
			ZSINJ_EMPIRE = {Initial = 2, Reserve = 5},
		},
		["SHIELDED_INTERCEPTOR_SQUADRON"] = {
			ERIADU_AUTHORITY = {Initial = 2, Reserve = 5, ResearchType = "EATIEShields"}
		}
	},
	Scripts = {"multilayer", "fighter-spawn", "single-unit-retreat"}
}