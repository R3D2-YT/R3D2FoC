return {
	Fighters = {
		["RIHKXYRK_SQUADRON_DOUBLE"] = {
			DEFAULT = {Initial = 2, Reserve = 99}
		},
		["IPV1_SYSTEM_PATROL_CRAFT"] = {
			HUTT_CARTELS = {Initial = 3, Reserve = 3}
		},
		["SKIRMISH_INTERCEPTOR_FRIGATE"] = {
			ZSINJ_EMPIRE = {Initial = 3, Reserve = 3}
		},
		["SKIRMISH_MARAUDER_MISSILE_CRUISER"] = {
			HUTT_CARTELS = {Initial = 6, Reserve = 0}
		},
		["SKIRMISH_SPACE_ARC_CRUISER"] = {
			ZSINJ_EMPIRE = {Initial = 3, Reserve = 0}
		},
		["SKIRMISH_DREADNAUGHT_LASERS"] = {
			HUTT_CARTELS = {Initial = 5, Reserve = 0}
		},
		["SKIRMISH_SUPER_TRANSPORT_XI_MODIFIED"] = {
			ZSINJ_EMPIRE = {Initial = 2, Reserve = 0}
		},
		["SKIRMISH_VENATOR_REFIT"] = {
			HUTT_CARTELS = {Initial = 3, Reserve = 0}
		}
	},
	Scripts = {"fighter-spawn"},
	Flags = {SHIPYARD = true, HANGAR = true}
}