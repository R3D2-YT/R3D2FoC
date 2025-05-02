return {
	Ship_Crew_Requirement = 20,
	Fighters = {
		["HOWLRUNNER_SQUADRON_DOUBLE"] = {
			IMPERIAL = {Initial = 1, Reserve = 1}
		},
		["IRDA_SQUADRON_DOUBLE"] = {
			CORPORATE_SECTOR = {Initial = 1, Reserve = 1}
		},
		["MIYTIL_FIGHTER_SQUADRON_DOUBLE"] = {
			HAPES_CONSORTIUM = {Initial = 1, Reserve = 1}
		},
		["DUNELIZARD_FIGHTER_SQUADRON_DOUBLE"] = {
			HUTT_CARTELS = {Initial = 1, Reserve = 1}
		},
		["REBEL_X-WING_SQUADRON_DOUBLE"] = {
			HOSTILE = {Initial = 1, Reserve = 1},
			REBEL = {Initial = 1, Reserve = 1, TechLevel = LessOrEqualTo(6)},
			INDEPENDENT_FORCES = {Initial = 1, Reserve = 1}
		},
		["E-WING_SQUADRON_DOUBLE"] = {
			REBEL = {Initial = 1, Reserve = 1, TechLevel = GreaterThan(6)}
		}
	},
	Scripts = {"multilayer", "fighter-spawn", "single-unit-retreat"}
}