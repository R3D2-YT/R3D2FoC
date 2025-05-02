return {
	Ship_Crew_Requirement = 1,
	Fighters = {
		["HOWLRUNNER_SQUADRON_HALF"] = {
			IMPERIAL = {Initial = 1, Reserve = 1},
			INDEPENDENT_FORCES = {Initial = 1, Reserve = 1}
		},
		["IRDA_SQUADRON_HALF"] = {
			CORPORATE_SECTOR = {Initial = 1, Reserve = 1}
		},
		["REBEL_X-WING_SQUADRON_HALF"] = {
			HOSTILE = {Initial = 1, Reserve = 1},
			REBEL = {Initial = 1, Reserve = 1}
		}
	},
	Scripts = {"multilayer", "fighter-spawn", "single-unit-retreat"},
	Flags = {HANGAR = true}
}