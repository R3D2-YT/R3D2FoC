return {
	Fighters = {
		["REBEL_X-WING_SQUADRON_DOUBLE"] = {
			DEFAULT = {Initial = 1, Reserve = 2, TechLevel = LessThan(4)}
		},
		["REBEL_X-WING_SQUADRON"] = {
			DEFAULT = {Initial = 1, Reserve = 2, TechLevel = GreaterOrEqualTo(4)}
		},
		["E-WING_SQUADRON"] = {
			DEFAULT = {Initial = 1, Reserve = 2, TechLevel = GreaterOrEqualTo(4)}
		},
		["A-WING_SQUADRON"] = {
			DEFAULT = {Initial = 3, Reserve = 99}
		},
		["B-WING_SQUADRON"] = {
			DEFAULT = {Initial = 3, Reserve = 6, TechLevel = LessThan(4)}
		},
		["B-WING_SQUADRON_DOUBLE"] = {
			DEFAULT = {Initial = 1, Reserve = 2, TechLevel = GreaterOrEqualTo(4)}
		},
		["SKIRMISH_CR90"] = {
			DEFAULT = {Initial = 2, Reserve = 4, TechLevel = LessThan(4)}
		},
		["SKIRMISH_AGAVE_CORVETTE"] = {
			DEFAULT = {Initial = 2, Reserve = 4, TechLevel = GreaterOrEqualTo(4)}
		},
		["SKIRMISH_GENERIC_NEBULON_B"] = {
			DEFAULT = {Initial = 2, Reserve = 0, TechLevel = LessThan(6)}
		},
		["SKIRMISH_CORONA"] = {
			DEFAULT = {Initial = 2, Reserve = 0, TechLevel = GreaterOrEqualTo(6)}
		},
		["SKIRMISH_ALLIANCE_ASSAULT_FRIGATE"] = {
			DEFAULT = {Initial = 3, Reserve = 0}
		},
		["SKIRMISH_MC40A"] = {
			DEFAULT = {Initial = 2, Reserve = 0, TechLevel = LessThan(4)}
		},
		["SKIRMISH_MC30C"] = {
			DEFAULT = {Initial = 2, Reserve = 0, TechLevel = GreaterOrEqualTo(4)}
		},
		["SKIRMISH_MC80"] = {
			DEFAULT = {Initial = 2, Reserve = 0, TechLevel = LessThan(4)}
		},
		["SKIRMISH_MAJESTIC"] = {
			DEFAULT = {Initial = 3, Reserve = 0, TechLevel = GreaterOrEqualTo(4)}
		}
	},
	Scripts = {"fighter-spawn"},
	Flags = {SHIPYARD = true, HANGAR = true}
}