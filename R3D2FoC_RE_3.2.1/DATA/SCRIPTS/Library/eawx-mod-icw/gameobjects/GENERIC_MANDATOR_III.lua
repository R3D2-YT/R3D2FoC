return {
	Ship_Crew_Requirement = 300,
	Fighters = {
		["TIE_GT_SQUADRON_DOUBLE"] = {
			DEFAULT = {Initial = 2, Reserve = 4}
		},
		["TIE_DEFENDER_SQUADRON_DOUBLE"] = {
			DEFAULT = {Initial = 1, Reserve = 3}
		},
		["V38_SQUADRON_DOUBLE"] = {
			DEFAULT = {Initial = 2, Reserve = 4}
		},
		["TIE_BOMBER_SQUADRON_DOUBLE"] = {
			DEFAULT = {Initial = 2, Reserve = 4}
		}
	},
	Scripts = {"fighter-spawn", "persistent-damage"},
	Flags = {HANGAR = true}
}