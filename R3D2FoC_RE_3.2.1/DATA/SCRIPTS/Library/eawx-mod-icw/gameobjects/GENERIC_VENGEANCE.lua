return {
	Ship_Crew_Requirement = 300,
	Fighters = {
		["HOWLRUNNER_SQUADRON_DOUBLE"] = {
			DEFAULT = {Initial = 2, Reserve = 16}
		},
		["SHIELDED_RAPTOR_SQUADRON_DOUBLE"] = {
			ZSINJ_EMPIRE = {Initial = 1, Reserve = 3}
		},
		["TIE_INTERCEPTOR_SQUADRON_DOUBLE"] = {
			EMPIRE = {Initial = 1, Reserve = 3},
			ERIADU_AUTHORITY = {Initial = 1, Reserve = 3},
			GREATER_MALDROOD = {Initial = 1, Reserve = 3},
			WARLORDS = {Initial = 1, Reserve = 3},
			INDEPENDENT_FORCES = {Initial = 1, Reserve = 3}
		},
		["TIE_GT_SQUADRON_DOUBLE"] = {
			PENTASTAR = {Initial = 1, Reserve = 3}
		},
		["TIE_HEAVY_BOMBER_SQUADRON"] = {
			DEFAULT = {Initial = 1, Reserve = 4}
		}
	},
	Scripts = {"fighter-spawn", "persistent-damage"},
	Flags = {HANGAR = true}
}