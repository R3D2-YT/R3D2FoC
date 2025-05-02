return {
	Ship_Crew_Requirement = 10,
	Fighters = {
		["TIE_FIGHTER_SQUADRON"] = {
			HOSTILE = {Initial = 1, Reserve = 1},
			IMPERIAL = {Initial = 1, Reserve = 1},
			INDEPENDENT_FORCES = {Initial = 1, Reserve = 1}
		},
		["Z95_HEADHUNTER_SQUADRON"] = {
			HAPES_CONSORTIUM = {Initial = 1, Reserve = 1},
			REBEL = {Initial = 1, Reserve = 1},
			HUTT_CARTELS = {Initial = 1, Reserve = 1}
		}
	},
	Scripts = {"multilayer", "fighter-spawn"},
	Flags = {HANGAR = true}
}