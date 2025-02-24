return {
	Ship_Crew_Requirement = 1,
	Fighters = {
		["TIE_DEFENDER_SQUADRON"] = {
			DEFAULT = {Initial = 1, Reserve = 1}
		},
		["STARWING_SQUADRON"] = {
			DEFAULT = {Initial = 1, Reserve = 1}
		}
	},
	Scripts = {"multilayer", "fighter-spawn", "single-unit-retreat"},
	Flags = {HANGAR = true}
}