return {
	Fighters = {
		["TIE_FIGHTER_SQUADRON_DOUBLE"] = {
			DEFAULT = {Initial = 1, Reserve = 99}
		},
		["TIE_SENTINEL_SQUADRON"] = {
			DEFAULT = {Initial = 1, Reserve = 2}
		},
		["TIE_BOMBER_SQUADRON_DOUBLE"] = {
			DEFAULT = {Initial = 1, Reserve = 2}
		},
		["SKIRMISH_IPV1"] = {
			DEFAULT = {Initial = 2, Reserve = 4}
		},
		["SKIRMISH_RAIDER_II_CORVETTE"] = {
			DEFAULT = {Initial = 4, Reserve = 0}
		},
		["SKIRMISH_ARQUITENS"] = {
			DEFAULT = {Initial = 1, Reserve = 0}
		},
		["SKIRMISH_GENERIC_IMPERIAL_I_FRIGATE"] = {
			DEFAULT = {Initial = 1, Reserve = 0}
		}
	},
	Scripts = {"fighter-spawn"},
	Flags = {SHIPYARD = true, HANGAR = true}
}