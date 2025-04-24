return {
    Ship_Crew_Requirement = 1,
    Fighters = {
		["TIE_GT_SQUADRON_HALF"] = {
			HOSTILE = {Initial = 1, Reserve = 1},
			IMPERIAL = {Initial = 1, Reserve = 1, HeroOverride = {{"PANAKA_THEED"}, {"N1_SQUADRON_HALF"}}},
			INDEPENDENT_FORCES = {Initial = 1, Reserve = 1}
		},
		["Z95_HEADHUNTER_SQUADRON_HALF"] = {
			CORPORATE_SECTOR = {Initial = 1, Reserve = 1}
		}
	},
    Scripts = {"multilayer", "fighter-spawn", "single-unit-retreat"},
    Flags = {HANGAR = true}
}