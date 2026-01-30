return {
    Fighters = {
        ["REBEL_X-WING_SQUADRON_DOUBLE"] = {
            DEFAULT = {Initial = 1, Reserve = 1}
        },
		["Y-WING_SQUADRON"] = {
            DEFAULT = {Initial = 1, Reserve = 2}
        },
		["B-WING_SQUADRON"] = {
            DEFAULT = {Initial = 1, Reserve = 2, ResearchType = "~BwingE"}
        },
		["B-WING_E_SQUADRON"] = {
			DEFAULT = {Initial = 1, Reserve = 2, ResearchType = "BwingE"}
		},
    },
    Scripts = {"multilayer", "fighter-spawn"}
}