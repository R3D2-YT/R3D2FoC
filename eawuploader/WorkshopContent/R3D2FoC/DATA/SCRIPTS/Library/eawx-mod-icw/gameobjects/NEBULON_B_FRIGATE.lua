return {
	Ship_Crew_Requirement = 1,
	Fighters = {
		["REBEL_X-WING_SQUADRON_HALF"] = {
			DEFAULT = {Initial = 1, Reserve = 2}
		},
		["Y-WING_SQUADRON_HALF"] = {
			DEFAULT = {Initial = 1, Reserve = 0}
		}
	},
	Scripts = {"multilayer", "fighter-spawn", "single-unit-retreat"},
	Flags = {HANGAR = true}
}