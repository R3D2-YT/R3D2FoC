return {
	Ship_Crew_Requirement = 300,
	Fighters = {
		["TIE_FIGHTER_SQUADRON_DOUBLE"] = {
			DEFAULT = {Initial = 2, Reserve = 4, ResearchType = "~EATIEShields"}
		},
		["SHIELDED_TIE_SQUADRON_DOUBLE"] = {
			DEFAULT = {Initial = 2, Reserve = 4, ResearchType = "EATIEShields"}
		},
		["TIE_DEFENDER_SQUADRON_DOUBLE"] = {
			DEFAULT = {Initial = 1, Reserve = 2}
		},
		["TIE_BOMBER_SQUADRON_DOUBLE"] = {
			DEFAULT = {Initial = 1, Reserve = 2}
		}
	},
	Scripts = {"fighter-spawn", "persistent-damage"}
}