return {
	Fighters = {
		["TIE_AVENGER_SQUADRON_DOUBLE"] = {
			DEFAULT = {Initial = 1, Reserve = 2}
		},
		["TIE_INTERCEPTOR_SQUADRON"] = {
			DEFAULT = {Initial = 3, Reserve = 99}
		},
		["TIE_BOMBER_SQUADRON"] = {
			DEFAULT = {Initial = 3, Reserve = 6}
		},
		["SKIRMISH_CUSTOMS_CORVETTE"] = {
			DEFAULT = {Initial = 2, Reserve = 4}
		},
		["SKIRMISH_STRIKE_CRUISER"] = {
			DEFAULT = {Initial = 2, Reserve = 0}
		},
		["SKIRMISH_VINDICATOR_CRUISER"] = {
			DEFAULT = {Initial = 2, Reserve = 0}
		},
		["SKIRMISH_IMPERIAL_II_FRIGATE"] = {
			DEFAULT = {Initial = 1, Reserve = 0}
		},
		["SKIRMISH_CRIMSON_VICTORY"] = {
			DEFAULT = {Initial = 2, Reserve = 0}
		}
	},
	Scripts = {"fighter-spawn"},
	Flags = {SHIPYARD = true, HANGAR = true}
}