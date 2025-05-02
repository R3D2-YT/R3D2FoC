return {
	Ship_Crew_Requirement = 1,
	Fighters = {
		["A9_SQUADRON"] = {
			HOSTILE = {Initial = 1, Reserve = 1},
			IMPERIAL = {Initial = 1, Reserve = 1},
			INDEPENDENT_FORCES = {Initial = 1, Reserve = 1}
		}
	},
	Scripts = {"multilayer", "fighter-spawn", "single-unit-retreat"},
	Flags = {HANGAR = true}
}