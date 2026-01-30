return {
	Fighters = {
		["Z95_HEADHUNTER_SQUADRON_DOUBLE"] = {
			DEFAULT = {Initial = 1, Reserve = 99, TechLevel = LessThan(6)}
		},
		["DEFENDER_STARFIGHTER_SQUADRON_DOUBLE"] = {
			DEFAULT = {Initial = 1, Reserve = 99, TechLevel = GreaterOrEqualTo(6)}
		},
		["REBEL_X-WING_SQUADRON"] = {
			DEFAULT = {Initial = 1, Reserve = 2}
		},
		["Y-WING_SQUADRON"] = {
			DEFAULT = {Initial = 1, Reserve = 2, TechLevel = LessThan(6)}
		},
		["B-WING_SQUADRON"] = {
			DEFAULT = {Initial = 1, Reserve = 2, TechLevel = GreaterOrEqualTo(6)}
		},
		["SKIRMISH_CR90"] = {
			DEFAULT = {Initial = 2, Reserve = 2, TechLevel = LessThan(6)}
		},
		["SKIRMISH_AGAVE_CORVETTE"] = {
			DEFAULT = {Initial = 2, Reserve = 2, TechLevel = GreaterOrEqualTo(6)}
		},
		["SKIRMISH_DP20"] = {
			DEFAULT = {Initial = 1, Reserve = 0}
		},
		["SKIRMISH_GENERIC_NEBULON_B"] = {
			DEFAULT = {Initial = 1, Reserve = 0, TechLevel = LessThan(6)}
		},
		["SKIRMISH_CORONA"] = {
			DEFAULT = {Initial = 1, Reserve = 0, TechLevel = GreaterOrEqualTo(6)}
		},
	},	
	Scripts = {"fighter-spawn"},
	Flags = {SHIPYARD = true, HANGAR = true}
}