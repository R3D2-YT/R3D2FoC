return {
	Fighters = {
		["TIE_INTERCEPTOR_SQUADRON_DOUBLE"] = {
			DEFAULT = {Initial = 3, Reserve = 99, TechLevel = LessThan(4)}
		},
		["TIE_DROID_SQUADRON_DOUBLE"] = {
			DEFAULT = {Initial = 3, Reserve = 99, TechLevel = IsOneOf({4, 5})}
		},
		["SUPER_TIE_SQUADRON_DOUBLE"] = {
			DEFAULT = {Initial = 3, Reserve = 99, TechLevel = GreaterOrEqualTo(6)}
		},
		["A9_SQUADRON_DOUBLE"] = {
			DEFAULT = {Initial = 1, Reserve = 2, TechLevel = LessThan(4)}
		},
		["HOWLRUNNER_SQUADRON_DOUBLE"] = {
			DEFAULT = {Initial = 1, Reserve = 2, TechLevel = IsOneOf({4, 5})}
		},
		["PREYBIRD_SQUADRON_DOUBLE"] = {
			DEFAULT = {Initial = 1, Reserve = 2, TechLevel = GreaterOrEqualTo(6)}
		},
		["TIE_BOMBER_SQUADRON"] = {
			DEFAULT = {Initial = 3, Reserve = 6, TechLevel = LessThan(6)}
		},
		["SCIMITAR_SQUADRON"] = {
			DEFAULT = {Initial = 3, Reserve = 6, TechLevel = GreaterOrEqualTo(6)}
		},
		["SKIRMISH_IPV1"] = {
			DEFAULT = {Initial = 2, Reserve = 4, TechLevel = LessThan(3)}
		},
		["SKIRMISH_CRUSADER"] = {
			DEFAULT = {Initial = 2, Reserve = 4, TechLevel = GreaterOrEqualTo(3)}
		},
		["SKIRMISH_CARRACK_CRUISER"] = {
			DEFAULT = {Initial = 4, Reserve = 0}
		},
		["SKIRMISH_DREADNAUGHT_EMPIRE"] = {
			DEFAULT = {Initial = 2, Reserve = 0, TechLevel = LessThan(3)}
		},
		["SKIRMISH_VINDICATOR_CRUISER"] = {
			DEFAULT = {Initial = 2, Reserve = 0, TechLevel = GreaterOrEqualTo(3)}
		},
		["SKIRMISH_VICTORY_DESTROYER"] = {
			DEFAULT = {Initial = 2, Reserve = 0}
		},
	},
	Scripts = {"fighter-spawn"},
	Flags = {SHIPYARD = true, HANGAR = true}
}