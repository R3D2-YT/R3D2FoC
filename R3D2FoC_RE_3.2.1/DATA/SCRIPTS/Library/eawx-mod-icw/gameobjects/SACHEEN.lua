return {
	Ship_Crew_Requirement = 5,
	Fighters = {
		["DEFENDER_STARFIGHTER_SQUADRON_HALF"] = {
			HOSTILE = {Initial = 1, Reserve = 1},
			REBEL = {Initial = 1, Reserve = 1, ResearchType = "~CoS_Shesh"},
			INDEPENDENT_FORCES = {Initial = 1, Reserve = 1},
			WARLORDS = {Initial = 1, Reserve = 1}
		},
		["A9_SQUADRON_HALF"] = {
			REBEL = {Initial = 1, Reserve = 1, ResearchType = "CoS_Shesh"}
		}
	},
	Scripts = {"multilayer", "fighter-spawn", "single-unit-retreat"},
	Flags = {HANGAR = true}
}