return {
	Ship_Crew_Requirement = 0,
	Fighters = {
		TRIFOIL_SQUADRON = {
			DEFAULT = {Initial = 3, Reserve = 99}
		},
		TIE_BOMBER_SQUADRON = {
			DEFAULT = {Initial = 3, Reserve = 6}
		},
		TIE_INTERCEPTOR_SQUADRON_DOUBLE = {
			DEFAULT = {Initial = 1, Reserve = 2}
		},
		SKIRMISH_CR90 = {
			DEFAULT = {Initial = 2, Reserve = 6}
		},
		SKIRMISH_VICTORY_I_FRIGATE = {
			DEFAULT = {Initial = 3, Reserve = 0}
		},
		SKIRMISH_ARMADIA = {
			DEFAULT = {Initial = 5, Reserve = 0}
        },
		SKIRMISH_ACCLAMATOR_ASSAULT_SHIP_II = {
			DEFAULT = {Initial = 1, Reserve = 0}
		},
		SKIRMISH_GLADIATOR_TWO = {
			DEFAULT = {Initial = 2, Reserve = 0}
		},
	},
    Scripts = {"fighter-spawn"},
    Flags = {SHIPYARD = true, HANGAR = true}
}