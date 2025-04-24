return {
	Fighters = {
		["NSSIS_SQUADRON"] = {
			EMPIREOFTHEHAND = {Initial = 2, Reserve = 7}
		},
		["CIVILIAN_FIGHTER"] = {
			CORPORATE_SECTOR = {Initial = 2, Reserve = 7, Random = "random-fighters/CivilianFighter"},
			HAPES_CONSORTIUM = {Initial = 2, Reserve = 7, Random = "random-fighters/CivilianFighter"},
			HOSTILE = {Initial = 2, Reserve = 7, Random = "random-fighters/CivilianFighter"},
			IMPERIAL = {Initial = 2, Reserve = 7, Random = "random-fighters/CivilianFighter"},
			REBEL = {Initial = 2, Reserve = 7, Random = "random-fighters/CivilianFighter"},
			INDEPENDENT_FORCES = {Initial = 2, Reserve = 7, Random = "random-fighters/CivilianFighter"},
			HUTT_CARTELS = {Initial = 2, Reserve = 7, Random = "random-fighters/CivilianFighter"}
		},
		["CIVILIAN_BOMBER"] = {
			DEFAULT = {Initial = 2, Reserve = 7, Random = "random-fighters/CivilianBomber"}
		}
	},
	Scripts = {"fighter-spawn"},
}