return {
	Ship_Crew_Requirement = 300,
	Fighters = {
		["A-WING_SQUADRON"] = {
			DEFAULT = {Initial = 1, Reserve = 5, HeroOverride = {{"TALLON_SILENT_WATER"}, {"A-WING_SQUADRON_DOUBLE"}}}
		},
		["REBEL_X-WING_SQUADRON_DOUBLE"] = {
			DEFAULT = {Initial = 2, Reserve = 10}
		},
		["Y-WING_SQUADRON"] = {
			DEFAULT = {Initial = 1, Reserve = 5}
		}
	},
	Scripts = {"fighter-spawn", "persistent-damage"},
	Flags = {HANGAR = true}
}