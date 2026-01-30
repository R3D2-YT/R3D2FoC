return {
	Fighters = {
		["NSSIS_SQUADRON"] = {
			EMPIREOFTHEHAND = {Initial = 1, Reserve = 2}
		},
		["CIVILIAN_FIGHTER"] = {
			CORPORATE_SECTOR = {Initial = 1, Reserve = 2, Random = "random-fighters/CivilianFighter"},
			HAPES_CONSORTIUM = {Initial = 1, Reserve = 2, Random = "random-fighters/CivilianFighter"},
			HOSTILE = {Initial = 1, Reserve = 2, Random = "random-fighters/CivilianFighter"},
			IMPERIAL = {Initial = 1, Reserve = 2, Random = "random-fighters/CivilianFighter"},
			REBEL = {Initial = 1, Reserve = 2, Random = "random-fighters/CivilianFighter"},
			INDEPENDENT_FORCES = {Initial = 1, Reserve = 2, Random = "random-fighters/CivilianFighter"},
			HUTT_CARTELS = {Initial = 1, Reserve = 2, Random = "random-fighters/CivilianFighter"}
		}
	},
	Scripts = {"fighter-spawn"}
}