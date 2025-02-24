return {
	Ship_Crew_Requirement = 300,
	Fighters = {
		["SHIELDED_TIE_DROID_SQUADRON_DOUBLE"] = {
			DEFAULT = {Initial = 1, Reserve = 6}
		},
		["A9_SQUADRON_DOUBLE"] = {
			DEFAULT = {Initial = 1, Reserve = 6}
		},
		["SHADOW_DROID_HEAVY_SQUADRON_DOUBLE"] = {
			DEFAULT = {Initial = 1, Reserve = 5}
		},
		["TIE_BOMBER_SQUADRON_DOUBLE"] = {
			DEFAULT = {Initial = 3, Reserve = 7}
		}
	},
	Scripts = {"interdictor-ai", "fighter-spawn", "persistent-damage"},
	Flags = {HANGAR = true}
}