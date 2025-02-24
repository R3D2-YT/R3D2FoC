return {
	Ship_Crew_Requirement = 300,
	Fighters = {
		["TRIFOIL_SQUADRON_DOUBLE"] = {
			DEFAULT = {Initial = 2, Reserve = 10}
		},
		["SHIELDED_INTERCEPTOR_SQUADRON"] = {
			DEFAULT = {Initial = 1, Reserve = 5}
		},
		["TIE_BOMBER_SQUADRON"] = {
			DEFAULT = {Initial = 1, Reserve = 5}
		}
	},
	Scripts = {"fighter-spawn", "persistent-damage"},
	Flags = {HANGAR = true}
}