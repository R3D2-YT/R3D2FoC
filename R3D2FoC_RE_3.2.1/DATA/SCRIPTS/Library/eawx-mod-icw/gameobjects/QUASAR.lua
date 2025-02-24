return {
	Ship_Crew_Requirement = 1,
	Fighters = {
		["REBEL_X-WING_SQUADRON"] = {
			DEFAULT = {Initial = 1, Reserve = 1, ResearchType = "~CoS_Tevv", HeroOverride = {{"TALDIRA_DEATHSEED"}, {"CHIRDAKI_SQUADRON_DOUBLE"}}}
		},
		["DREXL_SQUADRON"] = {
			DEFAULT = {Initial = 1, Reserve = 1, ResearchType = "CoS_Tevv", HeroOverride = {{"TALDIRA_DEATHSEED"}, {"CHIRDAKI_SQUADRON_DOUBLE"}}}
		},
		["Y-WING_SQUADRON"] = {
			DEFAULT = {Initial = 1, Reserve = 2}
		}
	},
	Scripts = {"multilayer", "fighter-spawn", "single-unit-retreat"},
	Flags = {HANGAR = true}
}