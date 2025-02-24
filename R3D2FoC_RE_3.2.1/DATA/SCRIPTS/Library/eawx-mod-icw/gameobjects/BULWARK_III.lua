return {
	Ship_Crew_Requirement = 40,
	Fighters = {
		["DREXL_SQUADRON_DOUBLE"] = {
			CORPORATE_SECTOR = {Initial = 1, Reserve = 2},
			HOSTILE = {Initial = 1, Reserve = 2},
			REBEL = {Initial = 1, Reserve = 2, ResearchType = "CoS_Tevv"},
			INDEPENDENT_FORCES = {Initial = 1, Reserve = 2}
		},
		["REBEL_X-WING_SQUADRON_DOUBLE"] = {
			REBEL = {Initial = 1, Reserve = 2, TechLevel = LessThan(3), ResearchType = "~CoS_Tevv"}
		},
		["E-WING_SQUADRON_DOUBLE"] = {
			REBEL = {Initial = 1, Reserve = 2, TechLevel = GreaterOrEqualTo(3), ResearchType = "~CoS_Tevv"}
		},
		["TIE_AVENGER_SQUADRON_DOUBLE"] = {
			IMPERIAL = {Initial = 1, Reserve = 2}
		},
		["A-WING_SQUADRON"] = {
			REBEL = {Initial = 1, Reserve = 3, HeroOverride = {{"TALLON_SILENT_WATER"}, {"A-WING_SQUADRON_DOUBLE"}}}
		},
		["CLOAKSHAPE_NEW_SQUADRON"] = {
			HUTT_CARTELS = {Initial = 1, Reserve = 3}
		},
		["MANKVIM_SQUADRON"] = {
			CORPORATE_SECTOR = {Initial = 1, Reserve = 3},
			HOSTILE = {Initial = 1, Reserve = 3},
			INDEPENDENT_FORCES = {Initial = 1, Reserve = 3}
		},
		["TIE_INTERCEPTOR_SQUADRON"] = {
			IMPERIAL = {Initial = 1, Reserve = 3}
		}
	},
	Scripts = {"multilayer", "fighter-spawn"}
}