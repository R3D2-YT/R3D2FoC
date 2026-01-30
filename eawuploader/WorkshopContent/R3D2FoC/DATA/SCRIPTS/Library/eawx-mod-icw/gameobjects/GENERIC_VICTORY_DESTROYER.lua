return {
	Ship_Crew_Requirement = 15,
	Fighters = {
		["HOWLRUNNER_SQUADRON"] = {
			IMPERIAL = {Initial = 1, Reserve = 1},
			HOSTILE = {Initial = 1, Reserve = 1},
			INDEPENDENT_FORCES = {Initial = 1, Reserve = 1}
		},
		["IRDA_SQUADRON"] = {
			CORPORATE_SECTOR = {Initial = 1, Reserve = 1, HeroOverride = {{"KRIN_INVINCIBLE"}, {"SHIELDED_IRDA_SQUADRON"}}}
		},
		["MIYTIL_FIGHTER_SQUADRON"] = {
			HAPES_CONSORTIUM = {Initial = 1, Reserve = 1}
		},
		["DUNELIZARD_FIGHTER_SQUADRON"] = {
			HUTT_CARTELS = {Initial = 1, Reserve = 1}
		},
		["REBEL_X-WING_SQUADRON"] = {
			REBEL = {Initial = 1, Reserve = 1}
		}
	},
	Scripts = {"multilayer", "fighter-spawn"}
}