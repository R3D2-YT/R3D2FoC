return {
	Ship_Crew_Requirement = 30,
	Fighters = {
		["REBEL_X-WING_SQUADRON"] = {
			REBEL = {Initial = 1, Reserve = 2}
		},
		["Z95_HEADHUNTER_SQUADRON"] = {
			ZSINJ_EMPIRE = {Initial = 1, Reserve = 2},
			HAPES_CONSORTIUM = {Initial = 1, Reserve = 2},
			INDEPENDENT_FORCES = {Initial = 1, Reserve = 2},
			WARLORDS = {Initial = 1, Reserve = 2},
			CORPORATE_SECTOR = {Initial = 1, Reserve = 2},
			HUTT_CARTELS = {Initial = 1, Reserve = 2}
		},
		["EARLY_SKIPRAY_SQUADRON_HALF"] = {
			CORPORATE_SECTOR = {Initial = 1, Reserve = 1},
			HAPES_CONSORTIUM = {Initial = 1, Reserve = 1},
			HOSTILE = {Initial = 1, Reserve = 1},
			REBEL = {Initial = 1, Reserve = 1},
			INDEPENDENT_FORCES = {Initial = 1, Reserve = 1}
		},
		["SKIPRAY_SQUADRON_HALF"] = {
			EMPIRE = {Initial = 1, Reserve = 1},
			ZSINJ_EMPIRE = {Initial = 1, Reserve = 1},
			WARLORDS = {Initial = 1, Reserve = 1}
		},
		["CLOAKSHAPE_NEW_SQUADRON_HALF"] = {
			HUTT_CARTELS = {Initial = 1, Reserve = 1}
		},
		["TIE_GT_SQUADRON"] = {
			EMPIRE = {Initial = 1, Reserve = 2}
		}
	},
	Scripts = {"multilayer", "fighter-spawn"}
}