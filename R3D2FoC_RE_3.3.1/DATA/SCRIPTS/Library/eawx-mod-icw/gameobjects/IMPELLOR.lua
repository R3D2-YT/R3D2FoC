return {
    Ship_Crew_Requirement = 150,
    Fighters = {
        ["TIE_FIGHTER_SQUADRON_DOUBLE"] = {
			DEFAULT = {Initial = 2, Reserve = 4}
		},
        ["TIE_INTERCEPTOR_SQUADRON_DOUBLE"] = {
			DEFAULT = {Initial = 2, Reserve = 4}
		},
        ["TIE_BOMBER_SQUADRON_DOUBLE"] = {
			DEFAULT = {Initial = 1, Reserve = 2}
		},
        ["SCIMITAR_SQUADRON_DOUBLE"] = {
			DEFAULT = {Initial = 2, Reserve = 4}
		}
    },
    Scripts = {"multilayer", "fighter-spawn", "single-unit-retreat"}
}
