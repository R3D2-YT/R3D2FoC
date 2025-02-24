return {
	Fighters = {
		["IRD_SQUADRON_HALF"] = {
			CORPORATE_SECTOR = {Initial = 1, Reserve = 1}
		},
		["Z95_HEADHUNTER_SQUADRON_HALF"] = {
			REBEL = {Initial = 1, Reserve = 1, TechLevel = LessThan(6)},
			HOSTILE = {Initial = 1, Reserve = 1, TechLevel = LessThan(6)},
			INDEPENDENT_FORCES = {Initial = 1, Reserve = 1, TechLevel = LessThan(6)},
			WARLORDS = {Initial = 1, Reserve = 1, TechLevel = LessThan(6)}
		},
		["DEFENDER_STARFIGHTER_SQUADRON_HALF"] = {
			REBEL = {Initial = 1, Reserve = 1, TechLevel = GreaterOrEqualTo(6)},
			HOSTILE = {Initial = 1, Reserve = 1, TechLevel = GreaterOrEqualTo(6)},
			INDEPENDENT_FORCES = {Initial = 1, Reserve = 1, TechLevel = GreaterOrEqualTo(6)},
			WARLORDS = {Initial = 1, Reserve = 1, TechLevel = GreaterOrEqualTo(6)}
		},
		["2_WARPOD_SQUADRON"] = {
			CORPORATE_SECTOR = {Initial = 1, Reserve = 1}
		},
		["Y-WING_SQUADRON"] = {
			REBEL = {Initial = 1, Reserve = 1},
			HOSTILE = {Initial = 1, Reserve = 1},
			INDEPENDENT_FORCES = {Initial = 1, Reserve = 1},
			WARLORDS = {Initial = 1, Reserve = 1}
		},
		["SKIRMISH_CR90"] = {
			REBEL = {Initial = 1, Reserve = 0},
			HOSTILE = {Initial = 1, Reserve = 0},
			INDEPENDENT_FORCES = {Initial = 1, Reserve = 0},
			WARLORDS = {Initial = 1, Reserve = 0}
		},
		["SKIRMISH_ETTI_LIGHTER"] = {
			CORPORATE_SECTOR = {Initial = 1, Reserve = 0}
		}
	},
	Scripts = {"fighter-spawn"}
}