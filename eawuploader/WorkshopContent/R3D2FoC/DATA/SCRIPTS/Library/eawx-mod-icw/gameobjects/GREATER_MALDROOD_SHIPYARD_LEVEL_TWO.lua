return {
	Fighters = {
		["TIE_FIGHTER_SQUADRON"] = {
			DEFAULT = {Initial = 1, Reserve = 2}
		},
		["CLUTCH_SQUADRON_DOUBLE"] = {
			DEFAULT = {Initial = 1, Reserve = 99}
		},
		["TIE_BOMBER_SQUADRON_DOUBLE"] = {
			DEFAULT = {Initial = 1, Reserve = 2}
		},
		["SKIRMISH_CUSTOMS_CORVETTE"] = {
			DEFAULT = {Initial = 2, Reserve = 4}
		},
		["SKIRMISH_VIGIL"] = {
			DEFAULT = {Initial = 2, Reserve = 0}
		},
		["SKIRMISH_CARRACK_CRUISER"] = {
			DEFAULT = {Initial = 1, Reserve = 0}
		},
		["SKIRMISH_VINDICATOR_CRUISER"] = {
			DEFAULT = {Initial = 1, Reserve = 0}
		}
	},
	Scripts = {"fighter-spawn"},
	Flags = {SHIPYARD = true, HANGAR = true}
}