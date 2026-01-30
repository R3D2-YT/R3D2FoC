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
--*   @Author:              [TR]Jorritkarwehr
--*   @Date:                2018-03-20T01:27:01+01:00
--*   @Project:             Imperial Civil War
--*   @Filename:            HeroFighterLibrary.lua
--*   @Last modified by:    [TR]Jorritkarwehr
--*   @Last modified time:  2021-05-25T09:58:14+02:00
--*   @License:             This source code may only be used with explicit permission from the developers
--*   @Copyright:           © TR: Imperial Civil War Development Team
--******************************************************************************
function Get_Hero_Entries(upgrade_object)
	local heroes = {
		--Index is name of build option to open popup
		--Hero_Squadron = name of spawned squadron
		--PopupHeader = name of header object for popup
		--Options = first item in sublist is popup option suffix. Locations is a list of all heroes who are associated with this option. Optionally, GroundPerceptions is a list of perceptions to detect these heroes for ground forms. Hero and perception order must match
		--NoInit = optional parameter to prevent fighter from being automatically assigned to the first listed hero in the first option on startup
		--Faction = specifies faction for perceptions
		--NoPlayerInit = NoInit for the player only. Requires Faction
		--GroundCompany = name of company to add to reinforcements when squadron/ship is in orbit. Requires GroundPerceptions and Faction
		
		--When piggybacking reinforcement system to check for orbital object instead of squadron, set a dummy index that does not match any buildable object and set NoInit to prevent all the missing fields from causing errors. 
		--GroundReinforcementPerception = the perception to detect when a unit is in orbit. Requires Faction and GroundCompany
		--NoSpawnFlag = nameof global variable that will prevent spawn
		
		["SOONTIR_FEL_181ST_LOCATION_SET"] = {
			Hero_Squadron = "SOONTIR_FEL_181ST_SQUADRON",
			NoInit = true,
			PopupHeader = "SOONTIR_FEL_181ST_SELECTOR_HEADER",
			Options = {
				--Pestage regime
				{"ROGRISS", Locations = {"ROGRISS_AGONIZER","ROGRISS_DOMINION"}},
				--Palpatine, Jax, Daala, & Pellaeon regime assignments shared w/ Phennir
				{"PELLAEON", Locations = {"PELLAEON_CAPTAIN_CHIMAERA","PELLAEON_GRAND_CHIMAERA","PELLAEON_REAPER","PELLAEON_MEGADOR"}},
				{"DAALA", Locations = {"DAALA_GORGON","DAALA_KNIGHT_HAMMER","DAALA_SCYLLA"}},
				{"WESSEL", Locations = {"WESSEL_EMPERORS_REVENGE"}},
				{"ARDAX", Locations = {"ARDAX_VENDETTA"}}
			}
		},
		["TURR_PHENNIR_TIE_INTERCEPTOR_LOCATION_SET"] = {
			Hero_Squadron = "TURR_PHENNIR_TIE_INTERCEPTOR_181ST_SQUADRON",
			PopupHeader = "TURR_PHENNIR_SELECTOR_HEADER",
			Options = {
				--Isard + CCOGM regime
				{"ROGRISS", Locations = {"ROGRISS_AGONIZER","ROGRISS_DOMINION"}},
				--Isard regime
				{"MAKATI", Locations = {"MAKATI_STEADFAST"}},
				--CCOGM regime
				{"TAKEL", Locations = {"TAKEL_MAGICDRAGON"}},
				--Thrawn regime
				{"BRANDEI", Locations = {"BRANDEI_JUDICATOR"}},
				{"DORJA", Locations = {"DORJA_RELENTLESS"}},
				--Palpatine, Jax, Daala, & Pellaeon regime assignments shared w/ Fel
				{"PELLAEON", Locations = {"PELLAEON_CAPTAIN_CHIMAERA","PELLAEON_GRAND_CHIMAERA","PELLAEON_REAPER","PELLAEON_MEGADOR"}},
				{"DAALA", Locations = {"DAALA_GORGON","DAALA_KNIGHT_HAMMER","DAALA_SCYLLA"}},
				{"WESSEL", Locations = {"WESSEL_EMPERORS_REVENGE"}},
				{"ARDAX", Locations = {"ARDAX_VENDETTA"}}
			}
		},
		["TURR_PHENNIR_TIE_DEFENDER_LOCATION_SET"] = {
			Hero_Squadron = "TURR_PHENNIR_TIE_DEFENDER_181ST_SQUADRON",
			NoInit = true,
			PopupHeader = "TURR_PHENNIR_SELECTOR_HEADER",
			Options = {
				--Isard + CCOGM regime
				{"ROGRISS", Locations = {"ROGRISS_AGONIZER","ROGRISS_DOMINION"}},
				--Isard regime
				{"MAKATI", Locations = {"MAKATI_STEADFAST"}},
				--CCOGM regime
				{"TAKEL", Locations = {"TAKEL_MAGICDRAGON"}},
				--Thrawn regime
				{"BRANDEI", Locations = {"BRANDEI_JUDICATOR"}},
				{"DORJA", Locations = {"DORJA_RELENTLESS"}},
				--Palpatine, Jax, Daala, & Pellaeon regime assignments shared w/ Fel
				{"PELLAEON", Locations = {"PELLAEON_CAPTAIN_CHIMAERA","PELLAEON_GRAND_CHIMAERA","PELLAEON_REAPER","PELLAEON_MEGADOR"}},
				{"DAALA", Locations = {"DAALA_GORGON","DAALA_KNIGHT_HAMMER","DAALA_SCYLLA"}},
				{"WESSEL", Locations = {"WESSEL_EMPERORS_REVENGE"}},
				{"ARDAX", Locations = {"ARDAX_VENDETTA"}}
			}
		},
		["MAAREK_STELE_181ST_LOCATION_SET"] = {
			Hero_Squadron = "MAAREK_STELE_181ST_SQUADRON",
			NoInit = true,
			PopupHeader = "MAAREK_STELE_181ST_SELECTOR_HEADER",
			Options = {
				--only options needed for historicals FIP & Caamas
				{"PELLAEON", Locations = {"PELLAEON_GRAND_CHIMAERA","PELLAEON_MEGADOR"}},
				{"DAALA", Locations = {"DAALA_SCYLLA"}},
				{"FLIM", Locations = {"FLIM_TIERCE_IRONHAND"}},
			}
		},
		["SHADOW_SQUADRON_LOCATION_SET"] = {
			Hero_Squadron = "BROADSIDE_SHADOW_SQUADRON",
			PopupHeader = "SHADOW_SQUADRON_SELECTOR_HEADER",
			Options = {
				{"BRASHIN", Locations = {"BRASHIN_INQUISITOR"}},
				{"KERMEN", Locations = {"KERMEN_BELLIGERENT"}},
				{"KRENNEL", Locations = {"KRENNEL_RECKONING"}},
				{"DENN_WESSEX", Locations = {"WESSEX_REDOUBT"}},
				{"CRONAL", Locations = {"CRONAL_SINGULARITY"}},
				{"DANGOR", Locations = {"DANGOR_JAVELIN"}},
			}
		},
		["SCIMITAR_SQUADRON_LOCATION_SET"] = {
			Hero_Squadron = "RHYMER_SCIMITAR_SQUADRON",
			NoInit = true,
			PopupHeader = "SCIMITAR_SQUADRON_SELECTOR_HEADER",
			Options = {
				{"HISSA", Locations = {"HISSA_MOFFSHIP"}},
				{"TIGELLINUS", Locations = {"TIGELLINUS_AVATAR"}},
				{"DUNHAUSEN", Locations = {"DUNHAUSEN_ESPA"}},
				{"THISTLEBORN", Locations = {"THISTLEBORN_DARKGREETER"}},
				{"PANAKA", Locations = {"PANAKA_THEED"}},
				{"GRUNGER", Locations = {"GRUNGER_AGGRESSOR"}},
			}
		},
		["VESSERY_STRANGER_LOCATION_SET"] = {
			Hero_Squadron = "VESSERY_STRANGER_SQUADRON",
			PopupHeader = "VESSERY_SELECTOR_HEADER",
			Options = {
				{"ISARD", Locations = {"ISARD_LUSANKYA"}},
				{"DEVLIA", Locations = {"DEVLIA_IEC"}},
				{"CONVARION", Locations = {"CONVARION_CORRUPTER"}},
				{"LIRA_WESSEX", Locations = {"WESSEX_DAUNTLESS"}},
				{"NICLARA", Locations = {"NICLARA_PULSARS_REVENGE"}},
				{"KEDLER", Locations = {"KEDLER_ELEOS"}},
			}
		},
		["ERISI_DLARIT_LOCATION_SET"] = {
			Hero_Squadron = "ERISI_DLARIT_ELITE_SQUADRON",
			PopupHeader = "ERISI_DLARIT_SELECTOR_HEADER",
			Options = {
				{"ISARD", Locations = {"ISARD_LUSANKYA"}},
				{"YONKA", Locations = {"YONKA_AVARICE"}},
				{"CONVARION", Locations = {"CONVARION_CORRUPTER"}},
				{"LIRA_WESSEX", Locations = {"WESSEX_DAUNTLESS"}},
				{"NICLARA", Locations = {"NICLARA_PULSARS_REVENGE"}},
				{"KEDLER", Locations = {"KEDLER_ELEOS"}},
			}
		},
		["BRASHIN_TRMB"] = {
			NoInit = true,
			GroundReinforcementPerception = "Brashin_Inquisitor_In_Orbit",
			GroundCompany = "Brashin_TRMB_Team",
			Faction = "Empire",
			NoSpawnFlag = "BRASHIN_TRMB_DEAD",
		},
		["GRODIN_TIERCE"] = {
			NoInit = true,
			GroundReinforcementPerception = "Flim_Tierce_Ironhand_In_Orbit",
			GroundCompany = "Grodin_Tierce_Team",
			Faction = "Empire",
			NoSpawnFlag = "DEPLOYED_GRODIN_TIERCE_DEAD",
		},
		["TETRAN_COWALL_LOCATION_SET"] = {
			Hero_Squadron = "TETRAN_COWALL_FALSE_181ST_SQUADRON",
			PopupHeader = "TETRAN_COWALL_SELECTOR_HEADER",
			Options = {
				{"ZSINJ", Locations = {"ZSINJ_IRON_FIST_VSD","ZSINJ_IRON_FIST_EXECUTOR"}},
				{"RASLAN", Locations = {"RAZORS_KISS"}},
				{"NABYL", Locations = {"NABYL_HAWKBAT"}},
				{"DARILLIAN", Locations = {"NIGHT_CALLER"}},
				{"TRIGIT", Locations = {"TRIGIT_IMPLACABLE"}},
			}
		},
		["JAG_127TH_LOCATION_SET"] = {
			Hero_Squadron = "JAG_127TH_SQUADRON",
			NoInit = true,
			PopupHeader = "JAG_127TH_SELECTOR_HEADER",
			Options = {
				{"SCREED", Locations = {"SCREED_DEMOLISHER"}, GroundPerceptions = {"Screed_Demolisher_In_Orbit"}},
				{"BANJEER", Locations = {"BANJEER","BANJEER_NEUTRON"}, GroundPerceptions = {"Banjeer_In_Orbit","Banjeer_Neutron_In_Orbit"}},
				{"JOSHI", Locations = {"JOSHI_PROVOCATEUR"}, GroundPerceptions = {"Joshi_Provocateur_In_Orbit"}},
				{"CRONAL", Locations = {"CRONAL_SINGULARITY"}, GroundPerceptions = {"Cronal_Singularity_In_Orbit"}},
				{"TOULER", Locations = {"TOULER_KORASA_MAZE"}, GroundPerceptions = {"Touler_Korasa_Maze_In_Orbit"}},
				{"GROT", Locations = {"GROT_RESOLUTION"}, GroundPerceptions = {"Grot_Resolution_In_Orbit"}},
			},
			GroundCompany = "Jag_127th_Team",
			Faction = "Zsinj_Empire"
		},
		["NERWAL_AVENGER_LOCATION_SET"] = {
			Hero_Squadron = "NERWAL_AVENGER_SQUADRON",
			NoInit = true,
			PopupHeader = "NERWAL_AVENGER_SELECTOR_HEADER",
			Options = {
				{"DELVARDUS", Locations = {"DELVARDUS_BRILLIANT","DELVARDUS_THALASSA","DELVARDUS_NIGHT_HAMMER"}},
				{"HUBLIN", Locations = {"HUBLIN_KABALIAN_CROSS"}},
				{"WESSEL", Locations = {"WESSEL_EMPERORS_REVENGE"}},
				{"PRENTIOCH", Locations = {"PRENTIOCH_PRENTIOCH"}},
				{"SAHREEL", Locations = {"SAHREEL_IMPENDING_DOOM"}},
				{"TROMMER", Locations = {"TROMMER_RAVAGOR"}},
			}
		},
		["REXLER_BRATH_ONYX_LOCATION_SET"] = {
			Hero_Squadron = "REXLER_BRATH_ONYX_SQUADRON",
			PopupHeader = "REXLER_BRATH_ONYX_SELECTOR_HEADER",
			Options = {
				{"PRITTICK", Locations = {"PRITTICK_TYRANT"}},
				{"RESUUN", Locations = {"RESUUN_RETRIBUTION"}},
				{"PRAJI", Locations = {"PRAJI_SECUTOR"}},
				{"DAALA", Locations = {"DAALA_GORGON","DAALA_KNIGHT_HAMMER","DAALA_SCYLLA"}},
				{"ZED", Locations = {"ZED_STALKER"}},
				{"RAVEEN", Locations = {"RAVEEN_PREDOMINANT"}},
			}
		},
		["VYNDER_EAGLE_LOCATION_SET"] = {
			Hero_Squadron = "VYNDER_EAGLE_SQUADRON",
			NoInit = true,
			PopupHeader = "VYNDER_EAGLE_SELECTOR_HEADER",
			Options = {
				{"TREUTEN", Locations = {"TREUTEN_13X","TREUTEN_CRIMSON_SUNRISE"}},
				{"NERVI", Locations = {"NERVI_BLOOD_AMBITION"}},
				{"NEOMEN", Locations = {"NEOMEN_ION_STORM"}},
				{"PELLAEON", Locations = {"PELLAEON_13X","PELLAEON_CAPTAIN_CHIMAERA","PELLAEON_GRAND_CHIMAERA","PELLAEON_REAPER","PELLAEON_MEGADOR"}},
				{"LARM", Locations = {"LARM_CARRACK"}},
				{"LUMIYA", Locations = {"LUMIYA_REVENANT"}},
			}
		},
		["TYRESI_BOLT_LOCATION_SET"] = {
			Hero_Squadron = "TYRESI_GURTT_BOLT_SQUADRON",
			PopupHeader = "TYRESI_GURTT_BOLT_SELECTOR_HEADER",
			Options = {
				{"TAVIRA", Locations = {"TAVIRA_INVIDIOUS"}},
				{"RIIZOLO", Locations = {"RIIZOLO_NEUTRON"}},
				{"DAALA", Locations = {"DAALA_GORGON","DAALA_KNIGHT_HAMMER","DAALA_SCYLLA"}},
				{"ZANN", Locations = {"TYBER_ZANN_MERCILESS"}},
				{"DELURIN", Locations = {"DELURIN_GALAXY_DRAGON"}},
				{"TORPIN", Locations = {"TORPIN_PASSENGER"}},
			}
		},
		["TRELIX_LOCATION_SET"] = {
			Hero_Squadron = "TRELIX_INDENTURE",
			NoPlayerInit = true,
			Faction = "Pentastar",
			PopupHeader = "TRELIX_SELECTOR_HEADER",
			Options = {
				{"OTRO", Locations = {"OTRO_ENFORCER"}},
				{"DEKEET", Locations = {"DEKEET_INTRACTABLE"}},
				{"ZANN", Locations = {"TYBER_ZANN_MERCILESS"}},
				{"PARNELL", Locations = {"PARNELL_SUPER_TRANSPORT_XI"}},
				{"DROMMEL", Locations = {"DROMMEL_GUARDIAN"}},
			}
		},
		["IMPERIAL_ACE_LOCATION_SET"] = {
			Hero_Squadron = "IMPERIAL_ACE_SQUADRON",
			NoInit = true,
			PopupHeader = "IMPERIAL_ACE_SELECTOR_HEADER",
			Options = {
				{"TRICO", Locations = {"TRICO_PULA"}},
				{"COROSS", Locations = {"COROSS_VENGEANCE_II"}},
				{"SYSCO", Locations = {"VENGEANCE_JEREC"}},
				{"PELLAEON", Locations = {"PELLAEON_CAPTAIN_CHIMAERA","PELLAEON_GRAND_CHIMAERA","PELLAEON_REAPER","PELLAEON_MEGADOR"}},
				{"BETHROGG", Locations = {"BETHROGG_BEHEMOTH"}},
				{"VANKO", Locations = {"VANKO_INVINCIBLE"}},
			}
		},
		["DEATHRAIN_LOCATION_SET"] = {
			Hero_Squadron = "DEATHRAIN_PUNISHER_SQUADRON",
			NoInit = true,
			PopupHeader = "DEATHRAIN_SELECTOR_HEADER",
			Options = {
				{"KAINE", Locations = {"KAINE_REAPER"}},
				{"GRANT", Locations = {"GRANT_ORIFLAMME"}},
				{"WESSEL", Locations = {"WESSEL_EMPERORS_REVENGE"}},
				{"VERPALION", Locations = {"VERPALION_WARLORD"}},
				{"GENDARR", Locations = {"GENDARR_RELIANCE"}},
				{"DARIUS", Locations = {"DARIUS_SHIELD_BREAKER"}},
			}
		},
		["SCARLET_LOCATION_SET"] = {
			Hero_Squadron = "KATH_SCARLET",
			PopupHeader = "SCARLET_SELECTOR_HEADER",
			NoInit = true,
			Options = {
				{"LON_DONELL", Locations = {"LON_DONELL_DETAINER"}},
				{"RNEEKII", Locations = {"RNEEKLII_SUMPNTODO"}},
				{"SLAGORTH", Locations = {"SLAGORTH_ARC"}},
				{"HILMA", Locations = {"HILMA_BLOODTHIRSTY"}},
				{"SAIT", Locations = {"SAIT_BLACKGUARD"}},
				{"SORORITY", Locations = {"VEILED_QUEEN_SAVRIP"}},
				{"ZAN_DANE", Locations = {"DANE_SWEET_VICTORY"}},
				{"TARGRIM", Locations = {"TARGRIM_QUASAR"}},
				{"RENTHAL", Locations = {"RENTHALS_VIGILANCE"}},
				{"THALASSIAN", Locations = {"THALASSIAN_HARMZUAY"}},
				{"AYCEN", Locations = {"AYCEN_FREEJACK"}},
				{"XUFUSH", Locations = {"XUFUSH_FALOHSUI"}},
				{"SKANDREI", Locations = {"SKANDREI_BANDITS"}},
				{"COORSHA", Locations = {"COORSHAS_CROSS"}},
				{"ARDELLA", Locations = {"ARDELLA_SMOKESWIMMER"}},
				{"DREDNAR", Locations = {"DREDNAR_SABLE_III"}},
				{"VULTURE_PIRATES", Locations = {"VULTURE_PIRATES"}},
				{"LOOSE_CANNON", Locations = {"LOOSE_CANNON_PIRATES"}},
				{"MIKTISS", Locations = {"MIKTISS_ASAGOV_RAIDER"}},
				{"KAEROBANI", Locations = {"KAEROBANI_INTERDICTOR"}},
			}
		},
		["SSURUSSK_LOCATION_SET"] = {
			Hero_Squadron = "SSURUSSK_NEBULA_RAIDERS",
			PopupHeader = "SSURUSSK_SELECTOR_HEADER",
			NoInit = true,
			Options = {
				{"LON_DONELL", Locations = {"LON_DONELL_DETAINER"}},
				{"RNEEKII", Locations = {"RNEEKLII_SUMPNTODO"}},
				{"SLAGORTH", Locations = {"SLAGORTH_ARC"}},
				{"HILMA", Locations = {"HILMA_BLOODTHIRSTY"}},
				{"SAIT", Locations = {"SAIT_BLACKGUARD"}},
				{"SORORITY", Locations = {"VEILED_QUEEN_SAVRIP"}},
				{"ZAN_DANE", Locations = {"DANE_SWEET_VICTORY"}},
				{"TARGRIM", Locations = {"TARGRIM_QUASAR"}},
				{"RENTHAL", Locations = {"RENTHALS_VIGILANCE"}},
				{"THALASSIAN", Locations = {"THALASSIAN_HARMZUAY"}},
				{"AYCEN", Locations = {"AYCEN_FREEJACK"}},
				{"XUFUSH", Locations = {"XUFUSH_FALOHSUI"}},
				{"SKANDREI", Locations = {"SKANDREI_BANDITS"}},
				{"COORSHA", Locations = {"COORSHAS_CROSS"}},
				{"ARDELLA", Locations = {"ARDELLA_SMOKESWIMMER"}},
				{"DREDNAR", Locations = {"DREDNAR_SABLE_III"}},
				{"VULTURE_PIRATES", Locations = {"VULTURE_PIRATES"}},
				{"LOOSE_CANNON", Locations = {"LOOSE_CANNON_PIRATES"}},
				{"MIKTISS", Locations = {"MIKTISS_ASAGOV_RAIDER"}},
				{"KAEROBANI", Locations = {"KAEROBANI_INTERDICTOR"}},
			}
		},
		["STORMTROOPER_X_LOCATION_SET"] = {
			Hero_Squadron = "X_ROGUE_IMPERIAL_SQUADRON",
			PopupHeader = "X_SELECTOR_HEADER",
			NoInit = true,
			Options = {
				{"LON_DONELL", Locations = {"LON_DONELL_DETAINER"}},
				{"RNEEKII", Locations = {"RNEEKLII_SUMPNTODO"}},
				{"SLAGORTH", Locations = {"SLAGORTH_ARC"}},
				{"HILMA", Locations = {"HILMA_BLOODTHIRSTY"}},
				{"SAIT", Locations = {"SAIT_BLACKGUARD"}},
				{"SORORITY", Locations = {"VEILED_QUEEN_SAVRIP"}},
				{"ZAN_DANE", Locations = {"DANE_SWEET_VICTORY"}},
				{"TARGRIM", Locations = {"TARGRIM_QUASAR"}},
				{"RENTHAL", Locations = {"RENTHALS_VIGILANCE"}},
				{"THALASSIAN", Locations = {"THALASSIAN_HARMZUAY"}},
				{"AYCEN", Locations = {"AYCEN_FREEJACK"}},
				{"XUFUSH", Locations = {"XUFUSH_FALOHSUI"}},
				{"SKANDREI", Locations = {"SKANDREI_BANDITS"}},
				{"COORSHA", Locations = {"COORSHAS_CROSS"}},
				{"ARDELLA", Locations = {"ARDELLA_SMOKESWIMMER"}},
				{"DREDNAR", Locations = {"DREDNAR_SABLE_III"}},
				{"VULTURE_PIRATES", Locations = {"VULTURE_PIRATES"}},
				{"LOOSE_CANNON", Locations = {"LOOSE_CANNON_PIRATES"}},
				{"MIKTISS", Locations = {"MIKTISS_ASAGOV_RAIDER"}},
				{"KAEROBANI", Locations = {"KAEROBANI_INTERDICTOR"}},
			}
		},
		["SOONTIR_FEL_GRAY_LOCATION_SET"] = {
			Hero_Squadron = "SOONTIR_FEL_GRAY_SQUADRON",
			PopupHeader = "SOONTIR_FEL_GRAY_SELECTOR_HEADER",
			--Split the options among the Fels, with the children tending to get the later options
			Options = {
				{"THRAWN", Locations = {"THRAWN_GREY_WOLF"}},
				{"PARCK", Locations = {"PARCK_STRIKEFAST"}},
				{"STENT", Locations = {"STENT_THRAWNS_HAND"}},
				{"THRAWN_CLONE", Locations = {"THRAWN_CLONE_EVISCERATOR"}},
			}
		},
		["CHAK_FEL_LOCATION_SET"] = {
			Hero_Squadron = "CHAK_FEL_SQUADRON",
			NoInit = true,
			PopupHeader = "CHAK_FEL_SELECTOR_HEADER",
			Options = {
				{"SIATH", Locations = {"SIATH_BATTLEHAMMER"}},
				{"PARCK", Locations = {"PARCK_STRIKEFAST"}},
				{"FEROB", Locations = {"FEROB_IRON_FIST"}},
				{"THRAWN", Locations = {"THRAWN_GREY_WOLF"}},
				{"THRAWN_CLONE", Locations = {"THRAWN_CLONE_EVISCERATOR"}},
			}
		},
		["JAGGED_FEL_LOCATION_SET"] = {
			Hero_Squadron = "JAGGED_FEL_SQUADRON",
			NoInit = true,
			PopupHeader = "JAGGED_FEL_SELECTOR_HEADER",
			Options = {
				{"STENT", Locations = {"STENT_THRAWNS_HAND"}},
				{"NIRIZ", Locations = {"NIRIZ_ADMONITOR"}},
				{"THRAWN", Locations = {"THRAWN_GREY_WOLF"}},
				{"THRAWN_CLONE", Locations = {"THRAWN_CLONE_EVISCERATOR"}},
			}
		},
		["TALDIRA_LOCATION_SET"] = {
			Hero_Squadron = "TALDIRA_SQUADRON_SPACE",
			NoInit = true,
			PopupHeader = "TALDIRA_SELECTOR_HEADER",
			--X-wing series related people and the scavenged carrier hero
			Options = {
				{"VANTAI", Locations = {"VANTAI_MOONSHADOW"}},
				{"YONKA", Locations = {"YONKA_FREEDOM"}},
				{"BELL", Locations = {"BELL_ENDURANCE","BELL_SWIFT_LIBERTY"}},
				{"MASSA", Locations = {"MASSA_LUCREHULK_CARRIER","MASSA_LUCREHULK_AUXILIARY"}},
			}
		},
		["WEDGE_ROGUES_LOCATION_SET"] = {
			Hero_Squadron = "WEDGE_ANTILLES_ROGUE_TEAM",
			PopupHeader = "ANTILLES_ROGUE_SELECTOR_HEADER",
			--Mostly locations where they were known to have been stationed, with a noted fighter commander for good measure
			Options = {
				{"ACKBAR", Locations = {"HOME_ONE","GALACTIC_VOYAGER","ACKBAR_GUARDIAN"}, GroundPerceptions = {"Home_One_In_Orbit","Galactic_Voyager_In_Orbit","Ackbar_Guardian_In_Orbit"}},
				{"RAGAB", Locations = {"RAGAB_EMANCIPATOR"}, GroundPerceptions = {"Ragab_In_Orbit"}},
				{"BELL", Locations = {"BELL_ENDURANCE","BELL_SWIFT_LIBERTY"}, GroundPerceptions = {"Bell_Endurance_In_Orbit","Bell_Swift_Liberty_In_Orbit"}},
				{"TALLON", Locations = {"TALLON_SILENT_WATER"}, GroundPerceptions = {"Tallon_In_Orbit"}},
			},
			GroundCompany = "Wedge_Antilles_Rogue_Team",
			Faction = "Rebel"
		},
		["TYCHO_ROGUES_LOCATION_SET"] = {
			Hero_Squadron = "TYCHO_CELCHU_ROGUE_TEAM",
			PopupHeader = "CELCHU_ROGUE_SELECTOR_HEADER",
			NoInit = true,
			Options = {
				{"WEDGE", Locations = {"WEDGE_LUSANKYA"}, GroundPerceptions = {"Wedge_Lusankya_In_Orbit"}},
				{"ACKBAR", Locations = {"HOME_ONE","GALACTIC_VOYAGER","ACKBAR_GUARDIAN"}, GroundPerceptions = {"Home_One_In_Orbit","Galactic_Voyager_In_Orbit","Ackbar_Guardian_In_Orbit"}},
				{"RAGAB", Locations = {"RAGAB_EMANCIPATOR"}, GroundPerceptions = {"Ragab_In_Orbit"}},
				{"BELL", Locations = {"BELL_ENDURANCE","BELL_SWIFT_LIBERTY"}, GroundPerceptions = {"Bell_Endurance_In_Orbit","Bell_Swift_Liberty_In_Orbit"}},
				{"TALLON", Locations = {"TALLON_SILENT_WATER"}, GroundPerceptions = {"Tallon_In_Orbit"}},
				{"BRAND", Locations = {"BRAND_INDOMITABLE","BRAND_YALD"}, GroundPerceptions = {"Brand_Indomitable_In_Orbit","Brand_Yald_In_Orbit"}},
			},
			Faction = "Rebel",
			GroundCompany = "Tycho_Celchu_Rogue_Team",
		},
		["WEDGE_WRAITH_LOCATION_SET"] = {
			Hero_Squadron = "WRAITH_SQUADRON_SPACE",
			PopupHeader = "WRAITH_SELECTOR_HEADER",
			NoInit = true,
			--Known location, intel guy, and Bell gets everyone as her perk
			Options = {
				{"DRAYSON", Locations = {"DRAYSON_NEW_HOPE"}, GroundPerceptions = {"Drayson_New_Hope_In_Orbit"}},
				{"HAN_SOLO_MON_REMONDA", Locations = {"HAN_SOLO_MON_REMONDA"}, GroundPerceptions = {"Han_Solo_Mon_Remonda_In_Orbit"}},
				{"BELL", Locations = {"BELL_ENDURANCE","BELL_SWIFT_LIBERTY"}, GroundPerceptions = {"Bell_Endurance_In_Orbit","Bell_Swift_Liberty_In_Orbit"}},
			},
			Faction = "Rebel",
		},
		["SALMY_LOCATION_SET"] = {
			Hero_Squadron = "SALM_Y-WING_SQUADRON",
			PopupHeader = "SALM_SELECTOR_HEADER",
			--Known locations, fighter commanders, and locations distinct from Rogues
			Options = {
				{"VANTAI", Locations = {"VANTAI_MOONSHADOW"}},
				{"BURKE", Locations = {"BURKE_REMEMBER_ALDERAAN"}},
				{"KALBACK", Locations = {"KALBACK_JUSTICE"}},
				{"ABAHT", Locations = {"ABAHT_INTREPID"}},
				{"HAN_SOLO_INTREPID", Locations = {"HAN_SOLO_INTREPID"}},
				{"MASSA", Locations = {"MASSA_LUCREHULK_CARRIER","MASSA_LUCREHULK_AUXILIARY"}},
			}
		},
		["SALMB_LOCATION_SET"] = {
			Hero_Squadron = "SALM_B-WING_SQUADRON",
			PopupHeader = "SALM_SELECTOR_HEADER",
			NoInit = true,
			Options = {
				{"VANTAI", Locations = {"VANTAI_MOONSHADOW"}},
				{"BURKE", Locations = {"BURKE_REMEMBER_ALDERAAN"}},
				{"KALBACK", Locations = {"KALBACK_JUSTICE"}},
				{"ABAHT", Locations = {"ABAHT_INTREPID"}},
				{"HAN_SOLO_INTREPID", Locations = {"HAN_SOLO_INTREPID"}},
				{"MASSA", Locations = {"MASSA_LUCREHULK_CARRIER","MASSA_LUCREHULK_AUXILIARY"}},
			}
		},
		["RANULF_TROMMER_LOCATION_SET"] = {
			Hero_Squadron = "RANULF_TROMMER_SEER_SQUADRON",
			PopupHeader = "RANULF_TROMMER_SELECTOR_HEADER",
			NoInit = true,
			Options = {
				{"NANTZ", Locations = {"NANTZ_INDEPENDENCE","NANTZ_WATCHMEN"}},
				{"LANDO", Locations = {"LANDO_LIBERATOR","LANDO_ALLEGIANCE"}},
				{"DORAT", Locations = {"DORAT_ARROW_OF_SULLUST"}},
				{"IILLOR", Locations = {"IILLOR_CORUSCA"}},
				{"GRANT", Locations = {"GRANT_ORIFLAMME"}},
				{"SLIXIKE", Locations = {"SLIXIKE"}},
			}
		},
		["MYRSK_LOCATION_SET"] = {
			Hero_Squadron = "MYRSK_MANKVIM_SQUADRON",
			PopupHeader = "MYRSK_SELECTOR_HEADER",
			NoInit = true,
			Options = {
				{"GRUMBY", Locations = {"GRUMBY_NOTROPIS"}},
				{"BROLLYX", Locations = {"BROLLYX_DAUNTLESS"}},
				{"PHINEAS", Locations = {"PHINEAS_VSD"}},
				{"SUUB", Locations = {"SIIN_SUUB_PROCLAMATION"}},
			}
		},
		["WINDLE_LOCATION_SET"] = {
			Hero_Squadron = "WINDLE_HLAF_SQUADRON",
			PopupHeader = "WINDLE_SELECTOR_HEADER",
			NoInit = true,
			Options = {
				{"KRIN", Locations = {"KRIN_INVINCIBLE"}},
				{"WEPLINN", Locations = {"WEPLINN_ISD"}},
				{"SLOANE", Locations = {"SLOANE_ENFORCE"}},
				{"TAGGE", Locations = {"ULRIC_TAGGE"}},
			}
		},
		["VHORK_SQUADRON_LOCATION_SET"] = {
			Hero_Squadron = "VHORK_SQUADRON",
			PopupHeader = "VHORK_SELECTOR_HEADER",
			Options = {
				{"TAA_CHUME", Locations = {"TAA_CHUME_STAR_HOME"}},
				{"ISOLDER", Locations = {"ISOLDER_SONG_OF_WAR"}},
				{"ASTARTA", Locations = {"ASTARTA_SIREN_STAR"}},
			}
		},
		["AEGEL_SQUADRON_LOCATION_SET"] = {
			Hero_Squadron = "AEGEL_SQUADRON",
			PopupHeader = "AEGEL_SELECTOR_HEADER",
			Options = {
				{"ALYSSIA", Locations = {"ALYSSIA_STARSONG"}},
				{"CHELIK", Locations = {"CHELIK_DANGEROUS_DANCE"}},
				{"GRAY", Locations = {"GRAY_KENDALL"}},
			}
		},
		["OBEROS_LOCATION_SET"] = {
			Hero_Squadron = "OBEROS_KIMOGILA_SQUADRON",
			PopupHeader = "OBEROS_SELECTOR_HEADER",
			NoInit = true,
			Options = {
				{"GANIS", Locations = {"GANIS_NAL_HUTTA_JEWEL"}},
				{"TOBBA", Locations = {"TOBBA_YTOBA"}},
				{"RIBOGA", Locations = {"RIBOGA_RIGHTFUL_DOMINION"}},
				{"MIKA", Locations = {"MIKA_TEMPEST"}},
				{"DARKSABER", Locations = {"DARKSABER"}},
			}
		},
	}

	if upgrade_object ~= nil then
		return heroes[upgrade_object]
	end
	return heroes
end