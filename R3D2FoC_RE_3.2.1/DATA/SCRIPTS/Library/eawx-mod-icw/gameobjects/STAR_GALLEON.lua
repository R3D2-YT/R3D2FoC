return {
	Ship_Crew_Requirement = 5,
	Fighters = {
		["IRD_SQUADRON_HALF"] = {
			CORPORATE_SECTOR = {Initial = 1, Reserve = 1}
		},
		["TIE_FIGHTER_SQUADRON_HALF"] = {
			EMPIRE = {Initial = 1, Reserve = 1, TechLevel = LessThan(6), HeroOverride = {{"TAVIRA_INVIDIOUS"}, {"CLUTCH_SQUADRON_HALF"}}},
			ERIADU_AUTHORITY = {Initial = 1, Reserve = 1, ResearchType = "~EATIEShields", HeroOverride = {{"TAVIRA_INVIDIOUS"}, {"CLUTCH_SQUADRON_HALF"}}},
			GREATER_MALDROOD = {Initial = 1, Reserve = 1, HeroOverride = {{"TAVIRA_INVIDIOUS"}, {"CLUTCH_SQUADRON_HALF"}}},
			PENTASTAR = {Initial = 1, Reserve = 1, HeroOverride = {{"TAVIRA_INVIDIOUS"}, {"CLUTCH_SQUADRON_HALF"}}},
			HOSTILE = {Initial = 1, Reserve = 1},
			INDEPENDENT_FORCES = {Initial = 1, Reserve = 1},
			WARLORDS = {Initial = 1, Reserve = 1},
			ZSINJ_EMPIRE = {Initial = 1, Reserve = 1, HeroOverride = {{"TAVIRA_INVIDIOUS"}, {"CLUTCH_SQUADRON_HALF"}}},
		},
		["SUPER_TIE_SQUADRON_HALF"] = {
			EMPIRE = {Initial = 1, Reserve = 1, TechLevel = GreaterOrEqualTo(6), HeroOverride = {{"TAVIRA_INVIDIOUS"}, {"CLUTCH_SQUADRON_HALF"}}}
		},
		["SHIELDED_TIE_SQUADRON_HALF"] = {
			ERIADU_AUTHORITY = {Initial = 1, Reserve = 1, ResearchType = "EATIEShields", HeroOverride = {{"TAVIRA_INVIDIOUS"}, {"CLUTCH_SQUADRON_HALF"}}}
		}
	},
	Scripts = {"multilayer", "single-unit-retreat"},
	Flags = {HANGAR = true}
}