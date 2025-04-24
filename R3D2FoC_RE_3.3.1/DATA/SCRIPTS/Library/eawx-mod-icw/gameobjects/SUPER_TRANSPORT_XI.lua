return {
	Ship_Crew_Requirement = 10,
	Fighters = {
		["MIXED_UGLY_SQUADRON"] = {
			DEFAULT = {Initial = 1, Reserve = 3}
		},
		["CIVILIAN_FIGHTER"] = {
			DEFAULT = {Initial = 1, Reserve = 1, Random = "random-fighters/CivilianFighter"}
		},
		["PIRATE_FIGHTER"] = {
			DEFAULT = {Initial = 1, Reserve = 1, Random = "random-fighters/PirateFighter"}
		},
		["CIVILIAN_BOMBER"] = {
			DEFAULT = {Initial = 1, Reserve = 1, Random = "random-fighters/CivilianBomber"}
		},
		["CIVILIAN_BOMBER_DOUBLE"] = {
			DEFAULT = {Initial = 1, Reserve = 1, Random = "random-fighters/CivilianBomber", Suffix = "_DOUBLE"}
		}
	},
	Scripts = {"multilayer", "fighter-spawn", "single-unit-retreat"}
}