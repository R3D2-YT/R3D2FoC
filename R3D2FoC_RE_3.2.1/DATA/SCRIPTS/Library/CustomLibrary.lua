StoryUtil = require("eawx-util/StoryUtil")

--The first location in an enemy entry defines the capital
--SmallHero is a list of heroes for each era. Missing entries will default to era 1. Instead of lists, a number denoting an era to copy may be supplied
function Get_FTGU_Dummies()
	local dummies = {
		["Rebel"] = {
			DummyUnit = "Custom_GC_Rebel",
			PlayerStart = {"Bothawui"},
			Capital = "NewRep_Senate",
			Perception = "Is_Connected_To_Rebel",
			SmallHero = {
				{"Mon_Mothma_Team", "Luke_Skywalker_Jedi_Team", "Sovv_Dauntless","Tallon_Silent_Water"},
				[6] = {"Princess_Leia_Team", "Luke_Skywalker_Jedi_Team", "Sovv_Dauntless","Brand_Indomitable"},
				[7] = 6
			},
			RosterUnits = {
				"REPUBLIC_BOARDING_SHUTTLE","CORELLIAN_CORVETTE","CORELLIAN_GUNBOAT","AGAVE_CORVETTE","WARRIOR_GUNSHIP","BELARUS","CORONA",
				"SACHEEN","HAJEN","NEBULON_B_FRIGATE","NEBULON_B_TENDER","CC7700_E","QUASAR","MC30C","ALLIANCE_ASSAULT_FRIGATE",
				"DEFENDER_CARRIER","MC40A","LIBERATOR_CRUISER","MAJESTIC","DAUNTLESS","CALAMARI_CRUISER",
				"BAC","ENDURANCE","MC80B","NEBULA","REPUBLIC_SD","MOTHMA_STAR_DESTROYER","MC90","HOME_ONE_TYPE","BULWARK_III","BLUEDIVER",
				"MEDIATOR","MINI_VISCOUNT","VISCOUNT"
			},
			RosterCompanies = {
				--{"X4_Gunship_Squadron","X4_Gunship"},
				{"Rebel_Infantry_Squad","Rebel_Trooper"},{"Defense_Trooper_Squad","Defense_Trooper"},{"Rebel_Marine_Squad","Rebel_Marine"},
				{"Rebel_Infiltrator_Squad","Rebel_Infiltrator_Special"},{"Rebel_AAC_2_Company","AAC_2"},{"Rebel_T1B_Company","T1B_Tank"},
				{"Rebel_AA5_Company","AA5_Truck"},{"Rebel_SRV1_Company","SRV1"},{"Rebel_Snowspeeder_Wing","Snowspeeder"},
				{"Rebel_T2B_Company","T2B_Tank"},{"Rebel_Tracker_Company","Heavy_Tracker"},{"Rebel_MPTL_Company","MPTL"},
				{"Rebel_Vwing_Group","V-Wing"},{"Rebel_AAC_3_Company","AAC_3"},{"Rebel_T3B_Company","T3B_Tank"},
				{"Rebel_Gallofree_HTT_Company","Gallofree_HTT_Transport"},{"Rebel_Freerunner_Company","Freerunner"},{"Rebel_T4B_Company","T4B_Tank"}
			}
		},
		["Empire"] = {
			DummyUnit = "Custom_GC_Empire",
			PlayerStart = {"Orinda"},
			Capital = "Remnant_Capital",
			Perception = "Is_Connected_To_Empire",
			SmallHero = {
				{"Pestage_Team", "Kermen_Belligerent", "Krennel_Reckoning","Tal_Ashen_Team"},
				{"Ysanne_Isard_Team", "Brashin_Inquisitor", "Devlia_IEC","Convarion_Corrupter"},
				{"Thrawn_Chimaera", "Brandei_Judicator", "General_Covell_Team","Drost_Team"},
				{"Emperor_Palpatine_Team", "Cronal_Singularity", "Klev_Frigate_Devastator"},
				{"Carnor_Jax_Team", "Wessel_Emperors_Revenge", "Banjeer_Neutron","Manos_Team","Kooloota_Team"},
				{"Daala_Gorgon", "Ardax_Vendetta", "Fredja_Team","Sivron_Team"},
				{"Pellaeon_Grand_Chimaera", "Rogriss_Agonizer", "Navett_Team","Ascian"}
			},
			RosterUnits = {
				"IPV1_SYSTEM_PATROL_CRAFT", "CRUSADER_GUNSHIP","LANCER_FRIGATE","NEBULON_B_EMPIRE","STAR_GALLEON",
				"CARRACK_CRUISER","STRIKE_CRUISER","EIDOLON","ESCORT_CARRIER","DREADNAUGHT_EMPIRE","GENERIC_INTERDICTOR_CRUISER",
				"VINDICATOR_CRUISER","GENERIC_ACCLAMATOR_ASSAULT_SHIP_II","GENERIC_VICTORY_DESTROYER",
				"GENERIC_VICTORY_DESTROYER_TWO","GENERIC_PROCURSATOR","GENERIC_DOMINATOR","GENERIC_STAR_DESTROYER",
				"GENERIC_TECTOR","GENERIC_STAR_DESTROYER_TWO","GENERIC_ALLEGIANCE","GENERIC_PRAETOR","GENERIC_EXECUTOR",
				"COMBAT_ESCORT_CARRIER","CRIMSON_VICTORY","GENERIC_TAGGE_BATTLECRUISER","HUNTER_KILLER_PROBOT",
				"MTC_SENSOR","MTC_SUPPORT","WORLD_DEVASTATOR_CAPITAL","SOVEREIGN","ECLIPSE_STAR_DESTROYER","Imperial_Boarding_Shuttle"
			},
			RosterCompanies = {
				{"YE_4_Squadron","YE_4_Gunship"},{"Beta_ETR_3_Squadron","Beta_Escort_Transport"},{"Delta_JV7_Squadron","Delta_JV7_Shuttle"},
				{"Imperial_Navy_Trooper_Squad","Navy_Trooper"},
				{"Imperial_Army_Guard_Squad","Army_Guard"},{"Imperial_Army_Trooper_Squad","Armytrooper"},{"Imperial_Compforce_Assault_Squad","Compforce_Assault_Trooper"},
				{"Imperial_Galactic_Marine_Squad","Imperial_Galactic_Marine_Rifle"},{"Imperial_Navy_Commando_Squad","Navy_Commando"},{"Imperial_ISB_Infiltrator_Squad","ISB_Infiltrator_Grenadier"},
				{"Imperial_Stormtrooper_Squad","Stormtrooper_Plex"},{"Imperial_Ysalamiri_Stormtrooper_Squad","Ysalamiri_Stormtrooper","Myrkr"},{"Imperial_Dark_Stormtrooper_Squad","Dark_Stormtrooper_Gunner_Heavy","Byss"},
				{"Imperial_Scout_Trooper_Infantry_Squad","Scout_Trooper_Carbine"},{"Imperial_Storm_Commando_Squad","Storm_Commando"},{"Imperial_Jumptrooper_Squad","Jumptrooper_Gunner"},
				{"Imperial_74Z_Bike_Company","Scout_Trooper"},{"Imperial_Dwarf_Spider_Droid_Company","Imperial_Dwarf_Spider_Droid"},{"Noghri_Assassin_Squad","Noghri_Assassin_Disruptor","Honoghr"},
				{"Imperial_Dark_Jedi_Squad","Dark_Empire_Jedi","Byss"},{"Imperial_Chrysalide_Company","Chrysalide","Byss"},
				{"Imperial_PX10_Company","PX10"},{"Imperial_AT_PT_Company","AT_PT_Walker"},{"Imperial_AT_ST_Company","AT_ST_Walker"},
				{"Imperial_AT_ST_A_Company","AT_ST_A_Walker"},{"Imperial_Chariot_LAV_Company","Chariot_LAV_Combat"},{"Imperial_AT_AA_Company","AT_AA_Walker"},
				{"Imperial_TNT_Company","Imperial_Treaded_Neutron_Torch"},{"Imperial_S_1_Firehawke_Company","S_1_Firehawke"},{"Imperial_Deathhawk_Group","Deathhawk"},
				{"Imperial_SPMAG_Company","SPMAG_Walker"},{"Imperial_IDT_Group","IDT"},{"Imperial_PX4_Company","PX4"},
				{"Imperial_A5_Juggernaut_Company","A5_Juggernaut"},{"Imperial_A5RX_Company","A5RX"},{"Imperial_AT_AT_Company","AT_AT_Walker"},
				{"Imperial_AT_AT_Refit_Company","AT_AT_Walker_Refit"},{"Imperial_XR85_Company","XR85"}
			}
		},
		["EmpireoftheHand"] = {
			DummyUnit = "Custom_GC_EotH",
			PlayerStart = {"Rapacc","Pesfavri"},
			Capital = "U_Ground_Palace",
			Perception = "Is_Connected_To_EotH",
			SmallHero = {
				{"Parck_Strikefast", "Niriz_Admonitor", "Hand_of_Judgement_Team"}
			},
			RosterUnits = {
				"KYNIGOS","SYZYGOS","MUQARAEA","BAOMU","FRUORO","ORMOS","ROHKEA","KUURO","PROLIPSI","CHAF_DESTROYER","EFODIO_FLEET_TENDER","PELTAST","CHISS_STAR_DESTROYER","SYNDIC_DESTROYER","PHALANX_DESTROYER","INTEGO_DESTROYER"
			},
			RosterCompanies = {
				{"Phalanx_Trooper_Squad","Phalanx_Trooper"},{"EotH_Kirov_Brigade","Kirov"},{"Flame_Tank_Company","Flame_Tank"},
				{"AirStraeker_Company","Airstraeker"},{"RFT_Brigade","RFT"},{"MMT_Brigade","MMT"},
				{"Mortar_Company","Plasma_Mortar"},{"Gilzean_Brigade","Gilzean"}
			}
		},
		["Corporate_Sector"] = {
			DummyUnit = "Custom_GC_CSA",
			PlayerStart = {"Ession","Saffalore"},
			Capital = "CSA_Capital",
			Perception = "Is_Connected_To_CSA",
			SmallHero = {
				{"Karrek_Flim_Team", "Weplinn_ISD", "Krin_Invincible","Fasser_Team"}
			},
			RosterUnits = {--No point in putting ship market units down
				"ETTI_LIGHTER","MARAUDER_CRUISER","NEBULON_B_ZSINJ","CC7700","GALLEON","GENERIC_GLADIATOR","MTC_COMBAT","MTC_SUPPORT",
				"DREADNAUGHT_CARRIER","LIBERATOR_CRUISER","RECUSANT","GENERIC_VICTORY_DESTROYER","BULWARK_I","DAUNTLESS",
				"INVINCIBLE_CRUISER","BULWARK_III","LUCREHULK_CSA"
			},
			RosterCompanies = {
				{"Citadel_Cruiser_Squadron","Citadel_Cruiser"},{"Gozanti_Cruiser_Squadron","Gozanti_Cruiser"},
				{"CSA_B1_Droid_Squad","B1_CSA"},{"Espo_Squad","Espo"},{"Heavy_Espo_Squad","Heavy_Espo"},
				{"CSA_Destroyer_Droid_Company","Destroyer_Droid"},{"CSA_64Y_Company","CSA_64Y_Sled"},{"X10_Group","X10_Groundcruiser"},
				{"Class_I_Company","Class_I_Droid"},{"Espo_Walker_Squad","Espo_Walker"},{"GX12_Company","GX12_Hovervan"},{"SX20_Company","SX20_Airskimmer"},
				{"Hailfire_Company","Hailfire"},{"CA_Artillery_Company","CA_Artillery"},{"Persuader_Company","Persuader"},
				{"JX40_Group","JX40"},{"Strikebreaker_Group","Strikebreaker"},{"K222_Group","K222_Interceptor"}
			}
		},
		["Hutt_Cartels"] = {
			DummyUnit = "Custom_GC_Hutts",
			PlayerStart = {"Nar_Haaska","Da_Soocha"},
			Capital = "Hutt_Palace",
			Perception = "Is_Connected_To_Hutts",
			SmallHero = {
				{"Smebba_Dunk_Team", "Troonol_Agrelcu_Haalta", "Riboga_Rightful_Dominion", "Parella_Team"}
			},
			RosterUnits = {
				"HUTT_BOARDING_SHUTTLE","WARLORD_CRUISER","HEAVY_MINSTREL_YACHT","RAKA_FREIGHTER_TENDER","UBRIKKIAN_FRIGATE",
				"KALOTH_BATTLECRUISER","JUVARD_FRIGATE","BARABBULA_FRIGATE","HUTT_STAR_GALLEON","KOSSAK_FRIGATE","TARRADA_FRIGATE",
				"UBRIKKIAN_CRUISER_GCW","TEMPEST_CRUISER","BATIL_CARRIER","SZAJIN_CRUISER","KARAGGA_DESTROYER",
				"CHELANDION_CRUISER","VONTOR_DESTROYER","VORACIOUS_CARRIER","KARABOS_DESTROYER","DORBULLA_WARSHIP","DARKSABER",
				"SUPER_TRANSPORT_VII_INTERDICTOR","IPV1_GUNBOAT","MARAUDER_MISSILE_CRUISER","DREADNAUGHT_LASERS","VENATOR_REFIT"
			},
			RosterCompanies = {
				{"Hutt_Guard_Squad","Hutt_Guard_Carbine"},{"Hutt_Armored_Platoon","Armored_Hutt"},{"Hutt_Flare_S_Company","Hutt_Flare_S"},{"Hutt_Airhook_Company","Hutt_Airhook"},
				{"Hutt_Desert_Sail20_Company","Hutt_Desert_Sail20"},{"Hutt_Personnel_Skiff_IV_Company","Hutt_Personnel_Skiff_IV"},{"Hutt_Bantha_II_Skiff_Company","Hutt_Bantha_II_Skiff"},
				{"Hutt_SuperHaul_II_Skiff_Company","SuperHaul_II_Skiff"},{"Hutt_AA_Skiff_Company","Hutt_AA_Skiff"},{"Hutt_AST5_Company","Hutt_AST5"},
				{"Luxury_Yacht_Company","Luxury_Barge"},{"Hutt_Pod_Walker_Company","Hutt_Pod_Walker"},{"WLO5_Tank_Company","WLO5_Tank"},
				{"MAL_Rocket_Vehicle_Company","MAL_Rocket_Vehicle"},{"Hutt_Guardian_5E_Speeder_Company","Hutt_Guardian_5E_Speeder"},
			}
		},
		["Hapes_Consortium"] = {
			DummyUnit = "Custom_GC_Hapes",
			PlayerStart = {"Hapes"},
			Capital = "Hapan_Palace",
			Perception = "Is_Connected_To_Hapes",
			SmallHero = {
				{"Taa_Chume_Star_Home", "Isolder_Song_of_War", "Livette_Team","Beed_Thane_Team"}
			},
			RosterUnits = {
				"BAIDAM","FLARE","BETA_CRUISER","NOVA_CRUISER","NOVA_CRUISER_REFIT","STELLA","CHARUBAH_FRIGATE","OLANJI_FRIGATE","MAGNETAR","PULSAR","BATTLEDRAGON","CORONAL","TEREPHON_CRUISER","MIST_CARRIER","NEUTRON_CRUISER","HAPAN_BOARDING_SHUTTLE"
			},
			RosterCompanies = {
				{"Raptor_Gunship_Squadron","Raptor_Gunship"},
				{"HRG_Commando_Squad","HRG_Commando"},{"Hapan_Infantry_Squad","Hapan_House_Guard"},{"Maluri_Infantry_Squad","Maluri_House_Guard"},
				{"Requud_Infantry_Squad","Requud_House_Guard"},{"Galney_Infantry_Squad","Galney_House_Guard"},{"Hapan_LightTank_Company","Hapan_LightTank"},
				{"Hapan_Artillery_Company","Hapan_Artillery"},{"Hapan_Transport_Company","Hapan_Ground_Transport"},{"Hapan_Silanus_Company","Hapan_Silanus"},
				{"Hapan_HeavyTank_Company","Hapan_HeavyTank"},{"Hapan_Gunboat_Company","Hapan_Gunboat"}
			}
		},
		["Greater_Maldrood"] = {
			DummyUnit = "Custom_GC_Maldrood",
			PlayerStart = {"Centares"},
			Capital = "Maldrood_Capital",
			Perception = "Is_Connected_To_Maldrood",
			SmallHero = {
				{"Treuten_13X", "Kosh_Lancet", "Ramier_Team","Tanniel_Team"}
			},
			RosterUnits = {
				"CUSTOMS_CORVETTE","ADZ","TARTAN_PATROL_CRUISER","VIGIL","STAR_GALLEON","CARRACK_CRUISER",
				"STRIKE_CRUISER","STRIKE_CRUISER_GORATH","GENERIC_PURSUIT","STRIKE_INTERDICTOR",
				"BROADSIDE_CRUISER","VINDICATOR_CRUISER","GENERIC_IMPERIAL_II_FRIGATE",
				"GENERIC_ACCLAMATOR_ASSAULT_SHIP_II","GENERIC_VICTORY_DESTROYER","CRIMSON_VICTORY","GENERIC_DOMINATOR",
				"GENERIC_STAR_DESTROYER","GENERIC_TECTOR","ALTOR_REPLENISHMENT_SHIP","GENERIC_BELLATOR",
				"COMBAT_ESCORT_CARRIER","GENERIC_TAGGE_BATTLECRUISER","HUNTER_KILLER_PROBOT","MTC_SENSOR","MTC_SUPPORT",
				"SOVEREIGN","ECLIPSE_STAR_DESTROYER"
			},
			RosterCompanies = {
				{"Guardian_Squadron","Guardian_Cruiser"},{"Delta_JV7_Squadron","Delta_JV7_Shuttle"},
				{"Imperial_Army_Guard_Squad","Army_Guard"},{"Imperial_Army_Trooper_Squad","Armytrooper"},{"Imperial_Compforce_Assault_Squad","Compforce_Assault_Trooper"},
				{"Imperial_Galactic_Marine_Squad","Imperial_Galactic_Marine_Rifle"},{"Imperial_Navy_Commando_Squad","Navy_Commando"},{"Imperial_ISB_Infiltrator_Squad","ISB_Infiltrator_Grenadier"},
				{"Imperial_Stormtrooper_Squad","Stormtrooper_Plex"},{"Imperial_Dark_Stormtrooper_Squad","Dark_Stormtrooper_Gunner_Heavy","Byss"},{"Imperial_Fleet_Commando_Squad","Fleet_Commando_Sniper"},
				{"Imperial_Storm_Commando_Squad","Storm_Commando"},{"Imperial_Jumptrooper_Squad","Jumptrooper_Gunner"},
				{"Imperial_74Z_Bike_Company","Scout_Trooper"},{"Imperial_Dark_Jedi_Squad","Dark_Empire_Jedi","Byss"},{"Imperial_Chrysalide_Company","Chrysalide","Byss"},
				{"Imperial_AT_RT_Company","Imperial_AT_RT_Walker"},{"Imperial_ISP_Company","Imperial_Infantry_Support_Platform"},{"Imperial_RTT_Company","Reconnaissance_Troop_Transporter"},
				{"Imperial_INT4_Group","INT-4"},{"Imperial_AT_AA_Company","AT_AA_Walker"},{"Imperial_Missile_Artillery_Company","Imperial_Missile_Artillery"},
				{"Imperial_2M_Company","2M_Repulsor_Tank"},{"Imperial_SA5_Company","Swift_Assault_5"},{"Imperial_MAAT_Group","MAAT"},
				{"Imperial_A5_Juggernaut_Company","A5_Juggernaut"},{"Imperial_Heavy_Recovery_Vehicle_Company","Heavy_Recovery_Vehicle"},{"Imperial_XR85_Company","XR85"}
			}
		},
		["Pentastar"] = {
			DummyUnit = "Custom_GC_Pentastar",
			PlayerStart = {"Bastion"},
			Capital = "PA_Capital",
			Perception = "Is_Connected_To_Pentastar",
			SmallHero = {
				{"Ardus_Kaine_Team", "Dynamic_Besk", "Trico_Star_Destroyer","Jerec_Team"}
			},
			RosterUnits = {
				"RAIDER_CORVETTE","TRENCHANT","TARTAN_PATROL_CRUISER","ADZ","CORELLIAN_BUCCANEER",
				"VICTORY_II_FRIGATE","ESCORT_CARRIER","BATTLE_HORN","DREADNAUGHT_EMPIRE",
				"IMPERIAL_CARGO_SHIP","GENERIC_INTERDICTOR_CRUISER","ENFORCER","GENERIC_ACCLAMATOR_ASSAULT_SHIP_LEVELER",
				"GENERIC_VENATOR","GENERIC_PROCURSATOR","GENERIC_STAR_DESTROYER","GENERIC_TECTOR","GENERIC_SECUTOR",
				"GENERIC_PRAETOR_CARRIER","GENERIC_MANDATOR_III",
				"COMBAT_ESCORT_CARRIER","CRIMSON_VICTORY","GENERIC_TAGGE_BATTLECRUISER","HUNTER_KILLER_PROBOT","MTC_SENSOR","MTC_SUPPORT",
				"SOVEREIGN","ECLIPSE_STAR_DESTROYER"
			},
			RosterCompanies = {
				{"Decimator_Squadron","VT49_Decimator"},{"Delta_JV7_Squadron","Delta_JV7_Shuttle"},
				{"Pentastar_Enforcer_Trooper_Squad","Enforcer_Trooper"},
				{"Imperial_Army_Guard_Squad","Army_Guard"},{"Pentastar_Army_Trooper_Squad","Pentastar_Armytrooper"},{"Imperial_Compforce_Assault_Squad","Compforce_Assault_Trooper"},
				{"Imperial_Galactic_Marine_Squad","Imperial_Galactic_Marine_Rifle"},{"Imperial_IntSec_Operator_Squad","IntSec_Operator_Disruptor"},
				{"Imperial_Stormtrooper_Squad","Stormtrooper_Plex"},{"Imperial_Dark_Stormtrooper_Squad","Dark_Stormtrooper_Gunner_Heavy","Byss"},{"Imperial_Army_Commando_Squad","Army_Commando"},
				{"Imperial_Guardian_Protector_Squad","Guardian_Protector"},{"Imperial_Storm_Commando_Squad","Storm_Commando"},{"Imperial_Jumptrooper_Squad","Jumptrooper_Gunner"},
				{"Pentastar_Dark_Jedi_Squad","Dark_Jedi_InQuestor","Bastion"},{"Imperial_Dark_Jedi_Squad","Dark_Empire_Jedi","Byss"},{"Imperial_Chrysalide_Company","Chrysalide","Byss"},
				{"Imperial_AT_PT_Company","AT_PT_Walker"},{"Imperial_Gaba18_Group","Gaba18"},{"Imperial_AT_DP_Company","AT_DP_Walker"},
				{"Imperial_TIE_Mauler_Company","TIE_Mauler"},{"Imperial_UT_AA_Company","UTAA"},{"Imperial_Heavy_Artillery_Company","Imperial_Heavy_Artillery"},
				{"Imperial_Century_Tank_Company","Century_Tank"},{"Imperial_Nemesis_Gunship_Group","Nemesis_Gunship"},{"Imperial_B5_Juggernaut_Company","B5_Juggernaut"},
				{"Imperial_C10_Siege_Tower_Company","C10_Siege_Tower"},{"Imperial_XR85_Company","XR85"}
			}
		},
		["Zsinj_Empire"] = {
			DummyUnit = "Custom_GC_Zsinj",
			PlayerStart = {"Serenno"},
			Capital = "Kamino_Capital",
			Perception = "Is_Connected_To_Zsinj",
			SmallHero = {
				{"Zsinj_Iron_Fist_VSD", "Trigit_Implacable", "Melvar_Team","Teubbo_Team"}
			},
			RosterUnits = {
				"CR90_ZSINJ","CR92_ASSASSIN","LANCER_FRIGATE","CORONA","ADZ","NEBULON_B_ZSINJ",
				"VENGEANCE_FRIGATE","STAR_GALLEON","SURVEYOR_FRIGATE","NEUTRON_STAR","DRAGON_HEAVY_CRUISER",
				"GENERIC_TWIN_WELL_CRUISER","GENERIC_VICTORY_DESTROYER_TWO","GENERIC_AGGRESSOR",
				"GENERIC_STAR_DESTROYER","GENERIC_STAR_DESTROYER_TWO","GENERIC_SORANNAN","GENERIC_VENGEANCE",
				"INTERCEPTOR_FRIGATE","ACTION_VI_SUPPORT","SUPER_TRANSPORT_XI_MODIFIED","SPACE_ARC_CRUISER",
				"COMBAT_ESCORT_CARRIER","CRIMSON_VICTORY","GENERIC_TAGGE_BATTLECRUISER","HUNTER_KILLER_PROBOT","MTC_SENSOR","MTC_SUPPORT",
				"SOVEREIGN","ECLIPSE_STAR_DESTROYER"
			},
			RosterCompanies = {
				{"YZ_775_Squadron","YZ_775_Freighter"},{"Delta_JV7_Squadron","Delta_JV7_Shuttle"},
				{"Imperial_Army_Guard_Squad","Army_Guard"},{"Imperial_Army_Trooper_Squad","Armytrooper"},
				{"Zsinj_EVO_Trooper_Squad","EVO_Trooper_Gunner_Light"},{"Imperial_Compforce_Assault_Squad","Compforce_Assault_Trooper"},
				{"Imperial_Galactic_Marine_Squad","Imperial_Galactic_Marine_Rifle"},{"Imperial_IntSec_Operator_Squad","IntSec_Operator_Disruptor"},
				{"Imperial_Stormtrooper_Squad","Stormtrooper_Plex"},{"Imperial_Dark_Stormtrooper_Squad","Dark_Stormtrooper_Gunner_Heavy","Byss"},
				{"Zsinj_Raptor_Squad","Raptor_Trooper"},{"Imperial_Storm_Commando_Squad","Storm_Commando"},{"Imperial_Jumptrooper_Squad","Jumptrooper_Gunner"},
				{"Zsinj_74Z_Bike_Company","Raptor_Scout_Trooper"},{"Imperial_Dark_Jedi_Squad","Dark_Empire_Jedi","Byss"},
				{"Zsinj_Night_Sister_Company","Night_Sister","Dathomir"},{"Imperial_Chrysalide_Company","Chrysalide","Byss"},
				{"Imperial_PX10_Company","PX10"},{"Imperial_ULAV_Company","Imperial_ULAV"},{"Imperial_Repulsor_Scout_Company","Repulsor_Scout"},
				{"Imperial_Chariot_LAV_Company","Chariot_LAV_Combat"},{"Imperial_AT_AP_Walker_Company","AT_AP_Walker"},{"Imperial_AT_AA_Company","AT_AA_Walker"},
				{"Imperial_APC_Company","Imperial_APC"},{"Imperial_SPMAT_Company","SPMAT_Walker"},{"Imperial_IDT_Group","IDT"},
				{"Imperial_TRSD_Company","Tracked_Shield_Disabler"},{"Imperial_A9_Fortress_Company","A9_Floating_Fortress"},{"Imperial_XR85_Company","XR85"},
				{"Imperial_Incinerator_Stormtrooper_Squad","Incinerator_Stormtrooper"},{"Imperial_Modified_LAAT_Group","Imperial_Modified_LAAT"}
			}
		},
		["Eriadu_Authority"] = {
			DummyUnit = "Custom_GC_Eriadu",
			PlayerStart = {"Talhovi","Eriadu"},
			Capital = "Eriadu_Capital",
			Perception = "Is_Connected_To_Eriadu",
			SmallHero = {
				{"Delvardus_Brilliant", "Hublin_Kabalian_Cross", "Johans_Team","Malcom_Team"}
			},
			RosterUnits = {
				"IPV1_SYSTEM_PATROL_CRAFT","IPV4","RAIDER_II_CORVETTE","ADZ","GALLEON","ARQUITENS",
				"EIDOLON","GENERIC_TWIN_WELL_CRUISER","GENERIC_GLADIATOR","GENERIC_IMPERIAL_I_FRIGATE",
				"GENERIC_VICTORY_DESTROYER","GENERIC_STAR_DESTROYER","GENERIC_STAR_DESTROYER_TWO",
				"GENERIC_ALLEGIANCE","TORPEDO_SPHERE","GENERIC_PRAETOR","GENERIC_BELLATOR","ASSERTOR",
				"COMBAT_ESCORT_CARRIER","CRIMSON_VICTORY","GENERIC_TAGGE_BATTLECRUISER","HUNTER_KILLER_PROBOT","MTC_SENSOR","MTC_SUPPORT",
				"SOVEREIGN","ECLIPSE_STAR_DESTROYER"
			},
			RosterCompanies = {
				{"Gamma_ATR_6_Squadron","Gamma_Assault_Transport"},{"Delta_JV7_Squadron","Delta_JV7_Shuttle"},
				{"Imperial_Army_Guard_Squad","Army_Guard"},{"Imperial_Army_Trooper_Squad","Armytrooper"},{"Imperial_Compforce_Assault_Squad","Compforce_Assault_Trooper"},
				{"Imperial_Galactic_Marine_Squad","Imperial_Galactic_Marine_Rifle"},{"Imperial_Army_Special_Missions_Squad","Army_Special_Missions"},{"Imperial_ISB_Infiltrator_Squad","ISB_Infiltrator_Grenadier"},
				{"Imperial_Stormtrooper_Squad","Stormtrooper_Plex"},{"Imperial_Dark_Stormtrooper_Squad","Dark_Stormtrooper_Gunner_Heavy","Byss"},{"Imperial_Army_Commando_Squad","Army_Commando"},
				{"Imperial_Storm_Commando_Squad","Storm_Commando"},{"Imperial_Jumptrooper_Squad","Jumptrooper_Gunner"},
				{"Imperial_64Y_Company","64Y_Sled"},{"Imperial_Dark_Jedi_Squad","Dark_Empire_Jedi","Byss"},{"Imperial_Chrysalide_Company","Chrysalide","Byss"},
				{"Imperial_AT_MP_Company","AT_MP_Walker"},{"Imperial_1L_Tank_Company","1L_Tank"},{"Imperial_Light_Artillery_Company","Imperial_Light_Artillery"},
				{"Imperial_AT_AA_Company","AT_AA_Walker"},{"Imperial_1M_Tank_Company","1M_Tank"},{"Imperial_Flashblind_Group","Flashblind"},
				{"Imperial_1H_Tank_Company","1H_Tank"},{"Imperial_TRMB_Company","Tracked_Mobile_Base"},{"Imperial_AT_AT_Company","AT_AT_Walker"},
				{"Imperial_Lancet_Group","Lancet_Air_Artillery"},{"Imperial_XR85_Company","XR85"}
			}
		},
	}
	
	return dummies
end

function Set_Tech()	
	dead_planet = FindPlanet("Despayre")
	if dead_planet ~= nil then
		Destroy_Planet("Despayre")
	end

	p_newrep = Find_Player("Rebel")
	p_empire = Find_Player("Empire")
	p_eoth = Find_Player("EmpireoftheHand")
	p_eriadu = Find_Player("Eriadu_Authority")
	p_pentastar = Find_Player("Pentastar")
	p_zsinj = Find_Player("Zsinj_Empire")
	p_maldrood = Find_Player("Greater_Maldrood")
	p_corporate = Find_Player("Corporate_Sector")
	p_hapes = Find_Player("Hapes_Consortium")
	p_hutts = Find_Player("Hutt_Cartels")
	

	if p_newrep.Is_Human() then
		Story_Event("ENABLE_BRANCH_NEWREP_FLAG")
	elseif p_empire.Is_Human() then
		Story_Event("ENABLE_BRANCH_EMPIRE_FLAG")
	elseif p_eoth.Is_Human() then
		Story_Event("ENABLE_BRANCH_EOTH_FLAG")
	elseif p_eriadu.Is_Human() then
		Story_Event("ENABLE_BRANCH_ERIADU_FLAG")
	elseif p_pentastar.Is_Human() then
		Story_Event("ENABLE_BRANCH_PENTASTAR_FLAG")
	elseif p_zsinj.Is_Human() then
		Story_Event("ENABLE_BRANCH_ZSINJ_FLAG")
	elseif p_maldrood.Is_Human() then
		Story_Event("ENABLE_BRANCH_TERADOC_FLAG")
	elseif p_corporate.Is_Human() then
		Story_Event("ENABLE_BRANCH_CORPORATE_SECTOR_FLAG")
	elseif p_hapes.Is_Human() then
		Story_Event("ENABLE_BRANCH_HAPES_CONSORTIUM_FLAG")
	elseif p_hutts.Is_Human() then
		Story_Event("FACTION_BRANCH_ENABLER_HUTT_CARTELS")
	end
	
	credits = Find_Player("local").Get_Credits()
	techLevel = (credits / 1000) + 1
	
	p_newrep.Give_Money(8000-credits)
	p_empire.Give_Money(8000-credits)
	p_eoth.Give_Money(8000-credits)
	p_eriadu.Give_Money(8000-credits)
	p_pentastar.Give_Money(8000-credits)
	p_zsinj.Give_Money(8000-credits)
	p_maldrood.Give_Money(8000-credits)
	p_corporate.Give_Money(8000-credits)
	p_hapes.Give_Money(8000-credits)
	p_hutts.Give_Money(8000-credits)
	
	if techLevel > 7 then
		techLevel = 7
	end
	
	if techLevel > 5 then
		StoryUtil.SetTechLevel(p_newrep, 2)
		StoryUtil.SetTechLevel(p_empire, 3)
		StoryUtil.SetTechLevel(p_eoth, 3)
		StoryUtil.SetTechLevel(p_eriadu, 3)
		StoryUtil.SetTechLevel(p_pentastar, 3)
		StoryUtil.SetTechLevel(p_zsinj, 3)
		StoryUtil.SetTechLevel(p_maldrood, 3)
		StoryUtil.SetTechLevel(p_corporate, 3)
		StoryUtil.SetTechLevel(p_hapes, 3)
		StoryUtil.SetTechLevel(p_hutts, 3)
	elseif techLevel > 3 then
		StoryUtil.SetTechLevel(p_newrep, 1)
		StoryUtil.SetTechLevel(p_empire, 2)
		StoryUtil.SetTechLevel(p_eoth, 2)
		StoryUtil.SetTechLevel(p_eriadu, 2)
		StoryUtil.SetTechLevel(p_pentastar, 2)
		StoryUtil.SetTechLevel(p_zsinj, 2)
		StoryUtil.SetTechLevel(p_maldrood, 2)
		StoryUtil.SetTechLevel(p_corporate, 2)
		StoryUtil.SetTechLevel(p_hapes, 2)
		StoryUtil.SetTechLevel(p_hutts, 2)
	end
	
	GlobalValue.Set("CURRENT_ERA", techLevel)
	
	if not p_newrep.Is_Human() then
		Story_Event("SET_NR_TECH")
	end
	
	if not p_empire.Is_Human() then
		Story_Event("SET_IR_TECH")
	end
	
	if not p_eoth.Is_Human() then
		Story_Event("SET_EH_TECH")
	end
	
	return techLevel
end

function Get_SSDS()
	return {
		{"Assertor", 5},
		{"Generic_Executor",2},
		{"Generic_Mandator_II",4},
		{"Generic_Mandator_III",4},
		{"Eclipse_Star_Destroyer",6},
		{"Generic_Bellator",3},
		{"Generic_Vengeance",3},
		{"Sovereign",6},
		{"Generic_Aramadia",4},
		{"Viscount",2}
	}
end

function Get_Full_Hero_File(era)
	local corenne = "eawx-mod-icw/spawn-sets/"
	local perera = {"EraOneStartSet", "EraTwoStartSet", "EraThreeStartSet", "EraFourStartSet", "EraFiveStartSet", "EraSixStartSet", "EraSevenStartSet"}
	return corenne .. perera[era]
end