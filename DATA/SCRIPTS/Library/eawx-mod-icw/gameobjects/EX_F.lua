return {
	Ship_Crew_Requirement = 50,
	Fighters = {
		["TIE_FIGHTER_SQUADRON"] = {
			DEFAULT = {Initial = 1, Reserve = 3}
		},
		["TIE_INTERCEPTOR_SQUADRON"] = {
			DEFAULT = {Initial = 1, Reserve = 1}
		},
		["TIE_BOMBER_SQUADRON"] = {
			DEFAULT = {Initial = 1, Reserve = 1}
		}
	},
	Scripts = {"multilayer", "fighter-spawn"}
}