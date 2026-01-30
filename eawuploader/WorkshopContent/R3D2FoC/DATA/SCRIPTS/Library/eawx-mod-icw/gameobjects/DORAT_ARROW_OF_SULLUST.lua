return {
	Fighters = {
		["PREYBIRD_SQUADRON_DOUBLE"] = {
			DEFAULT = {Initial = 1, Reserve = 3}
		},
		["REBEL_X-WING_SQUADRON"] = {
			DEFAULT = {Initial = 1, Reserve = 2, TechLevel = LessThan(3)}
		},
		["E-WING_SQUADRON"] = {
			DEFAULT = {Initial = 1, Reserve = 2, TechLevel = GreaterOrEqualTo(3)}
		}
	},
	Scripts = {"multilayer", "fighter-spawn"}
}