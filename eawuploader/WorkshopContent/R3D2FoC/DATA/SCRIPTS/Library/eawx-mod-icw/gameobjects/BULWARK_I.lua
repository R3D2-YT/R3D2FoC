return {
	Ship_Crew_Requirement = 10,
	Fighters = {
		["MANKVIM_SQUADRON"] = {
			CORPORATE_SECTOR = {Initial = 1, Reserve = 0},
			HAPES_CONSORTIUM = {Initial = 1, Reserve = 0},
			HOSTILE = {Initial = 1, Reserve = 0},
			INDEPENDENT_FORCES = {Initial = 1, Reserve = 0}
		},
		["TIE_INTERCEPTOR_SQUADRON"] = {
			IMPERIAL = {Initial = 1, Reserve = 0}
		},
		["A-WING_SQUADRON"] = {
			REBEL = {Initial = 2, Reserve = 2}
		},
		["CLOAKSHAPE_NEW_SQUADRON"] = {
			HUTT_CARTELS = {Initial = 2, Reserve = 2}
		},
		["T-WING_SQUADRON"] = {
			CORPORATE_SECTOR = {Initial = 1, Reserve = 2},
			HAPES_CONSORTIUM = {Initial = 1, Reserve = 2},
			HOSTILE = {Initial = 1, Reserve = 2},
			INDEPENDENT_FORCES = {Initial = 1, Reserve = 2}
		},
		["V38_SQUADRON"] = {
			IMPERIAL = {Initial = 1, Reserve = 2}
		}
	},
	Scripts = {"multilayer", "fighter-spawn"}
}