return {
	Ship_Crew_Requirement = 0,
	Fighters = {
		TRIFOIL_SQUADRON = {
			DEFAULT = {Initial = 2, Reserve = 99}
		},
		TIE_BOMBER_SQUADRON_DOUBLE = {
			DEFAULT = {Initial = 1, Reserve = 2}
		},
		TIE_FIGHTER_SQUADRON = {
			DEFAULT = {Initial = 1, Reserve = 2}
		},
		SKIRMISH_CR90 = {
			DEFAULT = {Initial = 2, Reserve = 2}
		},
		SKIRMISH_ACTIVE_FRIGATE = {
			DEFAULT = {Initial = 2, Reserve = 0}
		},
		SKIRMISH_ARMADIA = {
			DEFAULT = {Initial = 1, Reserve = 0}
        },
	},
    Scripts = {"fighter-spawn"},
    Flags = {SHIPYARD = true, HANGAR = true}
}