return {
	Ship_Crew_Requirement = 10,
	Fighters = {
		["A-WING_SQUADRON"] = {
			REBEL = {Initial = 1, Reserve = 1}
		},
		["CLOAKSHAPE_NEW_SQUADRON"] = {
			HUTT_CARTELS = {Initial = 1, Reserve = 1}
		},
		["TIE_INTERCEPTOR_SQUADRON"] = {
			EMPIRE = {Initial = 1, Reserve = 1},
			ERIADU_AUTHORITY = {Initial = 1, Reserve = 1, ResearchType = "~EATIEShields"},
			GREATER_MALDROOD = {Initial = 1, Reserve = 1},
			HAPES_CONSORTIUM = {Initial = 1, Reserve = 1},
			HOSTILE = {Initial = 1, Reserve = 1},
			PENTASTAR = {Initial = 1, Reserve = 1},
			INDEPENDENT_FORCES = {Initial = 1, Reserve = 1},
			WARLORDS = {Initial = 1, Reserve = 1},
			ZSINJ_EMPIRE = {Initial = 1, Reserve = 1}
		},
		["SHIELDED_INTERCEPTOR_SQUADRON"] = {
			ERIADU_AUTHORITY = {Initial = 1, Reserve = 1, ResearchType = "EATIEShields"}
		}
	},
	Scripts = {"multilayer", "single-unit-retreat", "fighter-spawn", "interdictor-ai"},
	Flags = {HANGAR = true}
}