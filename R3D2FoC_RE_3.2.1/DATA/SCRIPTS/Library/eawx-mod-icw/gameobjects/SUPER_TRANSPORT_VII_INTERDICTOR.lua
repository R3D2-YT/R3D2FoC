return {
	Ship_Crew_Requirement = 5,
	Fighters = {
		["CIVILIAN_FIGHTER_HALF"] = {
			DEFAULT = {Initial = 1, Reserve = 2, Random = "random-fighters/CivilianFighter", Suffix = "_HALF"}
		},
		["CIVILIAN_BOMBER_HALF"] = {
			DEFAULT = {Initial = 1, Reserve = 2, Random = "random-fighters/CivilianBomber", Suffix = "_HALF"}
		}
	},
	Scripts = {"multilayer", "fighter-spawn", "single-unit-retreat", "interdictor-ai"},
	Flags = {HANGAR = true}
}