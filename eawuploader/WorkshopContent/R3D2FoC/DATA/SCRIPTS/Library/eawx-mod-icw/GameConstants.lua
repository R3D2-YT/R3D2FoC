--******************************************************************************
--     _______ __
--    |_     _|  |--.----.---.-.--.--.--.-----.-----.
--      |   | |     |   _|  _  |  |  |  |     |__ --|
--      |___| |__|__|__| |___._|________|__|__|_____|
--     ______
--    |   __ \.-----.--.--.-----.-----.-----.-----.
--    |      <|  -__|  |  |  -__|     |  _  |  -__|
--    |___|__||_____|\___/|_____|__|__|___  |_____|
--                                    |_____|
--*   @Author:              [TR]Pox
--*   @Date:                2018-03-10T11:56:43+01:00
--*   @Project:             Imperial Civil War
--*   @Filename:            GameConstants.lua
--*   @Last modified by:    [TR]Pox
--*   @Last modified time:  2018-03-10T19:29:08+01:00
--*   @License:             This source code may only be used with explicit permission from the developers
--*   @Copyright:           © TR: Imperial Civil War Development Team
--******************************************************************************

GameConstants = {
    YEAR_SUFFIX = "ABY",
    YEAR_CYCLES = 12,
    START_YEAR = 4,
    PLAYABLE_FACTIONS = {
        "EMPIRE",
        "REBEL",
        "EMPIREOFTHEHAND",
        "PENTASTAR",
        "HUTT_CARTELS",
        "GREATER_MALDROOD",
        "ZSINJ_EMPIRE",
        "ERIADU_AUTHORITY",
        "CORPORATE_SECTOR",
        "HAPES_CONSORTIUM"
    },
    NONPLAYABLE_FACTIONS = {
        "WARLORDS",
        "CHISS",
        "NEUTRAL",
        "HOSTILE",
        "SSIRUUVI_IMPERIUM",
        "KILLIK_HIVES",
        "MANDALORIANS",
        "YEVETHA",
        "INDEPENDENT_FORCES",
        "UNDERWORLD",
        "CORELLIA"
    },
    ALL_FACTIONS = {
        "EMPIRE",
        "REBEL",
        "EMPIREOFTHEHAND",
        "PENTASTAR",
        "GREATER_MALDROOD",
        "ZSINJ_EMPIRE",
        "ERIADU_AUTHORITY",
        "WARLORDS",
        "CHISS",
        "CORPORATE_SECTOR",
        "NEUTRAL",
        "HOSTILE",
        "HUTT_CARTELS",
        "HAPES_CONSORTIUM",
		"SSIRUUVI_IMPERIUM",
		"KILLIK_HIVES",
		"MANDALORIANS",
		"YEVETHA",
		"INDEPENDENT_FORCES",
		"UNDERWORLD",
		"CORELLIA"
    },
    ALL_FACTIONS_CAPITALS = {
        EMPIRE = {STRUCTURE = "REMNANT_CAPITAL", LOCATION = {"CORUSCANT", "BASTION", "ORINDA", "BYSS", "THE_MAW", "ORD_CANTRELL", "FONDOR", "CIUTRIC", "BESTINE"}},
        REBEL = {STRUCTURE = "NEWREP_SENATE", LOCATION = {"CORUSCANT", "SAIJO", "MON_CALAMARI", "BOTHAWUI", "ITHOR"}},
        EMPIREOFTHEHAND = {STRUCTURE = "U_GROUND_PALACE", LOCATION =  {"NIRAUAN"}},
        UNDERWORLD = {STRUCTURE = nil, LOCATION =  {"HELSKA"}},
        PENTASTAR = {STRUCTURE = "PA_CAPITAL", LOCATION = {"ENTRALLA","BASTION"}},
        GREATER_MALDROOD = {STRUCTURE = "MALDROOD_CAPITAL", LOCATION = {"CENTARES", "HAKASSI", "RYVESTER", "THANOS"}},
        ZSINJ_EMPIRE = {STRUCTURE = "RANCOR_BASE", LOCATION = {"SERENNO", "DATHOMIR"}},
        ERIADU_AUTHORITY = {STRUCTURE = "ERIADU_CAPITAL", LOCATION = {"ERIADU", "KAMPE", "SANRAFSIX"}},
        WARLORDS = {STRUCTURE = nil, LOCATION =  {}},
		CHISS = {STRUCTURE = nil, LOCATION =  {"CSILLA"}},
        CORPORATE_SECTOR = {STRUCTURE = "CSA_CAPITAL", LOCATION = {"ETTI"}},
        HOSTILE = {STRUCTURE = nil, LOCATION =  {}},
        HUTT_CARTELS = {STRUCTURE = "HUTT_PALACE", LOCATION =  {"NAL_HUTTA"}},
        HAPES_CONSORTIUM = {STRUCTURE = "HAPAN_PALACE", LOCATION = {"HAPES"}},
		SSIRUUVI_IMPERIUM = {STRUCTURE = "CREENAAK_PALACE", LOCATION = {"LWHEKK"}},
		KILLIK_HIVES = {STRUCTURE = nil, LOCATION =  {"YOGGOY"}},
		MANDALORIANS = {STRUCTURE = nil, LOCATION =  {"MANDALORE"}},
		YEVETHA = {STRUCTURE = nil, LOCATION =  {"NZOTH"}},
		INDEPENDENT_FORCES = {STRUCTURE = nil, LOCATION =  {}},
		CORELLIA = {STRUCTURE = nil, LOCATION =  {"CORELLIA"}}
    },
    ALL_FACTIONS_BASIC_STRUCTURES = {
        EMPIRE = {"EMPIRE_STAR_BASE_1","EMPIRE_MOFFPALACE"},
        REBEL = {"NEWREPUBLIC_STAR_BASE_1","NEWREP_SENATORSOFFICE"},
        EMPIREOFTHEHAND = {"BRASK_STARBASE","HAND_GOVERNOROFFICE"},
        UNDERWORLD = {},
        PENTASTAR = {"EMPIRE_STAR_BASE_1","PENTASTAR_MOFFPALACE"},
        GREATER_MALDROOD = {"EMPIRE_STAR_BASE_1","MALDROOD_MOFFPALACE"},
        ZSINJ_EMPIRE = {"EMPIRE_STAR_BASE_1","ZSINJ_MOFFPALACE"},
        ERIADU_AUTHORITY = {"EMPIRE_STAR_BASE_1","ERIADU_MOFFPALACE"},
        WARLORDS = {"EMPIRE_STAR_BASE_1","EMPIRE_MOFFPALACE"},
		CHISS = {"BRASK_STARBASE","REVOLT_PDF_HQ"},
        CORPORATE_SECTOR = {"CSA_STAR_BASE_1","CSA_LOCALOFFICE"},
        HOSTILE = {},
        HUTT_CARTELS = {"HUTT_STAR_BASE_1","HUTT_LOCALOFFICE"},
        HAPES_CONSORTIUM = {"HAPAN_STAR_BASE_1","HOUSE_ROYAL"},
		SSIRUUVI_IMPERIUM = {"EMPIRE_STAR_BASE_1","SSIRUUVI_PALACE"},
		KILLIK_HIVES = {"BRASK_STARBASE","REVOLT_PDF_HQ"},
		MANDALORIANS = {"EMPIRE_STAR_BASE_1","REVOLT_PDF_HQ"},
		YEVETHA = {"EMPIRE_STAR_BASE_1","REVOLT_PDF_HQ"},
		INDEPENDENT_FORCES = {"EMPIRE_STAR_BASE_1","REVOLT_PDF_HQ"},
		CORELLIA = {"NEWREPUBLIC_STAR_BASE_1","REVOLT_PDF_HQ"},
    },
    ALL_FACTIONS_AI = {
        EMPIRE = "RemnantAI",
        REBEL = "GenericAI",
        EMPIREOFTHEHAND = "EotHAI",
        UNDERWORLD = "GenericAI",
        PENTASTAR = "PentastarAI",
        GREATER_MALDROOD = "WarlordAI",
        ZSINJ_EMPIRE = "ZsinjAI",
        ERIADU_AUTHORITY = "EriaduAI",
        WARLORDS = "None",
		CHISS = "None",
        CORPORATE_SECTOR = "CorporateAI",
        HOSTILE = "None",
        HUTT_CARTELS = "HuttAI",
        HAPES_CONSORTIUM = "GenericAI",
		SSIRUUVI_IMPERIUM = "None",
		KILLIK_HIVES = "None",
		MANDALORIANS = "None",
		YEVETHA = "None",
		INDEPENDENT_FORCES = "None",
		CORELLIA = "None"
    },
    ALL_FACTIONS_CRUEL_AI = {
        EMPIRE = "RemnantSkynetAI",
        REBEL = "SkynetAI",
        UNDERWORLD = "SkynetAI",
        EMPIREOFTHEHAND = "SkynetAI",
        PENTASTAR = "PentastarSkynetAI",
        GREATER_MALDROOD = "SkynetAI",
        ZSINJ_EMPIRE = "ZsinjSkynetAI",
        ERIADU_AUTHORITY = "EriaduSkynetAI",
        WARLORDS = "None",
		CHISS = "None",
        CORPORATE_SECTOR = "SkynetAI",
        HOSTILE = "None",
        HUTT_CARTELS = "SkynetAI",
        HAPES_CONSORTIUM = "SkynetAI",
		SSIRUUVI_IMPERIUM = "None",
		KILLIK_HIVES = "None",
		MANDALORIANS = "None",
		YEVETHA = "None",
		INDEPENDENT_FORCES = "None",
		CORELLIA = "None"
    },
    ALL_FACTIONS_NOT_NEUTRAL = {
        "EMPIRE",
        "REBEL",
        "EMPIREOFTHEHAND",
        "PENTASTAR",
        "GREATER_MALDROOD",
        "ZSINJ_EMPIRE",
        "ERIADU_AUTHORITY",
        "WARLORDS",
        "CORPORATE_SECTOR",
        "CHISS",
        "HUTT_CARTELS",
        "HAPES_CONSORTIUM",
		"SSIRUUVI_IMPERIUM",
		"KILLIK_HIVES",
		"MANDALORIANS",
		"YEVETHA",
		"INDEPENDENT_FORCES",
		"UNDERWORLD",
		"CORELLIA"
    },
    ALL_FACTION_TEXTS = {
        EMPIRE = "TEXT_FACTION_EMPIRE",
        REBEL = "TEXT_FACTION_REBELS",
        EMPIREOFTHEHAND = "TEXT_FACTION_EOTH",
        PENTASTAR = "TEXT_FACTION_PENTASTAR",
        GREATER_MALDROOD = "TEXT_FACTION_TERADOC",
        ZSINJ_EMPIRE = "TEXT_FACTION_ZSINJ",
        ERIADU_AUTHORITY = "TEXT_FACTION_DELVARDUS",
        WARLORDS = "TEXT_FACTION_WARLORDS",
        CORPORATE_SECTOR = "TEXT_FACTION_CSA",
        NEUTRAL = "TEXT_FACTION_NEUTRAL",
        HOSTILE = "TEXT_FACTION_HOSTILE",
        HUTT_CARTELS = "TEXT_FACTION_HUTTS",
        HAPES_CONSORTIUM = "TEXT_FACTION_HAPES",
        CHISS = "TEXT_FACTION_CHISS",
		SSIRUUVI_IMPERIUM = "TEXT_FACTION_SSIRUUVI",
		KILLIK_HIVES = "TEXT_FACTION_KILLIK_HIVES",
		MANDALORIANS = "TEXT_FACTION_MANDALORIANS",
		YEVETHA = "TEXT_FACTION_YEVETHA",
		INDEPENDENT_FORCES = "TEXT_FACTION_INDEPENDENT_FORCES",
		UNDERWORLD = "TEXT_FACTION_VONG",
		CORELLIA = "TEXT_FACTION_CORELLIA"
    },
    FACTION_COLORS = {
		["EMPIRE"] = {r = 8, g = 122, b = 16},
		["REBEL"] = {r = 239, g = 139, b = 9},
		["EMPIREOFTHEHAND"] = {r = 102, g = 188, b = 217},
		["CHISS"] = {r = 248, g = 236, b = 96},
		["PENTASTAR"] = {r = 55, g = 64, b = 184},
		["GREATER_MALDROOD"] = {r = 255, g = 20, b = 50},
		["ZSINJ_EMPIRE"] = {r = 148, g = 133, b = 60},
		["ERIADU_AUTHORITY"] = {r = 133, g = 253, b = 186},
		["WARLORDS"] = {r = 243, g = 243, b = 243},
		["CORPORATE_SECTOR"] = {r = 176, g = 124, b = 172},
		["HAPES_CONSORTIUM"] = {r = 212, g = 81, b = 255},
		["SSIRUUVI_IMPERIUM"] = {r = 249, g = 83, b = 155},
		["NEUTRAL"] = {r = 100, g = 100, b = 100},
		["HOSTILE"] = {r = 243, g = 243, b = 243},
		["HUTT_CARTELS"] = {r = 142, g = 195, b = 0},
		["KILLIK_HIVES"] = {r = 132, g = 81, b = 255},
		["MANDALORIANS"] = {r = 247, g = 201, b = 13},
		["YEVETHA"] = {r = 237, g = 113, b = 108},
		["INDEPENDENT_FORCES"] = {r = 243, g = 243, b = 243},
		["UNDERWORLD"] = {r = 229, g = 183, b = 156},
		["CORELLIA"] = {r = 66, g = 179, b = 160},
    },
    ALL_FACTION_NAMES = {
        EMPIRE = "Galactic Empire",
        REBEL = "New Republic",
        EMPIREOFTHEHAND = "Empire of the Hand",
        PENTASTAR = "Pentastar Alignment",
        GREATER_MALDROOD = "Greater Maldrood",
        ZSINJ_EMPIRE = "Zsinj's Empire",
        ERIADU_AUTHORITY = "Eriadu Authority",
        WARLORDS = "Minor Warlords",
        CORPORATE_SECTOR = "Corporate Sector Authority",
        NEUTRAL = "Neutral",
        HOSTILE = "Hostile",
        HUTT_CARTELS = "Hutt Cartels",
        HAPES_CONSORTIUM = "Hapes Consortium",
        CHISS = "Chiss Ascendancy",
		SSIRUUVI_IMPERIUM = "Ssi-Ruuvi Imperium",
		KILLIK_HIVES = "Killik Hives",
		MANDALORIANS = "Mandalorian Clans",
		YEVETHA = "Duskhan League",
		INDEPENDENT_FORCES = "Independent Forces",
		UNDERWORLD = "Yuuzhan Vong",
		CORELLIA = "Corellians"
    },
    ALIASES = {
        EMPIRE = "IMPERIAL",
        PENTASTAR = "IMPERIAL",
        GREATER_MALDROOD = "IMPERIAL",
        ZSINJ_EMPIRE = "IMPERIAL",
        ERIADU_AUTHORITY = "IMPERIAL",
		WARLORDS = "IMPERIAL",
		CHISS = "EMPIREOFTHEHAND", --Stopgap
		SSIRUUVI_IMPERIUM = "INDEPENDENT_FORCES", --Stopgap
		KILLIK_HIVES = "INDEPENDENT_FORCES", --Stopgap
		MANDALORIANS = "INDEPENDENT_FORCES", --Stopgap
		CORELLIA = "INDEPENDENT_FORCES", --Stopgap
		YEVETHA = "IMPERIAL", --Stopgap, probably
    },
	TRANSPORTS = {
		["EMPIRE"] = "Imperial_Landing_Craft_Landing",
        ["REBEL"] = "Gallofree_Transport_Landing",
        ["EMPIREOFTHEHAND"] = "Imperial_Landing_Craft_Landing",
        ["CHISS"] = "Imperial_Landing_Craft_Landing",
        ["PENTASTAR"] = "Imperial_Landing_Craft_Landing",
        ["GREATER_MALDROOD"] = "Imperial_Landing_Craft_Landing",
        ["ZSINJ_EMPIRE"] = "Imperial_Landing_Craft_Landing",
        ["ERIADU_AUTHORITY"] = "Imperial_Landing_Craft_Landing",
        ["WARLORDS"] = "Imperial_Landing_Craft_Landing",
        ["CORPORATE_SECTOR"] = "Gallofree_Transport_Landing",
		["HUTT_CARTELS"] = "Gallofree_Transport_Landing",
        ["HAPES_CONSORTIUM"] = "Gallofree_Transport_Landing",
		["SSIRUUVI_IMPERIUM"] = "Gallofree_Transport_Landing",
		["KILLIK_HIVES"] = "Gallofree_Transport_Landing",
		["MANDALORIANS"] = "Gallofree_Transport_Landing",
		["YEVETHA"] = "Imperial_Landing_Craft_Landing",
		["INDEPENDENT_FORCES"] = "Gallofree_Transport_Landing",
		["UNDERWORLD"] = "Gallofree_Transport_Landing",
		["CORELLIA"] = "Gallofree_Transport_Landing",
	},
	FTGU_HUMAN_START_FORCES = {
		["EMPIRE"] = {
			["ERA_1"] = {
				"Empire_MoffPalace","Tax_Agency","E_Ground_Barracks","E_Ground_Light_Vehicle_Factory",
				"Imperial_Army_Trooper_Squad","Imperial_Army_Trooper_Squad","Imperial_Stormtrooper_Squad","Imperial_AT_ST_Company",
				"Imperial_AT_ST_Company","Imperial_Chariot_LAV_Company","Imperial_S_1_Firehawke_Company","Imperial_A5_Juggernaut_Company","Imperial_AT_AT_Company",
				"Beta_ETR_3_Squadron","Beta_ETR_3_Squadron","IPV1_System_Patrol_Craft","IPV1_System_Patrol_Craft","Carrack_Cruiser","Escort_Carrier","Dreadnaught_Empire","Eidolon","Generic_Acclamator_Assault_Ship_II","Generic_Victory_Destroyer"
			},
			["ERA_2"] = {
				"Empire_MoffPalace","Tax_Agency","E_Ground_Barracks","E_Ground_Light_Vehicle_Factory",
				"Imperial_Army_Trooper_Squad","Imperial_Army_Trooper_Squad","Imperial_Stormtrooper_Squad","Imperial_AT_ST_Company",
				"Imperial_AT_ST_Company","Imperial_Chariot_LAV_Company","Imperial_S_1_Firehawke_Company","Imperial_A5_Juggernaut_Company","Imperial_AT_AT_Company",
				"Beta_ETR_3_Squadron","Beta_ETR_3_Squadron","IPV1_System_Patrol_Craft","IPV1_System_Patrol_Craft","Lancer_Frigate","Carrack_Cruiser","Escort_Carrier","Dreadnaught_Empire","Strike_Cruiser","Generic_Acclamator_Assault_Ship_II","Generic_Victory_Destroyer"
			},
			["ERA_3"] = {
				"Empire_MoffPalace","Tax_Agency","E_Ground_Barracks","E_Ground_Light_Vehicle_Factory",
				"Imperial_Army_Trooper_Squad","Imperial_Army_Trooper_Squad","Imperial_Stormtrooper_Squad","Imperial_AT_ST_Company",
				"Imperial_AT_ST_Company","Imperial_Chariot_LAV_Company","Imperial_S_1_Firehawke_Company","Imperial_A5_Juggernaut_Company","Imperial_AT_AT_Company",
				"Beta_ETR_3_Squadron","Beta_ETR_3_Squadron","IPV1_System_Patrol_Craft","Star_Galleon","Carrack_Cruiser","Escort_Carrier","Dreadnaught_Empire","Strike_Cruiser","Generic_Acclamator_Assault_Ship_II","Generic_Victory_Destroyer"
			},
			["ERA_4"] = {
				"Empire_MoffPalace","Tax_Agency","E_Ground_Barracks","E_Ground_Light_Vehicle_Factory",
				"Imperial_Army_Trooper_Squad","Imperial_Compforce_Assault_Squad","Imperial_Stormtrooper_Squad","Imperial_AT_ST_Company",
				"Imperial_AT_ST_A_Company","Imperial_Chariot_LAV_Company","Imperial_S_1_Firehawke_Company","Imperial_AT_AT_Company","Imperial_XR85_Company",
				"Beta_ETR_3_Squadron","Beta_ETR_3_Squadron","IPV1_System_Patrol_Craft","IPV1_System_Patrol_Craft","Hunter_Killer_Probot","Carrack_Cruiser","Escort_Carrier","Dreadnaught_Empire","Strike_Cruiser","MTC_Sensor","Generic_Victory_Destroyer"
			},
			["ERA_5"] = {
				"Empire_MoffPalace","Tax_Agency","E_Ground_Barracks","E_Ground_Light_Vehicle_Factory",
				"Imperial_Army_Trooper_Squad","Imperial_Army_Trooper_Squad","Imperial_Stormtrooper_Squad","Imperial_AT_ST_Company",
				"Imperial_AT_ST_A_Company","Imperial_Chariot_LAV_Company","Imperial_S_1_Firehawke_Company","Imperial_A5_Juggernaut_Company","Imperial_AT_AT_Company",
				"Beta_ETR_3_Squadron","Delta_JV7_Squadron","IPV1_System_Patrol_Craft","IPV1_System_Patrol_Craft","Lancer_Frigate","Carrack_Cruiser","Escort_Carrier","Dreadnaught_Empire","Strike_Cruiser","Generic_Acclamator_Assault_Ship_II","Generic_Victory_Destroyer"
			},
			["ERA_6"] = {
				"Empire_MoffPalace","Tax_Agency","E_Ground_Barracks","E_Ground_Light_Vehicle_Factory",
				"Imperial_Army_Trooper_Squad","Imperial_Army_Trooper_Squad","Imperial_Stormtrooper_Squad","Imperial_AT_ST_Company",
				"Imperial_AT_ST_A_Company","Imperial_Dwarf_Spider_Droid_Company","Imperial_S_1_Firehawke_Company","Imperial_A5_Juggernaut_Company","Imperial_AT_AT_Company",
				"Beta_ETR_3_Squadron","Beta_ETR_3_Squadron","Crusader_Gunship","Nebulon_B_Empire","Carrack_Cruiser","Escort_Carrier","Dreadnaught_Empire","Strike_Cruiser","Generic_Acclamator_Assault_Ship_II","Generic_Victory_Destroyer"
			},
			["ERA_7"] = {
				"Empire_MoffPalace","Tax_Agency","E_Ground_Barracks","E_Ground_Light_Vehicle_Factory",
				"Imperial_Army_Trooper_Squad","Imperial_Army_Trooper_Squad","Imperial_Stormtrooper_Squad","Imperial_AT_ST_Company",
				"Imperial_AT_ST_A_Company","Imperial_Dwarf_Spider_Droid_Company","Imperial_S_1_Firehawke_Company","Imperial_A5_Juggernaut_Company","Imperial_AT_AT_Company",
				"Beta_ETR_3_Squadron","Beta_ETR_3_Squadron","Crusader_Gunship","Nebulon_B_Empire","Carrack_Cruiser","Escort_Carrier","Dreadnaught_Empire","Strike_Cruiser","Generic_Acclamator_Assault_Ship_II","Generic_Victory_Destroyer"
			},
		},
		["REBEL"] = {
			["ERA_1"] = {
				"NewRep_SenatorsOffice","Tax_Agency","R_Ground_Barracks","R_Ground_Light_Vehicle_Factory",
				"Rebel_Infantry_Squad","Rebel_Infantry_Squad","Rebel_Infiltrator_Squad","Rebel_AAC_2_Company",
				"Rebel_SRV1_Company","Rebel_T3B_Company","Rebel_Snowspeeder_Wing","Rebel_T4B_Company","MAS_2xB_Company",
				"Corellian_Corvette","Corellian_Corvette","Corellian_Gunboat","Corellian_Gunboat","Nebulon_B_Frigate","Quasar","MC30a","MC40a","Alliance_Assault_Frigate_II","Dauntless"
			},
			["ERA_2"] = {
				"NewRep_SenatorsOffice","Tax_Agency","R_Ground_Barracks","R_Ground_Light_Vehicle_Factory",
				"Rebel_Infantry_Squad","Rebel_Infantry_Squad","Rebel_Infiltrator_Squad","Rebel_AAC_2_Company",
				"Rebel_SRV1_Company","Rebel_T3B_Company","Rebel_Snowspeeder_Wing","Rebel_T4B_Company","MAS_2xB_Company",
				"Corellian_Corvette","Corellian_Corvette","Corellian_Gunboat","Corellian_Gunboat","Nebulon_B_Frigate","Quasar","MC30a","MC40a","Alliance_Assault_Frigate_II","Dauntless"
			},
			["ERA_3"] = {
				"NewRep_SenatorsOffice","Tax_Agency","R_Ground_Barracks","R_Ground_Light_Vehicle_Factory",
				"Rebel_Infantry_Squad","Rebel_Infantry_Squad","Rebel_Infiltrator_Squad","Rebel_AAC_2_Company",
				"Rebel_SRV1_Company","Rebel_T3B_Company","Rebel_Snowspeeder_Wing","Rebel_T4B_Company","MAS_2xB_Company",
				"Corellian_Corvette","Corellian_Corvette","Corellian_Gunboat","Corellian_Gunboat","Nebulon_B_Frigate","Quasar","MC30a","MC40a","Alliance_Assault_Frigate_II","Dauntless"
			},
			["ERA_4"] = {
				"NewRep_SenatorsOffice","Tax_Agency","R_Ground_Barracks","R_Ground_Light_Vehicle_Factory",
				"Rebel_Infantry_Squad","Defense_Trooper_Squad","Rebel_Infiltrator_Squad","Rebel_AAC_2_Company",
				"Rebel_SRV1_Company","Rebel_T3B_Company","Rebel_Vwing_Group","Rebel_T4B_Company","MAS_2xB_Company",
				"Corellian_Corvette","Corellian_Corvette","Corellian_Gunboat","Corona","Quasar","MC30a","Belarus","Alliance_Assault_Frigate_II","Dauntless"
			},
			["ERA_5"] = {
				"NewRep_SenatorsOffice","Tax_Agency","R_Ground_Barracks","R_Ground_Light_Vehicle_Factory",
				"Rebel_Infantry_Squad","Defense_Trooper_Squad","Rebel_Infiltrator_Squad","Rebel_AAC_2_Company",
				"Rebel_SRV1_Company","Rebel_T3B_Company","Rebel_Vwing_Group","Rebel_T4B_Company","MAS_2xB_Company",
				"Corellian_Corvette","Corellian_Corvette","Corellian_Gunboat","Corona","Quasar","MC30a","Belarus","Alliance_Assault_Frigate_II","Dauntless"
			},
			["ERA_6"] = {
				"NewRep_SenatorsOffice","Tax_Agency","R_Ground_Barracks","R_Ground_Light_Vehicle_Factory",
				"Rebel_Infantry_Squad","Defense_Trooper_Squad","Rebel_Infiltrator_Squad","Rebel_AAC_2_Company",
				"Rebel_SRV1_Company","Rebel_T3B_Company","Rebel_Vwing_Group","Rebel_T4B_Company","MAS_2xB_Company",
				"Corellian_Corvette","Corellian_Corvette","Corellian_Gunboat","Corona","Quasar","MC30a","Belarus","Alliance_Assault_Frigate_II","Dauntless"
			},
			["ERA_7"] = {
				"NewRep_SenatorsOffice","Tax_Agency","R_Ground_Barracks","R_Ground_Light_Vehicle_Factory",
				"Rebel_Infantry_Squad","Defense_Trooper_Squad","Rebel_Infiltrator_Squad","Rebel_AAC_2_Company",
				"Rebel_SRV1_Company","Rebel_T3B_Company","Rebel_Vwing_Group","Rebel_T4B_Company","MAS_2xB_Company",
				"Agave_Corvette","Agave_Corvette","Warrior_Gunship","Warrior_Gunship","Corona","Quasar","MC30a","Alliance_Assault_Frigate_II","Defender_Carrier","Majestic"
			},
		},
		["EMPIREOFTHEHAND"] = {
			["ERA_1"] = {
				"Hand_GovernorOffice","Tax_Agency","U_Ground_Barracks","U_Ground_Vehicle_Factory","U_Ground_Droid_Works",
				"Phalanx_Trooper_Squad","Phalanx_Trooper_Squad","EotH_Kirov_Brigade","EotH_Kirov_Brigade",
				"Flame_Tank_Company","Flame_Tank_Company","AirStraeker_Company","Gilzean_Brigade","MMT_Brigade",
				"Muqaraea","Muqaraea","Kuuro","Kuuro","Syzygos","Fruoro","Ormos","Rohkea","Kynigos","Kynigos","Chaf_Destroyer"
			},
			["ERA_2"] = {
				"Hand_GovernorOffice","Tax_Agency","U_Ground_Barracks","U_Ground_Vehicle_Factory","U_Ground_Droid_Works",
				"Phalanx_Trooper_Squad","Phalanx_Trooper_Squad","EotH_Kirov_Brigade","EotH_Kirov_Brigade",
				"Flame_Tank_Company","Flame_Tank_Company","AirStraeker_Company","Gilzean_Brigade","MMT_Brigade",
				"Muqaraea","Muqaraea","Kuuro","Kuuro","Syzygos","Fruoro","Ormos","Rohkea","Kynigos","Kynigos","Chaf_Destroyer"
			},
			["ERA_3"] = {
				"Hand_GovernorOffice","Tax_Agency","U_Ground_Barracks","U_Ground_Vehicle_Factory","U_Ground_Droid_Works",
				"Phalanx_Trooper_Squad","Phalanx_Trooper_Squad","EotH_Kirov_Brigade","EotH_Kirov_Brigade",
				"Flame_Tank_Company","Flame_Tank_Company","AirStraeker_Company","Gilzean_Brigade","MMT_Brigade",
				"Muqaraea","Muqaraea","Kuuro","Kuuro","Syzygos","Fruoro","Ormos","Rohkea","Kynigos","Kynigos","Chaf_Destroyer"
			},
			["ERA_4"] = {
				"Hand_GovernorOffice","Tax_Agency","U_Ground_Barracks","U_Ground_Vehicle_Factory","U_Ground_Droid_Works",
				"Phalanx_Trooper_Squad","Phalanx_Trooper_Squad","EotH_Kirov_Brigade","EotH_Kirov_Brigade",
				"Flame_Tank_Company","Flame_Tank_Company","AirStraeker_Company","Gilzean_Brigade","MMT_Brigade",
				"Muqaraea","Muqaraea","Kuuro","Kuuro","Syzygos","Fruoro","Ormos","Rohkea","Kynigos","Kynigos","Chaf_Destroyer"
			},
			["ERA_5"] = {
				"Hand_GovernorOffice","Tax_Agency","U_Ground_Barracks","U_Ground_Vehicle_Factory","U_Ground_Droid_Works",
				"Phalanx_Trooper_Squad","Phalanx_Trooper_Squad","EotH_Kirov_Brigade","EotH_Kirov_Brigade",
				"Flame_Tank_Company","Flame_Tank_Company","AirStraeker_Company","Gilzean_Brigade","MMT_Brigade",
				"Muqaraea","Muqaraea","Kuuro","Kuuro","Syzygos","Fruoro","Ormos","Rohkea","Kynigos","Kynigos","Chaf_Destroyer"
			},
			["ERA_6"] = {
				"Hand_GovernorOffice","Tax_Agency","U_Ground_Barracks","U_Ground_Vehicle_Factory","U_Ground_Droid_Works",
				"Phalanx_Trooper_Squad","Phalanx_Trooper_Squad","EotH_Kirov_Brigade","EotH_Kirov_Brigade",
				"Flame_Tank_Company","Flame_Tank_Company","AirStraeker_Company","Gilzean_Brigade","MMT_Brigade",
				"Muqaraea","Muqaraea","Kuuro","Kuuro","Syzygos","Fruoro","Ormos","Rohkea","Kynigos","Kynigos","Chaf_Destroyer"
			},
			["ERA_7"] = {
				"Hand_GovernorOffice","Tax_Agency","U_Ground_Barracks","U_Ground_Vehicle_Factory","U_Ground_Droid_Works",
				"Phalanx_Trooper_Squad","Phalanx_Trooper_Squad","EotH_Kirov_Brigade","EotH_Kirov_Brigade",
				"Flame_Tank_Company","Flame_Tank_Company","AirStraeker_Company","Gilzean_Brigade","MMT_Brigade",
				"Muqaraea","Muqaraea","Kuuro","Kuuro","Syzygos","Fruoro","Ormos","Rohkea","Kynigos","Kynigos","Chaf_Destroyer"
			},
		},
		["PENTASTAR"] = {
			["ERA_1"] = {
				"Pentastar_MoffPalace","Tax_Agency","P_Ground_Barracks","P_Ground_Light_Vehicle_Factory","P_Ground_Heavy_Vehicle_Factory",
				"Pentastar_Enforcer_Trooper_Squad","Pentastar_Enforcer_Trooper_Squad","Imperial_Stormtrooper_Squad","Imperial_AT_DP_Company",
				"Imperial_AT_DP_Company","Imperial_TIE_Mauler_Company","Imperial_Century_Tank_Company","Imperial_Nemesis_Gunship_Group","Imperial_C10_Siege_Tower_Company",
				"Decimator_Squadron","Decimator_Squadron","Decimator_Squadron","Raider_Corvette","Raider_Corvette","Corellian_Buccaneer","Corellian_Buccaneer","Trenchant","Trenchant","Escort_Carrier","Victory_II_Frigate","Enforcer","Generic_Procursator"
			},
			["ERA_2"] = {
				"Empire_MoffPalace","Tax_Agency","P_Ground_Barracks","P_Ground_Light_Vehicle_Factory","P_Ground_Heavy_Vehicle_Factory",
				"Pentastar_Enforcer_Trooper_Squad","Pentastar_Enforcer_Trooper_Squad","Imperial_Stormtrooper_Squad","Imperial_AT_DP_Company",
				"Imperial_AT_DP_Company","Imperial_TIE_Mauler_Company","Imperial_Century_Tank_Company","Imperial_Nemesis_Gunship_Group","Imperial_C10_Siege_Tower_Company",
				"Decimator_Squadron","Decimator_Squadron","Decimator_Squadron","Raider_Corvette","Raider_Corvette","Corellian_Buccaneer","Corellian_Buccaneer","Trenchant","Trenchant","Escort_Carrier","Victory_II_Frigate","Enforcer","Generic_Procursator"
			},
			["ERA_3"] = {
				"Empire_MoffPalace","Tax_Agency","P_Ground_Barracks","P_Ground_Light_Vehicle_Factory","P_Ground_Heavy_Vehicle_Factory",
				"Pentastar_Enforcer_Trooper_Squad","Pentastar_Enforcer_Trooper_Squad","Imperial_Stormtrooper_Squad","Imperial_AT_DP_Company",
				"Imperial_AT_DP_Company","Imperial_TIE_Mauler_Company","Imperial_Century_Tank_Company","Imperial_Nemesis_Gunship_Group","Imperial_C10_Siege_Tower_Company",
				"Decimator_Squadron","Decimator_Squadron","Decimator_Squadron","Raider_Corvette","Raider_Corvette","Corellian_Buccaneer","Corellian_Buccaneer","Trenchant","Trenchant","Escort_Carrier","Victory_II_Frigate","Enforcer","Generic_Procursator"
			},
			["ERA_4"] = {
				"Empire_MoffPalace","Tax_Agency","P_Ground_Barracks","P_Ground_Light_Vehicle_Factory","P_Ground_Heavy_Vehicle_Factory",
				"Pentastar_Enforcer_Trooper_Squad","Pentastar_Enforcer_Trooper_Squad","Imperial_Stormtrooper_Squad","Imperial_AT_DP_Company",
				"Imperial_AT_DP_Company","Imperial_TIE_Mauler_Company","Imperial_Century_Tank_Company","Imperial_Nemesis_Gunship_Group","Imperial_C10_Siege_Tower_Company",
				"Decimator_Squadron","Decimator_Squadron","Decimator_Squadron","Raider_Corvette","Raider_Corvette","Corellian_Buccaneer","Corellian_Buccaneer","Trenchant","Trenchant","Escort_Carrier","Victory_II_Frigate","Enforcer","Generic_Procursator"
			},
			["ERA_5"] = {
				"Empire_MoffPalace","Tax_Agency","P_Ground_Barracks","P_Ground_Light_Vehicle_Factory","P_Ground_Heavy_Vehicle_Factory",
				"Pentastar_Enforcer_Trooper_Squad","Pentastar_Enforcer_Trooper_Squad","Imperial_Stormtrooper_Squad","Imperial_AT_DP_Company",
				"Imperial_AT_DP_Company","Imperial_TIE_Mauler_Company","Imperial_Century_Tank_Company","Imperial_Nemesis_Gunship_Group","Imperial_C10_Siege_Tower_Company",
				"Decimator_Squadron","Decimator_Squadron","Decimator_Squadron","Raider_Corvette","Raider_Corvette","Corellian_Buccaneer","Corellian_Buccaneer","Trenchant","Trenchant","Escort_Carrier","Victory_II_Frigate","Enforcer","Generic_Procursator"
			},
			["ERA_6"] = {
				"Empire_MoffPalace","Tax_Agency","P_Ground_Barracks","P_Ground_Light_Vehicle_Factory","P_Ground_Heavy_Vehicle_Factory",
				"Pentastar_Enforcer_Trooper_Squad","Pentastar_Enforcer_Trooper_Squad","Imperial_Stormtrooper_Squad","Imperial_AT_DP_Company",
				"Imperial_AT_DP_Company","Imperial_TIE_Mauler_Company","Imperial_Century_Tank_Company","Imperial_Nemesis_Gunship_Group","Imperial_C10_Siege_Tower_Company",
				"Decimator_Squadron","Decimator_Squadron","Decimator_Squadron","Raider_Corvette","Raider_Corvette","Corellian_Buccaneer","Corellian_Buccaneer","Trenchant","Trenchant","Escort_Carrier","Victory_II_Frigate","Enforcer","Generic_Procursator"
			},
			["ERA_7"] = {
				"Empire_MoffPalace","Tax_Agency","P_Ground_Barracks","P_Ground_Light_Vehicle_Factory","P_Ground_Heavy_Vehicle_Factory",
				"Pentastar_Enforcer_Trooper_Squad","Pentastar_Enforcer_Trooper_Squad","Imperial_Stormtrooper_Squad","Imperial_AT_DP_Company",
				"Imperial_AT_DP_Company","Imperial_TIE_Mauler_Company","Imperial_Century_Tank_Company","Imperial_Nemesis_Gunship_Group","Imperial_C10_Siege_Tower_Company",
				"Decimator_Squadron","Decimator_Squadron","Decimator_Squadron","Raider_Corvette","Raider_Corvette","Corellian_Buccaneer","Corellian_Buccaneer","Trenchant","Trenchant","Escort_Carrier","Victory_II_Frigate","Enforcer","Generic_Procursator"
			},
		},
		["HUTT_CARTELS"] = {
			["ERA_1"] = {
				"Hutt_LocalOffice","Smuggler_Cantina","H_Ground_Barracks","H_Ground_Light_Vehicle_Factory",
				"Hutt_Guard_Squad","Hutt_Gamorrean_Guard_Squad","Hutt_Armored_Platoon","Hutt_Desert_Sail20_Company",
				"Hutt_Bantha_II_Skiff_Company","Hutt_SuperHaul_II_Skiff_Company","Hutt_AST5_Company","Hutt_Pod_Walker_Company","WLO5_Tank_Company",
				"Warlord_Cruiser","Warlord_Cruiser","Heavy_Minstrel_Yacht","Ubrikkian_Frigate","Kaloth_Battlecruiser","Juvard_Frigate","Barabbula_Frigate","Kossak_Frigate","Ubrikkian_Cruiser_GCW","Szajin_Cruiser","Karagga_Destroyer"
			},
			["ERA_2"] = {
				"Hutt_LocalOffice","Smuggler_Cantina","H_Ground_Barracks","H_Ground_Light_Vehicle_Factory",
				"Hutt_Guard_Squad","Hutt_Gamorrean_Guard_Squad","Hutt_Armored_Platoon","Hutt_Desert_Sail20_Company",
				"Hutt_Bantha_II_Skiff_Company","Hutt_SuperHaul_II_Skiff_Company","Hutt_AST5_Company","Hutt_Pod_Walker_Company","WLO5_Tank_Company",
				"Warlord_Cruiser","Warlord_Cruiser","Heavy_Minstrel_Yacht","Ubrikkian_Frigate","Kaloth_Battlecruiser","Juvard_Frigate","Barabbula_Frigate","Kossak_Frigate","Ubrikkian_Cruiser_GCW","Szajin_Cruiser","Karagga_Destroyer"
			},
			["ERA_3"] = {
				"Hutt_LocalOffice","Smuggler_Cantina","H_Ground_Barracks","H_Ground_Light_Vehicle_Factory",
				"Hutt_Guard_Squad","Hutt_Gamorrean_Guard_Squad","Hutt_Armored_Platoon","Hutt_Desert_Sail20_Company",
				"Hutt_Bantha_II_Skiff_Company","Hutt_SuperHaul_II_Skiff_Company","Hutt_AST5_Company","Hutt_Pod_Walker_Company","WLO5_Tank_Company",
				"Warlord_Cruiser","Warlord_Cruiser","Heavy_Minstrel_Yacht","Ubrikkian_Frigate","Kaloth_Battlecruiser","Juvard_Frigate","Barabbula_Frigate","Kossak_Frigate","Ubrikkian_Cruiser_GCW","Szajin_Cruiser","Karagga_Destroyer"
			},
			["ERA_4"] = {
				"Hutt_LocalOffice","Smuggler_Cantina","H_Ground_Barracks","H_Ground_Light_Vehicle_Factory",
				"Hutt_Guard_Squad","Hutt_Gamorrean_Guard_Squad","Hutt_Armored_Platoon","Hutt_Desert_Sail20_Company",
				"Hutt_Bantha_II_Skiff_Company","Hutt_SuperHaul_II_Skiff_Company","Hutt_AST5_Company","Hutt_Pod_Walker_Company","WLO5_Tank_Company",
				"Warlord_Cruiser","Warlord_Cruiser","Heavy_Minstrel_Yacht","Ubrikkian_Frigate","Kaloth_Battlecruiser","Juvard_Frigate","Barabbula_Frigate","Kossak_Frigate","Ubrikkian_Cruiser_GCW","Szajin_Cruiser","Karagga_Destroyer"
			},
			["ERA_5"] = {
				"Hutt_LocalOffice","Smuggler_Cantina","H_Ground_Barracks","H_Ground_Light_Vehicle_Factory",
				"Hutt_Guard_Squad","Hutt_Gamorrean_Guard_Squad","Hutt_Armored_Platoon","Hutt_Desert_Sail20_Company",
				"Hutt_Bantha_II_Skiff_Company","Hutt_SuperHaul_II_Skiff_Company","Hutt_AST5_Company","Hutt_Pod_Walker_Company","WLO5_Tank_Company",
				"Warlord_Cruiser","Warlord_Cruiser","Heavy_Minstrel_Yacht","Ubrikkian_Frigate","Kaloth_Battlecruiser","Juvard_Frigate","Barabbula_Frigate","Kossak_Frigate","Ubrikkian_Cruiser_GCW","Szajin_Cruiser","Karagga_Destroyer"
			},
			["ERA_6"] = {
				"Hutt_LocalOffice","Smuggler_Cantina","H_Ground_Barracks","H_Ground_Light_Vehicle_Factory",
				"Hutt_Guard_Squad","Hutt_Gamorrean_Guard_Squad","Hutt_Armored_Platoon","Hutt_Desert_Sail20_Company",
				"Hutt_Bantha_II_Skiff_Company","Hutt_SuperHaul_II_Skiff_Company","Hutt_AST5_Company","Hutt_Pod_Walker_Company","WLO5_Tank_Company",
				"Warlord_Cruiser","Warlord_Cruiser","Heavy_Minstrel_Yacht","Ubrikkian_Frigate","Kaloth_Battlecruiser","Juvard_Frigate","Barabbula_Frigate","Kossak_Frigate","Ubrikkian_Cruiser_GCW","Szajin_Cruiser","Karagga_Destroyer"
			},
			["ERA_7"] = {
				"Hutt_LocalOffice","Smuggler_Cantina","H_Ground_Barracks","H_Ground_Light_Vehicle_Factory",
				"Hutt_Guard_Squad","Hutt_Gamorrean_Guard_Squad","Hutt_Armored_Platoon","Hutt_Desert_Sail20_Company",
				"Hutt_Bantha_II_Skiff_Company","Hutt_SuperHaul_II_Skiff_Company","Hutt_AST5_Company","Hutt_Pod_Walker_Company","WLO5_Tank_Company",
				"Warlord_Cruiser","Warlord_Cruiser","Heavy_Minstrel_Yacht","Ubrikkian_Frigate","Kaloth_Battlecruiser","Juvard_Frigate","Barabbula_Frigate","Kossak_Frigate","Ubrikkian_Cruiser_GCW","Szajin_Cruiser","Karagga_Destroyer"
			},
		},
		["GREATER_MALDROOD"] = {
			["ERA_1"] = {
				"Maldrood_MoffPalace","Tax_Agency","T_Ground_Barracks","T_Ground_Light_Vehicle_Factory","T_Ground_Heavy_Vehicle_Factory",
				"Imperial_Navy_Commando_Squad","Imperial_Navy_Commando_Squad","Imperial_Stormtrooper_Squad","Imperial_AT_RT_Company",
				"Imperial_RTT_Company","Imperial_RTT_Company","Imperial_2M_Company","Imperial_INT4_Group","Imperial_A5_Juggernaut_Company",
				"Guardian_Squadron","Guardian_Squadron","Customs_Corvette","Customs_Corvette","Vigil","Vigil","Carrack_Cruiser","Strike_Cruiser","Generic_Pursuit","Generic_Imperial_II_Frigate","Crimson_Victory"
			},
			["ERA_2"] = {
				"Maldrood_MoffPalace","Tax_Agency","T_Ground_Barracks","T_Ground_Light_Vehicle_Factory","T_Ground_Heavy_Vehicle_Factory",
				"Imperial_Navy_Commando_Squad","Imperial_Navy_Commando_Squad","Imperial_Stormtrooper_Squad","Imperial_AT_RT_Company",
				"Imperial_RTT_Company","Imperial_RTT_Company","Imperial_2M_Company","Imperial_INT4_Group","Imperial_A5_Juggernaut_Company",
				"Guardian_Squadron","Guardian_Squadron","Customs_Corvette","Customs_Corvette","Vigil","Vigil","Carrack_Cruiser","Strike_Cruiser","Generic_Pursuit","Generic_Imperial_II_Frigate","Crimson_Victory"
			},
			["ERA_3"] = {
				"Maldrood_MoffPalace","Tax_Agency","T_Ground_Barracks","T_Ground_Light_Vehicle_Factory","T_Ground_Heavy_Vehicle_Factory",
				"Imperial_Navy_Commando_Squad","Imperial_Navy_Commando_Squad","Imperial_Stormtrooper_Squad","Imperial_AT_RT_Company",
				"Imperial_RTT_Company","Imperial_RTT_Company","Imperial_2M_Company","Imperial_INT4_Group","Imperial_A5_Juggernaut_Company",
				"Guardian_Squadron","Guardian_Squadron","Customs_Corvette","Customs_Corvette","Vigil","Vigil","Carrack_Cruiser","Strike_Cruiser","Generic_Pursuit","Generic_Imperial_II_Frigate","Crimson_Victory"
			},
			["ERA_4"] = {
				"Maldrood_MoffPalace","Tax_Agency","T_Ground_Barracks","T_Ground_Light_Vehicle_Factory","T_Ground_Heavy_Vehicle_Factory",
				"Imperial_Navy_Commando_Squad","Imperial_Navy_Commando_Squad","Imperial_Stormtrooper_Squad","Imperial_AT_RT_Company",
				"Imperial_RTT_Company","Imperial_RTT_Company","Imperial_2M_Company","Imperial_INT4_Group","Imperial_A5_Juggernaut_Company",
				"Guardian_Squadron","Guardian_Squadron","Customs_Corvette","Customs_Corvette","Vigil","Vigil","Carrack_Cruiser","Strike_Cruiser","Generic_Pursuit","Generic_Imperial_II_Frigate","Crimson_Victory"
			},
			["ERA_5"] = {
				"Maldrood_MoffPalace","Tax_Agency","T_Ground_Barracks","T_Ground_Light_Vehicle_Factory","T_Ground_Heavy_Vehicle_Factory",
				"Imperial_Navy_Commando_Squad","Imperial_Navy_Commando_Squad","Imperial_Stormtrooper_Squad","Imperial_AT_RT_Company",
				"Imperial_RTT_Company","Imperial_RTT_Company","Imperial_2M_Company","Imperial_INT4_Group","Imperial_A5_Juggernaut_Company",
				"Guardian_Squadron","Guardian_Squadron","Customs_Corvette","Customs_Corvette","Vigil","Vigil","Carrack_Cruiser","Strike_Cruiser","Generic_Pursuit","Generic_Imperial_II_Frigate","Crimson_Victory"
			},
			["ERA_6"] = {
				"Maldrood_MoffPalace","Tax_Agency","T_Ground_Barracks","T_Ground_Light_Vehicle_Factory","T_Ground_Heavy_Vehicle_Factory",
				"Imperial_Navy_Commando_Squad","Imperial_Navy_Commando_Squad","Imperial_Stormtrooper_Squad","Imperial_AT_RT_Company",
				"Imperial_RTT_Company","Imperial_RTT_Company","Imperial_2M_Company","Imperial_INT4_Group","Imperial_A5_Juggernaut_Company",
				"Guardian_Squadron","Guardian_Squadron","Customs_Corvette","Customs_Corvette","Vigil","Vigil","Carrack_Cruiser","Strike_Cruiser","Generic_Pursuit","Generic_Imperial_II_Frigate","Crimson_Victory"
			},
			["ERA_7"] = {
				"Maldrood_MoffPalace","Tax_Agency","T_Ground_Barracks","T_Ground_Light_Vehicle_Factory","T_Ground_Heavy_Vehicle_Factory",
				"Imperial_Navy_Commando_Squad","Imperial_Navy_Commando_Squad","Imperial_Stormtrooper_Squad","Imperial_AT_RT_Company",
				"Imperial_RTT_Company","Imperial_RTT_Company","Imperial_2M_Company","Imperial_INT4_Group","Imperial_A5_Juggernaut_Company",
				"Guardian_Squadron","Guardian_Squadron","Customs_Corvette","Customs_Corvette","Vigil","Vigil","Carrack_Cruiser","Strike_Cruiser","Generic_Pursuit","Generic_Imperial_II_Frigate","Crimson_Victory"
			},
		},
		["ZSINJ_EMPIRE"] = {
			["ERA_1"] = {
				"Zsinj_MoffPalace","Tax_Agency","Z_Ground_Barracks","Z_Ground_Light_Vehicle_Factory",
				"Zsinj_EVO_Trooper_Squad","Zsinj_EVO_Trooper_Squad","Imperial_Stormtrooper_Squad","Imperial_PX10_Company",
				"Imperial_Chariot_LAV_Company","Imperial_Chariot_LAV_Company","Imperial_AT_AP_Walker_Company","Imperial_APC_Company","Imperial_TRMB_Company",
				"YZ_775_Squadron","YZ_775_Squadron","CR90_Zsinj","CR90_Zsinj","CR92_Assassin","CR92_Assassin","Surveyor_Frigate","Surveyor_Frigate","Nebulon_B_Zsinj","Star_Galleon","Neutron_Star","Dragon_Heavy_Cruiser","Generic_Victory_Destroyer_Two"
			},
			["ERA_2"] = {
				"Zsinj_MoffPalace","Tax_Agency","Z_Ground_Barracks","Z_Ground_Light_Vehicle_Factory",
				"Zsinj_EVO_Trooper_Squad","Zsinj_EVO_Trooper_Squad","Imperial_Stormtrooper_Squad","Imperial_PX10_Company",
				"Imperial_Chariot_LAV_Company","Imperial_Chariot_LAV_Company","Imperial_AT_AP_Walker_Company","Imperial_APC_Company","Imperial_TRMB_Company",
				"YZ_775_Squadron","YZ_775_Squadron","CR90_Zsinj","CR90_Zsinj","CR92_Assassin","CR92_Assassin","Surveyor_Frigate","Surveyor_Frigate","Nebulon_B_Zsinj","Star_Galleon","Neutron_Star","Dragon_Heavy_Cruiser","Generic_Victory_Destroyer_Two"
			},
			["ERA_3"] = {
				"Zsinj_MoffPalace","Tax_Agency","Z_Ground_Barracks","Z_Ground_Light_Vehicle_Factory",
				"Zsinj_EVO_Trooper_Squad","Zsinj_EVO_Trooper_Squad","Imperial_Stormtrooper_Squad","Imperial_PX10_Company",
				"Imperial_Chariot_LAV_Company","Imperial_Chariot_LAV_Company","Imperial_AT_AP_Walker_Company","Imperial_APC_Company","Imperial_TRMB_Company",
				"YZ_775_Squadron","YZ_775_Squadron","CR90_Zsinj","CR90_Zsinj","CR92_Assassin","CR92_Assassin","Surveyor_Frigate","Surveyor_Frigate","Nebulon_B_Zsinj","Star_Galleon","Neutron_Star","Dragon_Heavy_Cruiser","Generic_Victory_Destroyer_Two"
			},
			["ERA_4"] = {
				"Zsinj_MoffPalace","Tax_Agency","Z_Ground_Barracks","Z_Ground_Light_Vehicle_Factory",
				"Zsinj_EVO_Trooper_Squad","Zsinj_EVO_Trooper_Squad","Imperial_Stormtrooper_Squad","Imperial_PX10_Company",
				"Imperial_Chariot_LAV_Company","Imperial_Chariot_LAV_Company","Imperial_AT_AP_Walker_Company","Imperial_APC_Company","Imperial_TRMB_Company",
				"YZ_775_Squadron","YZ_775_Squadron","CR90_Zsinj","CR90_Zsinj","CR92_Assassin","CR92_Assassin","Surveyor_Frigate","Surveyor_Frigate","Nebulon_B_Zsinj","Star_Galleon","Neutron_Star","Dragon_Heavy_Cruiser","Generic_Victory_Destroyer_Two"
			},
			["ERA_5"] = {
				"Zsinj_MoffPalace","Tax_Agency","Z_Ground_Barracks","Z_Ground_Light_Vehicle_Factory",
				"Zsinj_EVO_Trooper_Squad","Zsinj_EVO_Trooper_Squad","Imperial_Stormtrooper_Squad","Imperial_PX10_Company",
				"Imperial_Chariot_LAV_Company","Imperial_Chariot_LAV_Company","Imperial_AT_AP_Walker_Company","Imperial_APC_Company","Imperial_TRMB_Company",
				"YZ_775_Squadron","YZ_775_Squadron","CR90_Zsinj","CR90_Zsinj","CR92_Assassin","CR92_Assassin","Surveyor_Frigate","Surveyor_Frigate","Nebulon_B_Zsinj","Star_Galleon","Neutron_Star","Dragon_Heavy_Cruiser","Generic_Victory_Destroyer_Two"
			},
			["ERA_6"] = {
				"Zsinj_MoffPalace","Tax_Agency","Z_Ground_Barracks","Z_Ground_Light_Vehicle_Factory",
				"Zsinj_EVO_Trooper_Squad","Zsinj_EVO_Trooper_Squad","Imperial_Stormtrooper_Squad","Imperial_PX10_Company",
				"Imperial_Chariot_LAV_Company","Imperial_Chariot_LAV_Company","Imperial_AT_AP_Walker_Company","Imperial_APC_Company","Imperial_TRMB_Company",
				"YZ_775_Squadron","YZ_775_Squadron","CR90_Zsinj","CR90_Zsinj","CR92_Assassin","CR92_Assassin","Surveyor_Frigate","Surveyor_Frigate","Nebulon_B_Zsinj","Star_Galleon","Neutron_Star","Dragon_Heavy_Cruiser","Generic_Victory_Destroyer_Two"
			},
			["ERA_7"] = {
				"Zsinj_MoffPalace","Tax_Agency","Z_Ground_Barracks","Z_Ground_Light_Vehicle_Factory",
				"Zsinj_EVO_Trooper_Squad","Zsinj_EVO_Trooper_Squad","Imperial_Stormtrooper_Squad","Imperial_PX10_Company",
				"Imperial_Chariot_LAV_Company","Imperial_Chariot_LAV_Company","Imperial_AT_AP_Walker_Company","Imperial_APC_Company","Imperial_TRMB_Company",
				"YZ_775_Squadron","YZ_775_Squadron","CR90_Zsinj","CR90_Zsinj","CR92_Assassin","CR92_Assassin","Surveyor_Frigate","Surveyor_Frigate","Nebulon_B_Zsinj","Star_Galleon","Neutron_Star","Dragon_Heavy_Cruiser","Generic_Victory_Destroyer_Two"
			},
		},
		["ERIADU_AUTHORITY"] = {
			["ERA_1"] = {
				"Eriadu_MoffPalace","Tax_Agency","A_Ground_Barracks","A_Ground_Light_Vehicle_Factory","A_Ground_Heavy_Vehicle_Factory",
				"Imperial_Army_Special_Missions_Squad","Imperial_Army_Special_Missions_Squad","Imperial_Stormtrooper_Squad","Imperial_64Y_Company",
				"Imperial_AT_MP_Company","Imperial_AT_MP_Company","Imperial_1M_Tank_Company","Imperial_Flashblind_Group","Imperial_1H_Tank_Company",
				"Gamma_ATR_6_Squadron","Gamma_ATR_6_Squadron","Gamma_ATR_6_Squadron","Gamma_ATR_6_Squadron","IPV1_System_Patrol_Craft","IPV1_System_Patrol_Craft","IPV1_System_Patrol_Craft","Raider_II_Corvette","Raider_II_Corvette","Arquitens","Arquitens","Arquitens","Generic_Gladiator","Generic_Imperial_I_Frigate","Generic_Victory_Destroyer"
				},
			["ERA_2"] = {
				"Eriadu_MoffPalace","Tax_Agency","A_Ground_Barracks","A_Ground_Light_Vehicle_Factory","A_Ground_Heavy_Vehicle_Factory",
				"Imperial_Army_Special_Missions_Squad","Imperial_Army_Special_Missions_Squad","Imperial_Stormtrooper_Squad","Imperial_64Y_Company",
				"Imperial_AT_MP_Company","Imperial_AT_MP_Company","Imperial_1M_Tank_Company","Imperial_Flashblind_Group","Imperial_1H_Tank_Company",
				"Gamma_ATR_6_Squadron","Gamma_ATR_6_Squadron","Gamma_ATR_6_Squadron","Gamma_ATR_6_Squadron","IPV1_System_Patrol_Craft","IPV1_System_Patrol_Craft","IPV1_System_Patrol_Craft","Raider_II_Corvette","Raider_II_Corvette","Arquitens","Arquitens","Arquitens","Generic_Gladiator","Generic_Imperial_I_Frigate","Generic_Victory_Destroyer"
			},
			["ERA_3"] = {
				"Eriadu_MoffPalace","Tax_Agency","A_Ground_Barracks","A_Ground_Light_Vehicle_Factory","A_Ground_Heavy_Vehicle_Factory",
				"Imperial_Army_Special_Missions_Squad","Imperial_Army_Special_Missions_Squad","Imperial_Stormtrooper_Squad","Imperial_64Y_Company",
				"Imperial_AT_MP_Company","Imperial_AT_MP_Company","Imperial_1M_Tank_Company","Imperial_Flashblind_Group","Imperial_1H_Tank_Company",
				"Gamma_ATR_6_Squadron","Gamma_ATR_6_Squadron","Gamma_ATR_6_Squadron","Gamma_ATR_6_Squadron","IPV1_System_Patrol_Craft","IPV1_System_Patrol_Craft","IPV1_System_Patrol_Craft","Raider_II_Corvette","Raider_II_Corvette","Arquitens","Arquitens","Arquitens","Generic_Gladiator","Generic_Imperial_I_Frigate","Generic_Victory_Destroyer"
			},
			["ERA_4"] = {
				"Eriadu_MoffPalace","Tax_Agency","A_Ground_Barracks","A_Ground_Light_Vehicle_Factory","A_Ground_Heavy_Vehicle_Factory",
				"Imperial_Army_Special_Missions_Squad","Imperial_Army_Special_Missions_Squad","Imperial_Stormtrooper_Squad","Imperial_64Y_Company",
				"Imperial_AT_MP_Company","Imperial_AT_MP_Company","Imperial_1M_Tank_Company","Imperial_Flashblind_Group","Imperial_1H_Tank_Company",
				"Gamma_ATR_6_Squadron","Gamma_ATR_6_Squadron","Gamma_ATR_6_Squadron","Gamma_ATR_6_Squadron","IPV1_System_Patrol_Craft","IPV1_System_Patrol_Craft","IPV1_System_Patrol_Craft","Raider_II_Corvette","Raider_II_Corvette","Arquitens","Arquitens","Arquitens","Generic_Gladiator","Generic_Imperial_I_Frigate","Generic_Victory_Destroyer"
			},
			["ERA_5"] = {
				"Eriadu_MoffPalace","Tax_Agency","A_Ground_Barracks","A_Ground_Light_Vehicle_Factory","A_Ground_Heavy_Vehicle_Factory",
				"Imperial_Army_Special_Missions_Squad","Imperial_Army_Special_Missions_Squad","Imperial_Stormtrooper_Squad","Imperial_64Y_Company",
				"Imperial_AT_MP_Company","Imperial_AT_MP_Company","Imperial_1M_Tank_Company","Imperial_Flashblind_Group","Imperial_1H_Tank_Company",
				"Gamma_ATR_6_Squadron","Gamma_ATR_6_Squadron","Gamma_ATR_6_Squadron","Gamma_ATR_6_Squadron","IPV1_System_Patrol_Craft","IPV1_System_Patrol_Craft","IPV1_System_Patrol_Craft","Raider_II_Corvette","Raider_II_Corvette","Arquitens","Arquitens","Arquitens","Generic_Gladiator","Generic_Imperial_I_Frigate","Generic_Victory_Destroyer"
			},
			["ERA_6"] = {
				"Eriadu_MoffPalace","Tax_Agency","A_Ground_Barracks","A_Ground_Light_Vehicle_Factory","A_Ground_Heavy_Vehicle_Factory",
				"Imperial_Army_Special_Missions_Squad","Imperial_Army_Special_Missions_Squad","Imperial_Stormtrooper_Squad","Imperial_64Y_Company",
				"Imperial_AT_MP_Company","Imperial_AT_MP_Company","Imperial_1M_Tank_Company","Imperial_Flashblind_Group","Imperial_1H_Tank_Company",
				"Gamma_ATR_6_Squadron","Gamma_ATR_6_Squadron","Gamma_ATR_6_Squadron","Gamma_ATR_6_Squadron","IPV1_System_Patrol_Craft","IPV1_System_Patrol_Craft","IPV1_System_Patrol_Craft","Raider_II_Corvette","Raider_II_Corvette","Arquitens","Arquitens","Arquitens","Generic_Gladiator","Generic_Imperial_I_Frigate","Generic_Victory_Destroyer"
			},
			["ERA_7"] = {
				"Eriadu_MoffPalace","Tax_Agency","A_Ground_Barracks","A_Ground_Light_Vehicle_Factory","A_Ground_Heavy_Vehicle_Factory",
				"Imperial_Army_Special_Missions_Squad","Imperial_Army_Special_Missions_Squad","Imperial_Stormtrooper_Squad","Imperial_64Y_Company",
				"Imperial_AT_MP_Company","Imperial_AT_MP_Company","Imperial_1M_Tank_Company","Imperial_Flashblind_Group","Imperial_1H_Tank_Company",
				"Gamma_ATR_6_Squadron","Gamma_ATR_6_Squadron","Gamma_ATR_6_Squadron","Gamma_ATR_6_Squadron","IPV1_System_Patrol_Craft","IPV1_System_Patrol_Craft","IPV1_System_Patrol_Craft","Raider_II_Corvette","Raider_II_Corvette","Arquitens","Arquitens","Arquitens","Generic_Gladiator","Generic_Imperial_I_Frigate","Generic_Victory_Destroyer"
			},
		},
		["CORPORATE_SECTOR"] = {
			["ERA_1"] = {
				"CSA_LocalOffice","Tax_Agency","C_Ground_Barracks","C_Ground_Light_Vehicle_Factory","C_Ground_Heavy_Vehicle_Factory",
				"CSA_B1_Droid_Squad","CSA_B1_Droid_Squad","Espo_Squad","Class_I_Company",
				"Espo_Walker_Squad","Espo_Walker_Squad","Persuader_Company","Strikebreaker_Group","K222_Group",
				"Citadel_Cruiser_Squadron","Gozanti_Cruiser_Squadron","Gozanti_Cruiser_Squadron","Etti_Lighter","Etti_Lighter","Marauder_Cruiser","Nebulon_B_Zsinj","Nebulon_B_Zsinj","Dreadnaught_Carrier","Generic_Gladiator","Recusant","Bulwark_I"
			},
			["ERA_2"] = {
				"CSA_LocalOffice","Tax_Agency","C_Ground_Barracks","C_Ground_Light_Vehicle_Factory","C_Ground_Heavy_Vehicle_Factory",
				"CSA_B1_Droid_Squad","CSA_B1_Droid_Squad","Espo_Squad","Class_I_Company",
				"Espo_Walker_Squad","Espo_Walker_Squad","Persuader_Company","Strikebreaker_Group","K222_Group",
				"Citadel_Cruiser_Squadron","Gozanti_Cruiser_Squadron","Gozanti_Cruiser_Squadron","Etti_Lighter","Etti_Lighter","Marauder_Cruiser","Nebulon_B_Zsinj","Nebulon_B_Zsinj","Dreadnaught_Carrier","Generic_Gladiator","Recusant","Bulwark_I"
			},
			["ERA_3"] = {
				"CSA_LocalOffice","Tax_Agency","C_Ground_Barracks","C_Ground_Light_Vehicle_Factory","C_Ground_Heavy_Vehicle_Factory",
				"CSA_B1_Droid_Squad","CSA_B1_Droid_Squad","Espo_Squad","Class_I_Company",
				"Espo_Walker_Squad","Espo_Walker_Squad","Persuader_Company","Strikebreaker_Group","K222_Group",
				"Citadel_Cruiser_Squadron","Gozanti_Cruiser_Squadron","Gozanti_Cruiser_Squadron","Etti_Lighter","Etti_Lighter","Marauder_Cruiser","Nebulon_B_Zsinj","Nebulon_B_Zsinj","Dreadnaught_Carrier","Generic_Gladiator","Recusant","Bulwark_I"
			},
			["ERA_4"] = {
				"CSA_LocalOffice","Tax_Agency","C_Ground_Barracks","C_Ground_Light_Vehicle_Factory","C_Ground_Heavy_Vehicle_Factory",
				"CSA_B1_Droid_Squad","CSA_B1_Droid_Squad","Espo_Squad","Class_I_Company",
				"Espo_Walker_Squad","Espo_Walker_Squad","Persuader_Company","Strikebreaker_Group","K222_Group",
				"Citadel_Cruiser_Squadron","Gozanti_Cruiser_Squadron","Gozanti_Cruiser_Squadron","Etti_Lighter","Etti_Lighter","Marauder_Cruiser","Nebulon_B_Zsinj","Nebulon_B_Zsinj","Dreadnaught_Carrier","Generic_Gladiator","Recusant","Bulwark_I"
			},
			["ERA_5"] = {
				"CSA_LocalOffice","Tax_Agency","C_Ground_Barracks","C_Ground_Light_Vehicle_Factory","C_Ground_Heavy_Vehicle_Factory",
				"CSA_B1_Droid_Squad","CSA_B1_Droid_Squad","Espo_Squad","Class_I_Company",
				"Espo_Walker_Squad","Espo_Walker_Squad","Persuader_Company","Strikebreaker_Group","K222_Group",
				"Citadel_Cruiser_Squadron","Gozanti_Cruiser_Squadron","Gozanti_Cruiser_Squadron","Etti_Lighter","Etti_Lighter","Marauder_Cruiser","Nebulon_B_Zsinj","Nebulon_B_Zsinj","Dreadnaught_Carrier","Generic_Gladiator","Recusant","Bulwark_I"
			},
			["ERA_6"] = {
				"CSA_LocalOffice","Tax_Agency","C_Ground_Barracks","C_Ground_Light_Vehicle_Factory","C_Ground_Heavy_Vehicle_Factory",
				"CSA_B1_Droid_Squad","CSA_B1_Droid_Squad","Espo_Squad","Class_I_Company",
				"Espo_Walker_Squad","Espo_Walker_Squad","Persuader_Company","Strikebreaker_Group","K222_Group",
				"Citadel_Cruiser_Squadron","Gozanti_Cruiser_Squadron","Gozanti_Cruiser_Squadron","Etti_Lighter","Etti_Lighter","Marauder_Cruiser","Nebulon_B_Zsinj","Nebulon_B_Zsinj","Dreadnaught_Carrier","Generic_Gladiator","Recusant","Bulwark_I"
			},
			["ERA_7"] = {
				"CSA_LocalOffice","Tax_Agency","C_Ground_Barracks","C_Ground_Light_Vehicle_Factory","C_Ground_Heavy_Vehicle_Factory",
				"CSA_B1_Droid_Squad","CSA_B1_Droid_Squad","Espo_Squad","Class_I_Company",
				"Espo_Walker_Squad","Espo_Walker_Squad","Persuader_Company","Strikebreaker_Group","K222_Group",
				"Citadel_Cruiser_Squadron","Gozanti_Cruiser_Squadron","Gozanti_Cruiser_Squadron","Etti_Lighter","Etti_Lighter","Marauder_Cruiser","Nebulon_B_Zsinj","Nebulon_B_Zsinj","Dreadnaught_Carrier","Generic_Gladiator","Recusant","Bulwark_I"
			},
		},
		["HAPES_CONSORTIUM"] = {
			["ERA_1"] = {
				"House_Royal","Tax_Agency","HC_Ground_Barracks","HC_Ground_Light_Vehicle_Factory","HC_Ground_Heavy_Vehicle_Factory",
				"Hapan_Infantry_Squad","Hapan_Infantry_Squad","HRG_Commando_Squad","Hapan_LightTank_Company",
				"Hapan_LightTank_Company","Hapan_Transport_Company","Hapan_Silanus_Company","Hapan_HeavyTank_Company","Hapan_Gunboat_Company",
				"Raptor_Gunship_Squadron","Raptor_Gunship_Squadron","Raptor_Gunship_Squadron","Baidam","Beta_Cruiser","Flare","Nova_Cruiser","Olanji_Frigate","Magnetar","BattleDragon"
			},
			["ERA_2"] = {
				"House_Royal","Tax_Agency","HC_Ground_Barracks","HC_Ground_Light_Vehicle_Factory","HC_Ground_Heavy_Vehicle_Factory",
				"Hapan_Infantry_Squad","Hapan_Infantry_Squad","HRG_Commando_Squad","Hapan_LightTank_Company",
				"Hapan_LightTank_Company","Hapan_Transport_Company","Hapan_Silanus_Company","Hapan_HeavyTank_Company","Hapan_Gunboat_Company",
				"Raptor_Gunship_Squadron","Baidam","Beta_Cruiser","Nova_Cruiser","Olanji_Frigate","Magnetar","Pulsar"
			},
			["ERA_3"] = {
				"House_Royal","Tax_Agency","HC_Ground_Barracks","HC_Ground_Light_Vehicle_Factory","HC_Ground_Heavy_Vehicle_Factory",
				"Hapan_Infantry_Squad","Hapan_Infantry_Squad","HRG_Commando_Squad","Hapan_LightTank_Company",
				"Hapan_LightTank_Company","Hapan_Transport_Company","Hapan_Silanus_Company","Hapan_HeavyTank_Company","Hapan_Gunboat_Company",
				"Raptor_Gunship_Squadron","Baidam","Beta_Cruiser","Nova_Cruiser","Olanji_Frigate","Magnetar","Pulsar"
			},
			["ERA_4"] = {
				"House_Royal","Tax_Agency","HC_Ground_Barracks","HC_Ground_Light_Vehicle_Factory","HC_Ground_Heavy_Vehicle_Factory",
				"Hapan_Infantry_Squad","Hapan_Infantry_Squad","HRG_Commando_Squad","Hapan_LightTank_Company",
				"Hapan_LightTank_Company","Hapan_Transport_Company","Hapan_Silanus_Company","Hapan_HeavyTank_Company","Hapan_Gunboat_Company",
				"Raptor_Gunship_Squadron","Baidam","Beta_Cruiser","Nova_Cruiser","Olanji_Frigate","Magnetar","Pulsar"
			},
			["ERA_5"] = {
				"House_Royal","Tax_Agency","HC_Ground_Barracks","HC_Ground_Light_Vehicle_Factory","HC_Ground_Heavy_Vehicle_Factory",
				"Hapan_Infantry_Squad","Hapan_Infantry_Squad","HRG_Commando_Squad","Hapan_LightTank_Company",
				"Hapan_LightTank_Company","Hapan_Transport_Company","Hapan_Silanus_Company","Hapan_HeavyTank_Company","Hapan_Gunboat_Company",
				"Raptor_Gunship_Squadron","Baidam","Beta_Cruiser","Nova_Cruiser","Olanji_Frigate","Magnetar","Pulsar"
			},
			["ERA_6"] = {
				"House_Royal","Tax_Agency","HC_Ground_Barracks","HC_Ground_Light_Vehicle_Factory","HC_Ground_Heavy_Vehicle_Factory",
				"Hapan_Infantry_Squad","Hapan_Infantry_Squad","HRG_Commando_Squad","Hapan_LightTank_Company",
				"Hapan_LightTank_Company","Hapan_Transport_Company","Hapan_Silanus_Company","Hapan_HeavyTank_Company","Hapan_Gunboat_Company",
				"Raptor_Gunship_Squadron","Baidam","Beta_Cruiser","Nova_Cruiser","Olanji_Frigate","Magnetar","Pulsar"
			},
			["ERA_7"] = {
				"House_Royal","Tax_Agency","HC_Ground_Barracks","HC_Ground_Light_Vehicle_Factory","HC_Ground_Heavy_Vehicle_Factory",
				"Hapan_Infantry_Squad","Hapan_Infantry_Squad","HRG_Commando_Squad","Hapan_LightTank_Company",
				"Hapan_LightTank_Company","Hapan_Transport_Company","Hapan_Silanus_Company","Hapan_HeavyTank_Company","Hapan_Gunboat_Company",
				"Raptor_Gunship_Squadron","Baidam","Beta_Cruiser","Nova_Cruiser","Olanji_Frigate","Magnetar","Pulsar"
			},
		},
	}
}

return GameConstants
