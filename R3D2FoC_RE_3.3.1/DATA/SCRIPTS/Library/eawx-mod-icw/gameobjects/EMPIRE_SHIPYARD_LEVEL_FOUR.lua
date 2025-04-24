return {
	Fighters = {
		["TIE_INTERCEPTOR_SQUADRON"] = {
			DEFAULT = {Initial = 3, Reserve = 99, TechLevel = LessThan(4)}
		},
		["TIE_DROID_SQUADRON"] = {
			DEFAULT = {Initial = 3, Reserve = 99, TechLevel = IsOneOf({4, 5})}
		},
		["SUPER_TIE_SQUADRON"] = {
			DEFAULT = {Initial = 3, Reserve = 99, TechLevel = GreaterOrEqualTo(6)}
		},
		["TIE_AVENGER_SQUADRON"] = {
			DEFAULT = {Initial = 3, Reserve = 6, TechLevel = LessThan(6)}
		},
		["PREYBIRD_SQUADRON"] = {
			DEFAULT = {Initial = 3, Reserve = 6, TechLevel = GreaterOrEqualTo(6)}
		},
		["TIE_BOMBER_SQUADRON_DOUBLE"] = {
			DEFAULT = {Initial = 2, Reserve = 4, TechLevel = LessThan(6)}
		},
		["SCIMITAR_SQUADRON_DOUBLE"] = {
			DEFAULT = {Initial = 2, Reserve = 4, TechLevel = GreaterOrEqualTo(6)}
		},
		["SKIRMISH_IPV1"] = {
			DEFAULT = {Initial = 3, Reserve = 6, TechLevel = LessThan(6)}
		},
		["SKIRMISH_CRUSADER"] = {
			DEFAULT = {Initial = 3, Reserve = 6, TechLevel = GreaterOrEqualTo(6)}
		},
		["SKIRMISH_CARRACK_CRUISER"] = {
			DEFAULT = {Initial = 4, Reserve = 0}
		},
		["SKIRMISH_DREADNAUGHT_EMPIRE"] = {
			DEFAULT = {Initial = 2, Reserve = 0, TechLevel = LessThan(6)}
		},
		["SKIRMISH_VINDICATOR_CRUISER"] = {
			DEFAULT = {Initial = 2, Reserve = 0, TechLevel = GreaterOrEqualTo(6)}
		},
		["SKIRMISH_VICTORY_DESTROYER"] = {
			DEFAULT = {Initial = 2, Reserve = 0}
		},
		["SKIRMISH_STAR_DESTROYER"] = {
			DEFAULT = {Initial = 1, Reserve = 0}
		},
		["SKIRMISH_TECTOR"] = {
			DEFAULT = {Initial = 1, Reserve = 0}
		},
	},
	Scripts = {"fighter-spawn"},
	Flags = {SHIPYARD = true, HANGAR = true}
}