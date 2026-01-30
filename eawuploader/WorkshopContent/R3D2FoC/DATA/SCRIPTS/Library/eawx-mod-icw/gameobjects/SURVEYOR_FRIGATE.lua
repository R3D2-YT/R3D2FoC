return {
	Ship_Crew_Requirement = 5,
	Fighters = {
		["TIE_AGGRESSOR_SQUADRON_HALF"] = {
			DEFAULT = {Initial = 1, Reserve = 1, HeroOverride = {{"PANAKA_THEED"}, {"N1_SQUADRON_HALF"}}}
		}
	},
	Scripts = {"multilayer", "fighter-spawn", "single-unit-retreat"},
	Flags = {HANGAR = true}
}