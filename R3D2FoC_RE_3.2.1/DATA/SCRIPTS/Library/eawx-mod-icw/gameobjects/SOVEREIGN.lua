return {
	Ship_Crew_Requirement = 300,
	Fighters = {
		["TIE_DROID_SQUADRON"] = {
			DEFAULT = {Initial = 1, Reserve = 6}
		},
		["TIE_DEFENDER_SQUADRON"] = {
			DEFAULT = {Initial = 1, Reserve = 5}
		},
		["A9_SQUADRON"] = {
			DEFAULT = {Initial = 1, Reserve = 6}
		},
		["TIE_BOMBER_SQUADRON"] = {
			DEFAULT = {Initial = 3, Reserve = 6}
		}
	},
	Scripts = {"fighter-spawn", "interdictor-ai", "persistent-damage"},
	Flags = {HANGAR = true}
}