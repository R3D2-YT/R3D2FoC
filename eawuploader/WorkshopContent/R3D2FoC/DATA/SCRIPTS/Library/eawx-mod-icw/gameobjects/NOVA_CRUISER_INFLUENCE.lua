return {
	Ship_Crew_Requirement = 5,
	Fighters = {
		["MIYTIL_FIGHTER_SQUADRON"] = {
			DEFAULT = {Initial = 1, Reserve = 1}
		},
		["MIYTIL_BOMBER_SQUADRON_HALF"] = {
			DEFAULT = {Initial = 1, Reserve = 1}
		}
	},
	Scripts = {"multilayer", "fighter-spawn", "single-unit-retreat"},
	Flags = {HANGAR = true}
}