return {
	Ship_Crew_Requirement = 1,
	Fighters = {
		["IRDA_SQUADRON_HALF"] = {
			CORPORATE_SECTOR = {Initial = 1, Reserve = 2}
		},
		["TIE_FIGHTER_SQUADRON_HALF"] = {
			HOSTILE = {Initial = 1, Reserve = 2},
			IMPERIAL = {Initial = 1, Reserve = 2},
			INDEPENDENT_FORCES = {Initial = 1, Reserve = 2}
		},
		["BTLB_Y-WING_SQUADRON_HALF"] = {
			CORPORATE_SECTOR = {Initial = 1, Reserve = 0}
		},
		["TIE_BOMBER_SQUADRON_HALF"] = {
			HOSTILE = {Initial = 1, Reserve = 0},
			IMPERIAL = {Initial = 1, Reserve = 0},
			INDEPENDENT_FORCES = {Initial = 1, Reserve = 0}
		}
	},
	Scripts = {"multilayer", "fighter-spawn", "single-unit-retreat"},
	Flags = {HANGAR = true}
}