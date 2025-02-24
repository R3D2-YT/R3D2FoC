return {
	Ship_Crew_Requirement = 1,
	Fighters = {
		["DEFENDER_STARFIGHTER_SQUADRON_HALF"] = {
			DEFAULT = {Initial = 1, Reserve = 1, ResearchType = "~CoS_Shesh"}
		},
		["A9_SQUADRON_HALF"] = {
			DEFAULT = {Initial = 1, Reserve = 1, ResearchType = "CoS_Shesh"}
		}
	},
	Scripts = {"multilayer", "fighter-spawn", "single-unit-retreat"},
	Flags = {HANGAR = true}
}