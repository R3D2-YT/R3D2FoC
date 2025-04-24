return {
	Ship_Crew_Requirement = 10,
	Fighters = {
		["MIYTIL_FIGHTER_SQUADRON"] = {
			HAPES_CONSORTIUM = {Initial = 1, Reserve = 1}
		},
		["DUNELIZARD_FIGHTER_SQUADRON"] = {
			HUTT_CARTELS = {Initial = 1, Reserve = 1}
		},
		["REBEL_X-WING_SQUADRON"] = {
			REBEL = {Initial = 1, Reserve = 1, TechLevel = LessThan(4)}
		},
		["E-WING_SQUADRON"] = {
			REBEL = {Initial = 1, Reserve = 1, TechLevel = GreaterOrEqualTo(4)}
		},
		["TIE_AVENGER_SQUADRON"] = {
			HOSTILE = {Initial = 1, Reserve = 1},
			IMPERIAL = {Initial = 1, Reserve = 1},
			INDEPENDENT_FORCES = {Initial = 1, Reserve = 1},
		}
	},
	Scripts = {"multilayer", "fighter-spawn"}
}