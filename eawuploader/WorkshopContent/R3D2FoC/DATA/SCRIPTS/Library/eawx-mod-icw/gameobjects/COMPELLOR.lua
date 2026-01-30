return {
    Ship_Crew_Requirement = 150,
    Fighters = {
        ["TIE_FIGHTER_SQUADRON_DOUBLE"] = {
			DEFAULT = {Initial = 1, Reserve = 1}
		},
        ["TIE_INTERCEPTOR_SQUADRON"] = {
			DEFAULT = {Initial = 1, Reserve = 1}
		},
        ["TIE_BOMBER_SQUADRON_DOUBLE"] = {
			DEFAULT = {Initial = 1, Reserve = 1}
		}
	},	
    Scripts = {"multilayer", "fighter-spawn", "single-unit-retreat"}
}
