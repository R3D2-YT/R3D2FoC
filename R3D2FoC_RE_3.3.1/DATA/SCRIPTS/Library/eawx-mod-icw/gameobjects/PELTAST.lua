return {
	Ship_Crew_Requirement = 20,
	Fighters = {
		["A-WING_SQUADRON"] = {
			REBEL = {Initial = 1, Reserve = 1}
		},
		["MIYTIL_FIGHTER_SQUADRON"] = {
			HAPES_CONSORTIUM = {Initial = 1, Reserve = 1}
		},
		["DUNELIZARD_FIGHTER_SQUADRON"] = {
			HUTT_CARTELS = {Initial = 1, Reserve = 1}
		},
		["SCARSSIS_SQUADRON"] = {
			EMPIREOFTHEHAND = {Initial = 1, Reserve = 1},
			HOSTILE = {Initial = 1, Reserve = 1},
			INDEPENDENT_FORCES = {Initial = 1, Reserve = 1}
		},
		["V38_SQUADRON"] = {
			IMPERIAL = {Initial = 1, Reserve = 1}
		}
	},
	Scripts = {"multilayer", "fighter-spawn", "single-unit-retreat"}
}