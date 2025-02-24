return {
	Fighters = {
		["REBEL_X-WING_SQUADRON_DOUBLE"] = {
			DEFAULT = {Initial = 1, Reserve = 1, TechLevel = LessOrEqualTo(6)}
		},
		["E-WING_SQUADRON_DOUBLE"] = {
			DEFAULT = {Initial = 1, Reserve = 1, TechLevel = GreaterThan(6)}
		},
		["MILLENNIUM_FALCON"] = {
			DEFAULT = {Initial = 1, Reserve = 0}
		}
	},
	Scripts = {"multilayer", "fighter-spawn"}
}