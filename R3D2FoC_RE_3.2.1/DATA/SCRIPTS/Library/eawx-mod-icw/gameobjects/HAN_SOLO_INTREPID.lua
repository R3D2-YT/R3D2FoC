return {
	Fighters = {
		["E-WING_SQUADRON"] = {
			DEFAULT = {Initial = 1, Reserve = 3}
		},
		["B-WING_SQUADRON"] = {
			DEFAULT = {Initial = 1, Reserve = 3, ResearchType = "~BwingE"}
		},
		["B-WING_E_SQUADRON"] = {
			DEFAULT = {Initial = 1, Reserve = 3, ResearchType = "BwingE"}
		},
		["K-WING_SQUADRON"] = {
			DEFAULT = {Initial = 1, Reserve = 3}
		},
		["MILLENNIUM_FALCON"] = {
			DEFAULT = {Initial = 1, Reserve = 0}
		}
	},
	Scripts = {"multilayer", "fighter-spawn"}
}