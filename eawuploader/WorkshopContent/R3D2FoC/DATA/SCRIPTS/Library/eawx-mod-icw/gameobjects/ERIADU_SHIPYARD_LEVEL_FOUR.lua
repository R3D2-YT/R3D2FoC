return {
	Fighters = {
		["TIE_SENTINEL_SQUADRON"] = {
			DEFAULT = {Initial = 3, Reserve = 6}
		},
		["TIE_INTERCEPTOR_SQUADRON"] = {
			DEFAULT = {Initial = 3, Reserve = 99}
		},
		["TIE_BOMBER_SQUADRON_DOUBLE"] = {
			DEFAULT = {Initial = 2, Reserve = 4}
		},
		["SKIRMISH_IPV1"] = {
			DEFAULT = {Initial = 3, Reserve = 6}
		},
		["SKIRMISH_GENERIC_IMPERIAL_I_FRIGATE"] = {
			DEFAULT = {Initial = 1, Reserve = 0}
		},
		["SKIRMISH_VICTORY_DESTROYER"] = {
			DEFAULT = {Initial = 2, Reserve = 0}
		},
		["SKIRMISH_STAR_DESTROYER"] = {
			DEFAULT = {Initial = 1, Reserve = 0}
		},
		["SKIRMISH_STAR_DESTROYER_TWO"] = {
			DEFAULT = {Initial = 1, Reserve = 0}
		}
	},
	Scripts = {"fighter-spawn"},
	Flags = {SHIPYARD = true, HANGAR = true}
}