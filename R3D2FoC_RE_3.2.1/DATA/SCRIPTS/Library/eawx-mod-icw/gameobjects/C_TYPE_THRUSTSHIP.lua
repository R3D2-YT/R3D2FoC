return {
	Ship_Crew_Requirement = 1,
	Fighters = {
		["TRIFOIL_SQUADRON"] = {
			DEFAULT = {Initial = 1, Reserve = 2}
		},
		["TIE_HEAVY_BOMBER_SQUADRON"] = {
			DEFAULT = {Initial = 1, Reserve = 1}
		}
	},
	Scripts = {"multilayer", "fighter-spawn"},
	Flags = {HANGAR = true}
}