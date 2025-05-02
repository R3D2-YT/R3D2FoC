return {
	Ship_Crew_Requirement = 150,
	Fighters = {
		["TIE_INTERCEPTOR_SQUADRON"] = {
			DEFAULT = {Initial = 3, Reserve = 7}
		},
		["TIE_BOMBER_SQUADRON"] = {
			DEFAULT = {Initial = 1, Reserve = 3}
		}
	},
	Scripts = {"fighter-spawn", "persistent-damage"}
}