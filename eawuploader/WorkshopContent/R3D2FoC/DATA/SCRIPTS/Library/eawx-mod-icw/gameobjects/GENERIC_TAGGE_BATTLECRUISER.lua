return {
	Ship_Crew_Requirement = 50,
	Fighters = {
		["IRD_SQUADRON_DOUBLE"] = {
			CORPORATE_SECTOR = {Initial = 2, Reserve = 4}
		},
		["TIE_FIGHTER_SQUADRON_DOUBLE"] = {
			IMPERIAL = {Initial = 2, Reserve = 4},
			INDEPENDENT_FORCES = {Initial = 2, Reserve = 4}
		},
		["MANKVIM_SQUADRON"] = {
			INDEPENDENT_FORCES = {Initial = 1, Reserve = 2},
			CORPORATE_SECTOR = {Initial = 1, Reserve = 2}
		},
		["TIE_INTERCEPTOR_SQUADRON"] = {
			IMPERIAL = {Initial = 1, Reserve = 2}
		},
		["HWING_SQUADRON"] = {
			INDEPENDENT_FORCES = {Initial = 1, Reserve = 3},
			CORPORATE_SECTOR = {Initial = 1, Reserve = 3}
		},
		["TIE_HEAVY_BOMBER_SQUADRON"] = {
			IMPERIAL = {Initial = 1, Reserve = 3}
		}
	},
	Scripts = {"multilayer", "fighter-spawn"}
}