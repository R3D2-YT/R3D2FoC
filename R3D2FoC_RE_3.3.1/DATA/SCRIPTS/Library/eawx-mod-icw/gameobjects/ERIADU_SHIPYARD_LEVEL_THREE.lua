return {
	Fighters = {
		["TIE_SENTINEL_SQUADRON_DOUBLE"] = {
			DEFAULT = {Initial = 1, Reserve = 1}
		},
		["TIE_INTERCEPTOR_SQUADRON"] = {
			DEFAULT = {Initial = 3, Reserve = 99}
		},
		["TIE_BOMBER_SQUADRON"] = {
			DEFAULT = {Initial = 3, Reserve = 6}
		},
		["SKIRMISH_IPV1"] = {
			DEFAULT = {Initial = 2, Reserve = 4}
		},
		["SKIRMISH_RAIDER_II_CORVETTE"] = {
			DEFAULT = {Initial = 4, Reserve = 0}
		},
		["SKIRMISH_ARQUITENS"] = {
			DEFAULT = {Initial = 4, Reserve = 0}
		},
		["SKIRMISH_GENERIC_IMPERIAL_I_FRIGATE"] = {
			DEFAULT = {Initial = 2, Reserve = 0}
		},
		["SKIRMISH_VICTORY_DESTROYER"] = {
			DEFAULT = {Initial = 2, Reserve = 0}
		}
	},
	Scripts = {"fighter-spawn"},
	Flags = {SHIPYARD = true, HANGAR = true}
}