return {
   Fighters = {
		["PREYBIRD_SQUADRON"] = {
			DEFAULT = {Initial = 1, Reserve = 3}
		},
		["B-WING_SQUADRON_HALF"] = {
			DEFAULT = {Initial = 1, Reserve = 1, TechLevel = LessThan(4), ResearchType = "~BwingE"}
		},
		["B-WING_E_SQUADRON_HALF"] = {
			DEFAULT = {Initial = 1, Reserve = 1, TechLevel = LessThan(4), ResearchType = "BwingE"}
		},		
		["K-WING_SQUADRON_HALF"] = {
			DEFAULT = {Initial = 1, Reserve = 1, TechLevel = GreaterOrEqualTo(4)}
		}	
	},
	Scripts = {"multilayer", "fighter-spawn"}
}