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
		"ROYAL",
		"REQUUD",
		"GALNEY",
		"MALURI",
	--	"ALGRAY",
	--	"CORR",
	--	"THANE",
		"PDF"
	},
	RewardGroupDetails = {
		["ROYAL"] = {
			DialogName = "HOUSE_ROYAL",
			RewardName = "ROYAL",
			GroupSupport = "ROYAL",
			SupportArg = 5
		},
		["REQUUD"] = {
			DialogName = "HOUSE_REQUUD",
			RewardName = "REQUUD",
			GroupSupport = "REQUUD",
			SupportArg = 5
		},
		["GALNEY"] = {
			DialogName = "HOUSE_GALNEY",
			RewardName = "GALNEY",
			GroupSupport = "GALNEY",
			SupportArg = 5
		},
		["MALURI"] = {
			DialogName = "HOUSE_MALURI",
			RewardName = "MALURI",
			GroupSupport = "MALURI",
			SupportArg = 5
		},
	--	["ALGRAY"] = {
	--		DialogName = "HOUSE_ALGRAY",
	--		RewardName = "ALGRAY",
	--		GroupSupport = "ALGRAY",
	--		SupportArg = 5
	--	},
	--	["CORR"] = {
	--		DialogName = "HOUSE_CORR",
	--		RewardName = "CORR",
	--		GroupSupport = "CORR",
	--		SupportArg = 5
	--	},
	--	["THANE"] = {
	--		DialogName = "HOUSE_THANE",
	--		RewardName = "THANE",
	--		GroupSupport = "THANE",
	--		SupportArg = 5
	--	},
		["PDF"] = {
			DialogName = "PDF",
			RewardName = "PDF"
		}
	}
}
