return {
	Missions = {
		["ACCUMULATE"] = {active = false, chance = 4},
		["CARGO_CONVOY"] = {active = false, chance = 12},
		["CONQUER"] = {active = false, chance = 12},
		["CONSTRUCT"] = {active = false, chance = 12},
		["CREW_RECRUITMENT"] = {active = false, chance = 4},
		["HERO_CONVOY"] = {active = false, chance = 12},
		["INFRASTRUCTURE_EXPANSION"] = {active = false, chance = 8},
		["LIBERATE"] = {active = false, chance = 12},
--		["RAISE_INFLUENCE"] = {active = false, chance = 8},
		["RECON"] = {active = false, chance = 12},
		["UPGRADE"] = {active = false, chance = 12},
	},
	RewardGroups = {
		"CRIME_PATH",
		"CRIME_PATH",
		"EMPIRE_PATH",
		"ACADEMY",
		"PDF"
	},
	RewardGroupDetails = {
		["CRIME_PATH"] = {
			DialogName = "HUTTS_CRIME",
			RewardName = "CRIME_PATH",
			GroupSupport = "SCUM",
			SupportArg = 1
		},
		["EMPIRE_PATH"] = {
			DialogName = "HUTTS_EMPIRE",
			RewardName = "EMPIRE_PATH",
			GroupSupport = "HUTT_MOBILIZATION",
			SupportArg = 5
		},
		["ACADEMY"] = {
			DialogName = "HUTTS_ACADEMY",
			RewardName = "ACADEMY",
			GroupSupport = "HUTT_MOBILIZATION",
			SupportArg = 5
		},
		["PDF"] = {
			DialogName = "PDF",
			RewardName = "PDF"
		}
	}
}
