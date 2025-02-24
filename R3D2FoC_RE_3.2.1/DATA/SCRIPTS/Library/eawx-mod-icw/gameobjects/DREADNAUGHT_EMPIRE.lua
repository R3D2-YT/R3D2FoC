return {
	Ship_Crew_Requirement = 20,
	Fighters = {
		["HOWLRUNNER_SQUADRON_HALF"] = {
			HAPES_CONSORTIUM = {Initial = 1, Reserve = 1},
			HOSTILE = {Initial = 1, Reserve = 1},
			IMPERIAL = {Initial = 1, Reserve = 1, HeroOverride = {{"PANAKA_THEED"}, {"N1_SQUADRON_HALF"}}},
			INDEPENDENT_FORCES = {Initial = 1, Reserve = 1}
		},
		["IRDA_SQUADRON_HALF"] = {
			CORPORATE_SECTOR = {Initial = 1, Reserve = 1}
		},
		["REBEL_X-WING_SQUADRON_HALF"] = {
			REBEL = {Initial = 1, Reserve = 1}
		},
		["TIE_FIGHTER_SQUADRON_HALF"] = {
			EMPIREOFTHEHAND = {Initial = 1, Reserve = 1}
		},
		["CLOAKSHAPE_NEW_SQUADRON_HALF"] = {
			HUTT_CARTELS = {Initial = 1, Reserve = 1}
		}
	},
	Scripts = {"multilayer", "fighter-spawn", "single-unit-retreat"}
}