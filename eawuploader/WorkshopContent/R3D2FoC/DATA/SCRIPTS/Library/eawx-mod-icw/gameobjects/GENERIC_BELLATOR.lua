return {
	Ship_Crew_Requirement = 150,
	Fighters = {
		["TIE_AVENGER_SQUADRON"] = {
			DEFAULT = {Initial = 1, Reserve = 4}
		},
		["TIE_INTERCEPTOR_SQUADRON"] = {
			EMPIRE = {Initial = 1, Reserve = 4},
			ERIADU_AUTHORITY = {Initial = 1, Reserve = 4, ResearchType = "~EATIEShields"},
			GREATER_MALDROOD = {Initial = 1, Reserve = 4},
			HOSTILE = {Initial = 1, Reserve = 4},
			PENTASTAR = {Initial = 1, Reserve = 4},
			INDEPENDENT_FORCES = {Initial = 1, Reserve = 4},
			WARLORDS = {Initial = 1, Reserve = 4},
			ZSINJ_EMPIRE = {Initial = 1, Reserve = 4}
		},
		["SHIELDED_INTERCEPTOR_SQUADRON"] = {
			ERIADU_AUTHORITY = {Initial = 1, Reserve = 4, ResearchType = "EATIEShields"}
		},
		["TIE_BOMBER_SQUADRON"] = {
			DEFAULT = {Initial = 1, Reserve = 3}
		}
	},
	Scripts = {"fighter-spawn", "persistent-damage"}
}