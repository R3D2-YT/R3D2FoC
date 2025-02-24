function DefineRosterOverride(planet)
	planetTable = {
		ARDIS = "GENERIC_UR",
		CARRIVAR = "GENERIC_UR",
		CRAKULL = "GENERIC_UR",
		DURACE = "GENERIC_UR",
		EXPLUME_MINOR = "GENERIC_UR",
		GEROON = "GENERIC_UR",
		HOXIM = "GENERIC_UR",
		IOL = "GENERIC_UR",
		KARIEK = "GENERIC_UR",
		KILJI = "GENERIC_UR",
		LAKRA = "GENERIC_UR",
		MAKATAK = "GENERIC_UR",
		MUNLALI_MAFIR = "GENERIC_UR",
		NIHIL = "GENERIC_UR",
		OREEN = "GENERIC_UR",
		OSSERITON = "GENERIC_UR",
		PERANN_NEBULA = "GENERIC_UR",
		PRIMEA = "GENERIC_UR",
		RAKATA = "GENERIC_UR",
		RENNEK = "GENERIC_UR",
		RHAND = "GENERIC_UR",
		SUNRISE = "GENERIC_UR",
		TULPAA = "GENERIC_UR",
		TWILIGHT_VOID = "GENERIC_UR",
		UMARENK = "GENERIC_UR",
		VAGAR_PRAXUT = "GENERIC_UR",
		VOLIK = "GENERIC_UR",
		VUNHANNA = "GENERIC_UR",
		YASHUVHU = "GENERIC_UR",
		ZAKUUL = "GENERIC_UR",
		ZOSHA = "GENERIC_UR",
		LIZIL = "GENERIC_UR", --Hereafter be Killiks
		MURGO = "GENERIC_UR",
		QORIBU = "GENERIC_UR",
		SARM = "GENERIC_UR",
		SNEVU = "GENERIC_UR",
		TENUPE = "GENERIC_UR",
		TUSKENS_EYE = "GENERIC_UR",
		UTEGETU_NEBULA = "GENERIC_UR",
		WOTEBA = "GENERIC_UR",
		YOGGOY = "GENERIC_UR",
		SULLUST = "SULLUSTAN_HOME_GUARD",
		BAKURA = "BAKURANS",
		BALMORRA = "BALMORRANS",
		BYBLOS = "SIENAR",
		CORULAG = "SIENAR",
		LIANNA = "SIENAR",
		GYNDINE = "KDY",
		JAEMUS = "KDY",
		KUAT = "KDY",
		RZ7 = "HARDLINERS",
		HYPORI = "ZANN_CONSORTIUM",
		SALEUCAMI = "ZANN_CONSORTIUM",
		FELUCIA = "ZANN_CONSORTIUM",
		RYLOTH = "ZANN_CONSORTIUM",
		MINNTOOINE = "MONCAL",
		MON_CALAMARI = "MONCAL",
		PAMMANT = "MONCAL",
		NEW_COV = "YUTRANE",
		CHARDAAN = "YUTRANE",
		KALARBA = "YUTRANE",
		CHARUBAH = "HAPES_CONSORTIUM",
		HAPES = "HAPES_CONSORTIUM",
		GALLINORE = "HAPES_CONSORTIUM",
		RELEPHON = "HAPES_CONSORTIUM",
		ROQOO = "HAPES_CONSORTIUM",
		SHEDU_MAAD = "HAPES_CONSORTIUM",
		TEREPHON = "HAPES_CONSORTIUM",
		TRANSITORY_MISTS_I = "HAPES_CONSORTIUM",
		TRANSITORY_MISTS_II = "HAPES_CONSORTIUM",
		TRANSITORY_MISTS_III = "HAPES_CONSORTIUM",
	}
	
	return planetTable[planet]
end

function DefineUnitTable(faction, rosterOverride)
	
	if not (faction == "WARLORDS" or faction == "INDEPENDENT_FORCES") and rosterOverride == "ZANN_CONSORTIUM" then
		rosterOverride = nil
	end
	
	if faction == "REBEL" and rosterOverride == "KDY" then
		rosterOverride = "KDY_NR"
	end
	
	local Faction_Table = {
		EMPIRE = {
			Space_Unit_Table = {
				{"Beta_ETR_3_Squadron", 2}		
				,{"IPV1_System_Patrol_Craft", 5}
				,{"Crusader_Gunship", 5, StartYear = 12}				
				,{"Lancer_Frigate", 4}
				,{"Nebulon_B_Empire", 4, StartYear = 12}
				,{"Escort_Carrier", 3}
				,{"Carrack_Cruiser", 4}
				,{"Strike_Cruiser", 4, StartYear = 6}
				,{"Eidolon", 4, LastYear = 5}
				,{"Vindicator_Cruiser", 3}
				,{"Dreadnaught_Empire", 4}
				,{"Star_Galleon", 1}
				,{"Generic_Acclamator_Assault_Ship_II", 3}
				,{"Generic_Procursator", 2}
				,{"Generic_Victory_Destroyer", 3}
				,{"Generic_Victory_Destroyer_Two", 3}
				,{"Generic_Star_Destroyer_Two", 1}
				,{"Generic_Star_Destroyer", 1}
				,{"Generic_Tector", 1}
			},
			Land_Unit_Table = {
				{"Imperial_Army_Trooper_Squad", 4}
				,{"Imperial_Army_Guard_Squad", 3}		
				,{"Imperial_Stormtrooper_Squad", 2}
				,{"Imperial_Dwarf_Spider_Droid_Company", 2, StartYear = 12}
				,{"Imperial_Shadow_Stormtrooper_Squad", 0.3}		
				,{"Imperial_Scout_Trooper_Infantry_Squad", 1}			
				,{"Imperial_74Z_Bike_Company", 2}
				,{"Imperial_AT_ST_Company", 3}
				,{"Imperial_AT_ST_A_Company", 3, StartYear = 10}
				,{"Imperial_Chariot_LAV_Company", 3}
				,{"Imperial_S_1_Firehawke_Company", 2}
				,{"Imperial_PX4_Company", 1}			
				,{"Imperial_AT_AT_Company", 2}
				,{"Imperial_AT_AT_Refit_Company", 3, StartYear = 10}
				,{"Imperial_IDT_Group", 1}
				,{"Imperial_Deathhawk_Group", 1}
				,{"Imperial_SPMAG_Company", 1}
			},
			Groundbase_Table = {
				"E_Ground_Barracks",
                "E_Ground_Barracks",
                "E_Ground_Light_Vehicle_Factory",				
                "E_Ground_Heavy_Vehicle_Factory",
				"E_Ground_Advanced_Vehicle_Factory",					
			},
			Starbase_Table = {
                "Empire_Star_Base_1",
                "Empire_Star_Base_2",					
                "Empire_Star_Base_3",
				"Empire_Star_Base_4",									
				"Empire_Star_Base_5",								
            },
			Shipyard_Table = {
                "Empire_Shipyard_Level_One",
                "Empire_Shipyard_Level_Two",	
                "Empire_Shipyard_Level_Three",
				"Empire_Shipyard_Level_Four",																
            },
			Defenses_Table = Golan_Defenses,
			Government_Building = "Empire_MoffPalace",
			GTS_Building = "Ground_Hypervelocity_Gun"
		},
		REBEL = {
			Space_Unit_Table = {
				{"Calamari_Cruiser", 2}
				,{"Alliance_Assault_Frigate_II", 2}
				,{"Quasar", 5}
				,{"Nebulon_B_Frigate", 5}
				,{"Alliance_Assault_Frigate", 4}
				,{"Dreadnaught_Rebel", 4}
				,{"Corellian_Corvette", 5}
				,{"Corellian_Gunboat", 5}
				,{"Agave_Corvette", 5, StartYear = 13}
				,{"Warrior_Gunship", 5, StartYear = 13}
				,{"Marauder_Cruiser", 5}
				,{"Marauder_Missile_Cruiser", 3}
				,{"Dauntless", 2}
				,{"Nebulon_B_Tender", 2}
				,{"Belarus", 2, StartYear = 10}
				,{"Corona", 3, StartYear = 10}
				,{"Sacheen", 3, StartYear = 10}
				,{"Hajen", 2, StartYear = 10}
				,{"Liberator_Cruiser", 2}
				,{"Majestic", 2, StartYear = 13}
				,{"Defender_Carrier", 2, StartYear = 13}
				,{"Republic_SD", 2, StartYear = 10}
				,{"Endurance", 1, StartYear = 13}
				,{"Nebula", 1, StartYear = 13}
				,{"MC90", 1, StartYear = 10}	
				,{"MC80B", 1}
				,{"MC40a", 3}
				,{"MC30a", 3}
				,{"MC30c", 3}
			},
			Land_Unit_Table = {
				{"Rebel_Infantry_Squad", 5, LastYear = 9}
				,{"Defense_Trooper_Squad", 5, StartYear = 10}
				,{"Rebel_Marine_Squad", 2}
				,{"Rebel_T2B_Company", 3}
				,{"Rebel_T1B_Company", 2}
				,{"Rebel_AAC_2_Company", 3}
				,{"Rebel_AA5_Company", 1}
				,{"Rebel_Freerunner_Company", 2}			
				,{"Rebel_T3B_Company", 2}			
				,{"Rebel_T4B_Company", 1}			
				,{"Rebel_Tracker_Company", 1}
				,{"Rebel_Snowspeeder_Wing", 2}
				,{"Rebel_Vwing_Group", 2, StartYear = 10}
				,{"Rebel_Gallofree_HTT_Company", 1}
				,{"Rebel_MPTL_Company", 1}
				,{"Gian_Rebel_Company", 1}
			},
			Groundbase_Table = {
				"R_Ground_Barracks",
                "R_Ground_Barracks",
                "R_Ground_Light_Vehicle_Factory",
                "R_Ground_Heavy_Vehicle_Factory",
            },
			Starbase_Table = {
                "NewRepublic_Star_Base_1",
                "NewRepublic_Star_Base_2",					
                "NewRepublic_Star_Base_3",
				"NewRepublic_Star_Base_4",									
				"NewRepublic_Star_Base_5",
            },
			Shipyard_Table = {
                "NewRepublic_Shipyard_Level_One",
                "NewRepublic_Shipyard_Level_Two",					
                "NewRepublic_Shipyard_Level_Three",
				"NewRepublic_Shipyard_Level_Four",																	
            },
			Defenses_Table = Golan_Defenses,
			Government_Building = "NewRep_SenatorsOffice",
			GTS_Building = "Ground_Ion_Cannon"
		},
		HAPES_CONSORTIUM = {
			Space_Unit_Table = {
				{"BattleDragon", 3}
				,{"Nova_Cruiser", 4}
				,{"Beta_Cruiser", 3}
				,{"Stella", 3}
				,{"Baidam", 4}			
				,{"Raptor_Gunship_Squadron", 2}	
				,{"Charubah_Frigate", 2}			
				,{"Magnetar", 1}			
				,{"Pulsar", 1}			
				,{"Terephon_Cruiser", 1}			
				,{"Olanji_Frigate", 2}			
				,{"Coronal", 1}			
				,{"Neutron_Cruiser", 1}			
				,{"Mist_Carrier", 1}						
			},
			Land_Unit_Table = {
				{"Hapan_Infantry_Squad", 3}
				,{"HRG_Commando_Squad", 1}
				,{"Hapan_LightTank_Company", 3}
				,{"Hapan_Transport_Company", 2}
				,{"Hapan_HeavyTank_Company", 2}				
			},
			Groundbase_Table = {
                "HC_Ground_Barracks",
                "HC_Ground_Barracks",
                "HC_Ground_Light_Vehicle_Factory",
                "HC_Ground_Heavy_Vehicle_Factory",
            },
			Starbase_Table = {
                "Hapan_Star_Base_1",
                "Hapan_Star_Base_2",					
                "Hapan_Star_Base_3",
				"Hapan_Star_Base_4",									
				"Hapan_Star_Base_5",									
            },
			Shipyard_Table = {
                "Hapan_Shipyard_Royal",
				"Hapan_Shipyard_Royal",
			    "Hapan_Shipyard_Royal",
				"Hapan_Shipyard_Royal",																	
            },
			Defenses_Table = {
                nil,
                "Meridian_I",
                "Meridian_II",					
                "Meridian_III",
				"Meridian_IV",								
            },
			Government_Building = "House_Royal",
			GTS_Building = "Ground_Ion_Cannon"
		},
		EMPIREOFTHEHAND = {
			Space_Unit_Table = {
				{"Chaf_Destroyer", 3}
				,{"Fruoro", 4}
				,{"Syndic_Destroyer", 1}
				,{"Phalanx_Destroyer", 2}
				,{"Chiss_Star_Destroyer", 1}
				,{"Peltast", 1}
				,{"Ormos", 4}
				,{"Muqaraea", 4}
				,{"Syzygos", 3}
				,{"Kynigos", 3}
				,{"Baomu", 2}
				,{"Rohkea", 4}
				,{"Kuuro", 4}		
			},
			Land_Unit_Table = {
				{"Phalanx_Trooper_Squad", 4}
				,{"EotH_Kirov_Brigade", 1}
				,{"MMT_Brigade", 1}
				,{"Flame_Tank_Company", 2}
				,{"RFT_Brigade", 3}
				,{"EotH_Scout_Brigade", 1}
				,{"Gilzean_Brigade", 2}
				,{"AirStraeker_Company", 1}
				,{"Mortar_Company", 1}			
			},
			Groundbase_Table = {
                "U_Ground_Barracks",
                "U_Ground_Barracks",
                "U_Ground_Vehicle_Factory",
                "U_Ground_Droid_Works",
            },
			Starbase_Table = {
                "Brask_Starbase",
                "EotH_Star_Base_2",					
                "EotH_Star_Base_3",
				"Visvia_Starbase",									
				"Oto_Starbase",								
            },
			Shipyard_Table = {
                "EOTH_Shipyard_Level_One",
                "EOTH_Shipyard_Level_Two",					
                "EOTH_Shipyard_Level_Three",
				"EOTH_Shipyard_Level_Four",																		
            },
			Defenses_Table = {
                nil,
                "Brask",
                "Secondary_Golan_One",
                "Secondary_Golan_Two",
                "Visvia",
            },
			Government_Building = "Hand_GovernorOffice",
			GTS_Building = "Ground_Hypervelocity_Gun"
		},
		CHISS = {
			Space_Unit_Table = {
				{"Fruoro", 5}
				,{"Syndic_Destroyer", 5}
				,{"Ormos", 4}
				,{"Muqaraea", 4}
				,{"Syzygos", 3}
				,{"Kynigos", 3}
				,{"Baomu", 2}
				,{"Rohkea", 4}
				,{"Kuuro", 4}	
			},
			Land_Unit_Table = {
				{"Phalanx_Trooper_Squad", 4}
				,{"EotH_Kirov_Brigade", 1}
				,{"MMT_Brigade", 1}
				,{"Flame_Tank_Company", 2}
				,{"RFT_Brigade", 3}
				,{"EotH_Scout_Brigade", 1}
				,{"Gilzean_Brigade", 2}
				,{"AirStraeker_Company", 1}		
			},
			Groundbase_Table = {
                "U_Ground_Barracks",
                "U_Ground_Barracks",
                "U_Ground_Vehicle_Factory",
                "U_Ground_Droid_Works",
            },
			Starbase_Table = {
                "Brask_Starbase",
                "EotH_Star_Base_2",					
                "EotH_Star_Base_3",
				"Visvia_Starbase",									
				"Oto_Starbase",									
            },
			Shipyard_Table = {
                "Chiss_Shipyard_Level_One",
                "Chiss_Shipyard_Level_Two",		
                "Chiss_Shipyard_Level_Three",
				"Chiss_Shipyard_Level_Four",																	
            },
			Defenses_Table = {
                nil,
                "Brask",
                "Secondary_Golan_One",
                "Secondary_Golan_Two",
                "Visvia",								
            },
			Government_Building = nil,
			GTS_Building = nil
		},
		ERIADU_AUTHORITY = {
			Space_Unit_Table = {
				{"IPV1_System_Patrol_Craft", 5, LastYear = 11}
				,{"IPV4", 5, StartYear = 12}
				,{"Adz", 4, StartYear = 12}
				,{"Gamma_ATR_6_Squadron", 2}			
				,{"Raider_II_Corvette", 3}			
				,{"Arquitens", 4}
				,{"Eidolon", 2}
				,{"Generic_Gladiator", 4}
				,{"Galleon", 2}			
				,{"Generic_Imperial_I_Frigate", 4}
				,{"Generic_Victory_Destroyer", 3}
				,{"Generic_Star_Destroyer_Two", 1}
				,{"Generic_Star_Destroyer", 1}
			},
			Land_Unit_Table = {
				{"Imperial_Army_Trooper_Squad", 5}
				,{"Imperial_Army_Guard_Squad", 3}			
				,{"Imperial_Army_Special_Missions_Squad", 2}
				,{"Imperial_Army_Commando_Squad", 1}			
				,{"Imperial_ISB_Infiltrator_Squad", 1}
				,{"Imperial_Galactic_Marine_Squad", 1}				
				,{"Imperial_64Y_Company", 3}
				,{"Imperial_AT_MP_Company", 2}
				,{"Imperial_1L_Tank_Company", 4}
				,{"Imperial_1M_Tank_Company", 3}			
				,{"Imperial_1H_Tank_Company", 2}
				,{"Imperial_AT_AT_Company", 1}
				,{"Imperial_TRMB_Company", 1}
				,{"Imperial_Lancet_Group", 1}
				,{"Imperial_Flashblind_Group", 1}
				,{"Imperial_Light_Artillery_Company", 1}			
			},
			Groundbase_Table = {
                "A_Ground_Barracks",
                "A_Ground_Barracks",
                "A_Ground_Light_Vehicle_Factory",
                "A_Ground_Heavy_Vehicle_Factory",
				"A_Ground_Advanced_Vehicle_Factory",
            },
			Starbase_Table = {
                "Empire_Star_Base_1",
                "Empire_Star_Base_2",					
                "Empire_Star_Base_3",
				"Empire_Star_Base_4",									
				"Empire_Star_Base_5",								
            },
			Shipyard_Table = {
                "Eriadu_Shipyard_Level_One",
                "Eriadu_Shipyard_Level_Two",			
                "Eriadu_Shipyard_Level_Three",
				"Eriadu_Shipyard_Level_Four",																	
            },
			Defenses_Table = Golan_Defenses,
			Government_Building = "Eriadu_MoffPalace",
			GTS_Building = "Ground_Hypervelocity_Gun"
		},
		PENTASTAR = {
			Space_Unit_Table = {
				{"Raider_Corvette", 4}
				,{"Adz", 4, StartYear = 12}
				,{"Decimator_Squadron", 2}
				,{"Corellian_Buccaneer", 2}
				,{"Tartan_Patrol_Cruiser", 3}
				,{"Battle_Horn", 3}
				,{"Victory_II_Frigate", 4}
				,{"Trenchant", 4}			
				,{"Escort_Carrier", 2}		
				,{"Enforcer", 4}
				,{"Dreadnaught_Empire", 3}
				,{"Imperial_Cargo_Ship", 2}
				,{"Generic_Acclamator_Assault_Ship_Leveler", 3}
				,{"Generic_Venator", 3}
				,{"Generic_Procursator", 3}
				,{"Generic_Tector", 1}
				,{"Generic_Star_Destroyer", 1}	
			},
			Land_Unit_Table = {
				{"Pentastar_Enforcer_Trooper_Squad", 5}
				,{"Imperial_Army_Guard_Squad", 2}			
				,{"Pentastar_Army_Trooper_Squad", 3}
				,{"Imperial_Guardian_Protector_Squad", 1}
				,{"Imperial_Army_Commando_Squad", 1}			
				,{"Imperial_IntSec_Operator_Squad", 1}		
				,{"Imperial_TIE_Mauler_Company", 2}
				,{"Imperial_AT_PT_Company", 3}
				,{"Imperial_AT_DP_Company", 2}
				,{"Imperial_Century_Tank_Company", 2}			
				,{"Imperial_B5_Juggernaut_Company", 1}
				,{"Imperial_C10_Siege_Tower_Company", 1}
				,{"Imperial_Gaba18_Group", 2}
				,{"Imperial_Nemesis_Gunship_Group", 1}
				,{"Imperial_Heavy_Artillery_Company", 1}		
			},
			Groundbase_Table = {
                "P_Ground_Barracks",
                "P_Ground_Barracks",
                "P_Ground_Light_Vehicle_Factory",
                "P_Ground_Heavy_Vehicle_Factory",
				"P_Ground_Advanced_Vehicle_Factory",
            },
			Starbase_Table = {
                "Empire_Star_Base_1",
                "Empire_Star_Base_2",					
                "Empire_Star_Base_3",
				"Empire_Star_Base_4",									
				"Empire_Star_Base_5",									
            },
			Shipyard_Table = {
                "Pentastar_Shipyard_Level_One",
                "Pentastar_Shipyard_Level_Two",	
                "Pentastar_Shipyard_Level_Three",
				"Pentastar_Shipyard_Level_Four",																	
            },
			Defenses_Table = Golan_Defenses,
			Government_Building = "Pentastar_MoffPalace",
			GTS_Building = "Ground_Hypervelocity_Gun"
		},
		ZSINJ_EMPIRE = {
			Space_Unit_Table = {
				{"CR90_Zsinj", 5}
				,{"Adz", 4, StartYear = 12}
				,{"YZ_775_Squadron", 2}
				,{"Lancer_Frigate", 2}
				,{"Nebulon_B_Zsinj", 5}
				,{"Surveyor_Frigate", 4}
				,{"Dragon_Heavy_Cruiser", 2}
				,{"CR92_Assassin", 4}			
				,{"Neutron_Star", 4}
				,{"Interceptor_Frigate", 2}
				,{"Action_VI_Support", 2}
				,{"Super_Transport_XI_Modified", 1}
				,{"Star_Galleon", 2}			
				,{"Generic_Victory_Destroyer_TWO", 3}
				,{"Generic_Star_Destroyer_Two", 1}
				,{"Generic_Star_Destroyer", 1}	
			},
			Land_Unit_Table = {
				{"Imperial_Army_Trooper_Squad", 4}
				,{"Zsinj_Raptor_Squad", 3}
				,{"Zsinj_74Z_Bike_Company", 1}
				,{"Imperial_Army_Guard_Squad", 2}			
				,{"Zsinj_EVO_Trooper_Squad", 1}
				,{"Imperial_IntSec_Operator_Squad", 1}			
				,{"Imperial_ULAV_Company", 2}
				,{"Imperial_Repulsor_Scout_Company", 2}
				,{"Imperial_Chariot_LAV_Company", 1}
				,{"Imperial_AT_AP_Walker_Company", 1}
				,{"Imperial_Repulsor_Scout_Company", 2}			
				,{"Imperial_PX10_Company", 3}
				,{"Imperial_APC_Company", 1}
				,{"Imperial_TRSD_Company", 0.5}
				,{"Imperial_A9_Fortress_Company", 1}
				,{"Imperial_IDT_Group", 1}
				,{"Imperial_SPMAT_Company", 1}			
			},
			Groundbase_Table = {
                "Z_Ground_Barracks",
                "Z_Ground_Barracks",
                "Z_Ground_Light_Vehicle_Factory",
                "Z_Ground_Heavy_Vehicle_Factory",
				"Z_Ground_Advanced_Vehicle_Factory",
            },
			Starbase_Table = {
                "Empire_Star_Base_1",
                "Empire_Star_Base_2",					
                "Empire_Star_Base_3",
				"Empire_Star_Base_4",									
				"Empire_Star_Base_5",									
            },
			Shipyard_Table = {
                "Zsinj_Shipyard_Level_One",
                "Zsinj_Shipyard_Level_Two",		
                "Zsinj_Shipyard_Level_Three",
				"Zsinj_Shipyard_Level_Four",																		
            },
			Defenses_Table = Golan_Defenses,
			Government_Building = "Zsinj_MoffPalace",
			GTS_Building = "Ground_Hypervelocity_Gun"
		},
		GREATER_MALDROOD = {
			Space_Unit_Table = {
				{"Tartan_Patrol_Cruiser", 3}
				,{"Adz", 4, StartYear = 12}
				,{"Guardian_Squadron", 5}
				,{"Customs_Corvette", 5}
				,{"Carrack_Cruiser", 5}
				,{"Broadside_Cruiser", 3}
				,{"Vigil", 4}
				,{"Generic_Pursuit", 2}
				,{"Strike_Cruiser", 4}
				,{"Vindicator_Cruiser", 2}
				,{"Generic_Acclamator_Assault_Ship_II", 2}
				,{"Star_Galleon", 2}			
				,{"Generic_Imperial_II_Frigate", 4}
				,{"Generic_Victory_Destroyer", 2}
				,{"Crimson_Victory", 3}
				,{"Generic_Tector", 1}
				,{"Generic_Star_Destroyer", 1}	
			},
			Land_Unit_Table = {
				{"Imperial_Army_Trooper_Squad", 4}
				,{"Imperial_Army_Guard_Squad", 2}
				,{"Imperial_Fleet_Commando_Squad", 1}			
				,{"Imperial_ISB_Infiltrator_Squad", 1}			
				,{"Imperial_74Z_Bike_Company", 1}			
				,{"Imperial_Navy_Commando_Squad", 2}
				,{"Imperial_AT_RT_Company", 3}
				,{"Imperial_ISP_Company", 2}		   
				,{"Imperial_RTT_Company", 3}		   
				,{"Imperial_SA5_Company", 2}
				,{"Imperial_2M_Company", 2}
				,{"Imperial_A5_Juggernaut_Company", 1}
				,{"Imperial_Heavy_Recovery_Vehicle_Company", 1}
				,{"Imperial_INT4_Group", 1}
				,{"Imperial_MAAT_Group", 1}
				,{"Imperial_Missile_Artillery_Company", 1}		
			},
			Groundbase_Table = {
                "T_Ground_Barracks",
                "T_Ground_Barracks",
                "T_Ground_Light_Vehicle_Factory",
                "T_Ground_Heavy_Vehicle_Factory",
				"T_Ground_Advanced_Vehicle_Factory",	
            },
			Starbase_Table = {
                "Empire_Star_Base_1",
                "Empire_Star_Base_2",					
                "Empire_Star_Base_3",
				"Empire_Star_Base_4",									
				"Empire_Star_Base_5",									
            },
			Shipyard_Table = {
                "Greater_Maldrood_Shipyard_Level_One",
                "Greater_Maldrood_Shipyard_Level_Two",	
                "Greater_Maldrood_Shipyard_Level_Three",
				"Greater_Maldrood_Shipyard_Level_Four",																	
            },
			Defenses_Table = Golan_Defenses,
			Government_Building = "Maldrood_MoffPalace",
			GTS_Building = "Ground_Hypervelocity_Gun"
		},
		CORPORATE_SECTOR = {
			Space_Unit_Table = {
				{"Citadel_Cruiser_Squadron", 2}
				,{"Gozanti_Cruiser_Squadron", 1}
				,{"Marauder_Cruiser", 5}
				,{"Marauder_Missile_Cruiser", 3}
				,{"Etti_Lighter", 4}
				,{"Nebulon_B_Zsinj", 3}
				,{"Quasar", 3}
				,{"Recusant", 4}
				,{"MTC_Combat", 4, StartYear = 11}
				,{"MTC_Support", 4, StartYear = 11}
				,{"Neutron_Star", 4}
				,{"Generic_Gladiator", 3}
				,{"Dreadnaught_Empire", 3}			
				,{"Liberator_Cruiser", 2}			
				,{"Galleon", 2}			
				,{"Generic_Victory_Destroyer", 3}
				,{"Generic_Victory_Destroyer_Two", 1}
				,{"Bulwark_I", 3}
				,{"Dauntless", 1}
				,{"Invincible_Cruiser", 1}
			},
			Land_Unit_Table = {
				{"Espo_Squad", 5}
				,{"Heavy_Espo_Squad", 3}			
				,{"CSA_B1_Droid_Squad", 2}
				,{"CSA_Destroyer_Droid_Company", 1}
				,{"CSA_64Y_Company", 3}
				,{"Class_I_Company", 2}
				,{"Espo_Walker_Squad", 3}			
				,{"GX12_Company", 2}			
				,{"Strikebreaker_Group", 1}
				,{"Persuader_Company", 1}
				,{"JX40_Group", 1}
				,{"SX20_Company", 2}
				,{"X10_Group", 3}
				,{"K222_Group", 1}
				,{"Hailfire_Company", 1}
				,{"CA_Artillery_Company", 1}
			},
			Groundbase_Table = {
                "C_Ground_Barracks",
                "C_Ground_Barracks",
                "C_Ground_Light_Vehicle_Factory",
                "C_Ground_Heavy_Vehicle_Factory",
            },
			Starbase_Table = {
                "CSA_Star_Base_1",
                "CSA_Star_Base_2",					
                "CSA_Star_Base_3",
				"CSA_Star_Base_4",									
				"CSA_Star_Base_5",								
            },
			Shipyard_Table = {
                "CSA_Shipyard_Level_One",
                "CSA_Shipyard_Level_Two",
                "CSA_Shipyard_Level_Three",
				"CSA_Shipyard_Level_Four",																	
            },
			Defenses_Table = {
                nil,
                nil,
                "Secondary_Golan_One",
                "Secondary_Golan_Two",	
                "Valor_Station",							
            },
			Government_Building = "CSA_LocalOffice",
			GTS_Building = "Ground_Ion_Cannon"
		},
		HUTT_CARTELS = {
			Space_Unit_Table = {
				{"Warlord_Cruiser", 2}
				,{"Heavy_Minstrel_Yacht", 2}
				,{"Raka_Freighter_Tender", 1}
				,{"Ubrikkian_Frigate", 1}
				,{"Kaloth_Battlecruiser", 4}
				,{"Juvard_Frigate", 4}
				,{"Barabbula_Frigate", 4}
				,{"Super_Transport_VII_Interdictor", 1}
				,{"Hutt_Star_Galleon", 1}
				,{"Kossak_Frigate", 5}
				,{"Szajin_Cruiser", 3}
				,{"Karagga_Destroyer", 3}
				,{"Vontor_Destroyer", 3}
				,{"Voracious_Carrier", 1}
				,{"Dreadnaught_Empire", 3}	
			},
			Land_Unit_Table = {
				{"Hutt_Guard_Squad", 5}
				,{"Hutt_Armored_Platoon", 2}
				,{"Hutt_Flare_S_Company", 2}
				,{"Hutt_Airhook_Company", 2}
				,{"Hutt_Desert_Sail20_Company", 2}
				,{"Hutt_Personnel_Skiff_IV_Company", 2}
				,{"Hutt_Bantha_II_Skiff_Company", 3}
				,{"Hutt_Pod_Walker_Company", 1}
				,{"Hutt_SuperHaul_II_Skiff_Company", 1}
				,{"Hutt_AA_Skiff_Company", 1}
				,{"WLO5_Tank_Company", 4}
				,{"Luxury_Yacht_Company", 1}
				,{"Hutt_AST5_Company", 1}	
				,{"Hutt_Guardian_5E_Speeder_Company", 1}	
				,{"MAL_Rocket_Vehicle_Company", 1}		
				,{"Hutt_Gamorrean_Guard_Squad", 1}		
				,{"Hutt_Minor_Shell_Hutt_Platoon", 1}	
			},
			Groundbase_Table = {
                "H_Ground_Barracks",
                "H_Ground_Barracks",
                "H_Ground_Light_Vehicle_Factory",
                "H_Ground_Heavy_Vehicle_Factory",
			},
			Starbase_Table = {
				"Hutt_Star_Base_1",
                "Hutt_Star_Base_2",					
                "Hutt_Star_Base_3",
				"Hutt_Star_Base_4",									
				"Hutt_Star_Base_5",
			},
			Shipyard_Table = {
                "Hutt_Shipyard_Level_One",
                "Hutt_Shipyard_Level_Two",
                "Hutt_Shipyard_Level_Three",
				"Hutt_Shipyard_Level_Four",																	
            },
			Defenses_Table = Golan_Defenses,
			Government_Building = "Hutt_LocalOffice",
			GTS_Building = "Ground_Ion_Cannon"
		},
		SSIRUUVI_IMPERIUM = {
			Space_Unit_Table = {
				{"Wurrif_Cruiser", 4}
				,{"Lwhekk_Manufacturing_Ship", 1}
				,{"Shree_Cruiser", 1}				
			},
			Land_Unit_Table = {
				{"SsiRuuk_Soldier_Squad", 5}			
			},
			Groundbase_Table = {
                "S_Ground_Barracks",
                "S_Ground_Barracks",
                -- "S_Ground_Light_Vehicle_Factory",
                -- "S_Ground_Heavy_Vehicle_Factory",
            },
			Starbase_Table = {
                "Empire_Star_Base_1",
                "Empire_Star_Base_2",					
                "Empire_Star_Base_3",
				"Empire_Star_Base_4",									
				"Empire_Star_Base_5",									
            },
			Shipyard_Table = {
                "Empire_Shipyard_Level_One",
                "Empire_Shipyard_Level_Two",
                "Empire_Shipyard_Level_Three",
				"Empire_Shipyard_Level_Four",																		
            },
			Defenses_Table = Golan_Defenses,
			Government_Building = "SsiRuuvi_Palace",
			GTS_Building = nil
		},
		YEVETHA = {
			Space_Unit_Table = {
				{"Armadia", 5}
				,{"C_type_Thrustship", 5}
				,{"Victory_I_Frigate", 4}
				,{"Yevetha_Dreadnaught", 1}
				,{"Generic_Gladiator_Two", 3}
				,{"Generic_Star_Destroyer_Two", 1}
				,{"Surveyor_Frigate", 2}
				,{"Active_Frigate", 4}
				,{"Generic_Acclamator_Assault_Ship_II", 4}		
			},
			Land_Unit_Table = {
				{"Imperial_AT_ST_A_Company", 4}
				,{"Imperial_AT_AA_Company", 1}
				,{"Imperial_Light_Artillery_Company", 1}			
				,{"Imperial_TIE_Mauler_Company", 3}
				,{"Imperial_AT_TE_Walker_Company", 1}
				,{"Imperial_B5_Juggernaut_Company", 2}
				,{"Imperial_LAAT_Group", 1}			
			},
			Groundbase_Table = IF_Groundbase,
			Starbase_Table = {
                "Empire_Star_Base_1",
                "Empire_Star_Base_2",					
                "Empire_Star_Base_3",
				"Empire_Star_Base_4",									
				"Empire_Star_Base_5",									
            },
			Shipyard_Table = {
                "Empire_Shipyard_Level_One",
                "Empire_Shipyard_Level_Two",
                "Empire_Shipyard_Level_Three",
				"Empire_Shipyard_Level_Four",
            },
			Defenses_Table = Golan_Defenses,
			Government_Building = nil,
			GTS_Building = nil
		},
		CORELLIA = {
			Space_Unit_Table = {
				{"Strike_Cruiser", 3}
				,{"Strike_Interdictor", 1}			
				,{"CC7700", 1}
				,{"CEC_Light_Cruiser", 4}
				,{"Starbolt", 3}
				,{"Proficient", 4}
				,{"Proficient_tender", 2}
				-- ,{"Strident", 1}
				,{"YZ_775_Squadron", 3}			
				,{"Corellian_Corvette", 5}
				,{"Corellian_Gunboat", 5}
				,{"CR92_Assassin", 2}			
				,{"Corellian_Buccaneer", 2}
				,{"Interceptor_Frigate", 4}
				,{"Action_VI_Support", 2}
				,{"Generic_Victory_Destroyer", 1}			
				,{"Generic_Star_Destroyer", 1}			
				,{"Torpedo_Sphere", 1}		
			},
			Land_Unit_Table = {
				{"Military_Soldier_Team", 3}
				,{"Police_Responder_Team", 2}
				,{"Arrow_23_Company", 1}
				,{"Rebel_AAC_2_Company", 1}
				,{"Rebel_Freerunner_Company", 1}			
				,{"Rebel_Tracker_Company", 1}
				,{"Teklos_Company", 1}
				,{"Talon_Cloud_Car_Group", 1}			
				,{"Cor_VAAT_Group", 1}			
			},
			Groundbase_Table = IF_Groundbase,
			Starbase_Table = {
                "NewRepublic_Star_Base_1",
                "NewRepublic_Star_Base_2",					
                "NewRepublic_Star_Base_3",
				"NewRepublic_Star_Base_4",									
				"NewRepublic_Star_Base_5",								
            },
			Shipyard_Table = {
                "Empire_Shipyard_Level_One",
                "Empire_Shipyard_Level_Two",
                "Empire_Shipyard_Level_Three",
				"Empire_Shipyard_Level_Four",
            },
			Defenses_Table = Golan_Defenses,
			Government_Building = nil,
			GTS_Building = nil
		},
		MANDALORIANS = {
			Space_Unit_Table = {
				{"Keldabe", 5}
				,{"Neutron_Star", 2}
				,{"Neutron_Star_Mercenary", 1}
				,{"Neutron_Star_Tender", 1}
				,{"Dreadnaught_Carrier", 1}
				,{"Vengeance_Frigate", 3}
				,{"Dreadnaught_Empire", 3}
				,{"Crusader_Gunship", 5}
				,{"Komrk_Gunship_Squadron", 5}
				,{"Generic_Venator", 1}
			},
			Land_Unit_Table = {
				{"Mandalorian_Soldier_Company", 3}
				,{"Mandalorian_Commando_Company", 2}
				,{"Canderous_Assault_Tank_Company", 1}
				,{"Canderous_Assault_Tank_Lasers_Company", 0.5}
				,{"MAL_Rocket_Vehicle_Company", 1}	
			},
			Groundbase_Table = IF_Groundbase,
			Starbase_Table = {
                "Empire_Star_Base_1",
                "Empire_Star_Base_2",					
                "Empire_Star_Base_3",
				"Empire_Star_Base_4",									
				"Empire_Star_Base_5",									
            },
			Shipyard_Table = {
                "Empire_Shipyard_Level_One",
                "Empire_Shipyard_Level_Two",			
                "Empire_Shipyard_Level_Three",
				"Empire_Shipyard_Level_Four",																	
            },
			Defenses_Table = Golan_Defenses,
			Government_Building = nil,
			GTS_Building = nil
		},
		WARLORDS = {
			Space_Unit_Table = {
				{"CR90_Zsinj", 5}
				,{"IPV1_System_Patrol_Craft", 5}
				,{"IPV4", 5, StartYear = 12}
				,{"DP20_Zsinj", 5}
				,{"Nebulon_B_Zsinj", 5}
				,{"Nebulon_B_Empire", 4, StartYear = 12}
				,{"Lancer_Frigate", 2}
				,{"Star_Galleon", 1}
				,{"Carrack_Cruiser", 4}
				,{"Strike_Cruiser", 4}
				,{"Escort_Carrier", 3}
				,{"Dreadnaught_Empire", 4}
				,{"Generic_Acclamator_Assault_Ship_I", 1}
				,{"Generic_Interdictor_Cruiser", 1}
				,{"Generic_Victory_Destroyer", 2}
				,{"Generic_Victory_Destroyer_Two", 2}
				,{"Generic_Star_Destroyer_Two", 1}
				,{"Generic_Star_Destroyer", 1}
				,{"Torpedo_Sphere", 0.1}
				,{"Altor_Replenishment_Ship", 0.1}
				,{"Adz", 2, StartYear = 12}
				,{"Nebulon_B_Empire", 4, StartYear = 12}
				,{"Strike_Cruiser_Gorath", 2, StartYear = 14}		
			},
			Land_Unit_Table = {
				{"Imperial_Army_Guard_Squad", 4}
				,{"Imperial_Army_Trooper_Squad", 4}
				,{"Imperial_Army_Special_Missions_Squad", 3}
				,{"Imperial_Navy_Trooper_Squad", 4}
				,{"Imperial_Navy_Commando_Squad", 3}
				,{"Imperial_Stormtrooper_Squad", 2}
				,{"Imperial_Compforce_Assault_Squad", 3}
				,{"Imperial_74Z_Bike_Company", 1}
				,{"Imperial_64Y_Company", 1}
				,{"Imperial_PX10_Company", 3}
				,{"Imperial_AT_ST_Company", 3}
				,{"Imperial_Chariot_LAV_Company", 1}
				,{"Imperial_SA5_Company", 2}
				,{"Imperial_PX4_Company", 2}
				,{"Imperial_A9_Fortress_Company", 1}
				,{"Imperial_A5_Juggernaut_Company", 1}
				,{"Imperial_AT_AT_Company", 1}			
			},
			Groundbase_Table = {
                "E_Ground_Barracks",
                "E_Ground_Barracks",
                "E_Ground_Barracks",
                "A_Ground_Barracks",			
                "A_Ground_Barracks",				
                "A_Ground_Barracks",
				"Z_Ground_Barracks",			
                "Z_Ground_Barracks",				
                "Z_Ground_Barracks",
                "T_Ground_Barracks",
                "T_Ground_Barracks",				
                "T_Ground_Barracks",				
                "E_Ground_Light_Vehicle_Factory",
                "P_Ground_Light_Vehicle_Factory",
                "Z_Ground_Light_Vehicle_Factory",
                "T_Ground_Light_Vehicle_Factory",
                "A_Ground_Light_Vehicle_Factory",				
                "E_Ground_Heavy_Vehicle_Factory",
                "P_Ground_Heavy_Vehicle_Factory",				
                "Z_Ground_Heavy_Vehicle_Factory",
                "T_Ground_Heavy_Vehicle_Factory",
                "A_Ground_Heavy_Vehicle_Factory",
				"A_Ground_Advanced_Vehicle_Factory",				
				"P_Ground_Advanced_Vehicle_Factory",
				"Z_Ground_Advanced_Vehicle_Factory",				
				"T_Ground_Advanced_Vehicle_Factory",
            },
			Starbase_Table = {
                "Empire_Star_Base_1",
                "Empire_Star_Base_2",					
                "Empire_Star_Base_3",
				"Empire_Star_Base_4",									
				"Empire_Star_Base_5",									
            },
			Shipyard_Table = {
                "Pentastar_Shipyard_Level_One",
                "Greater_Maldrood_Shipyard_Level_Two",					
                "Eriadu_Shipyard_Level_Three",
				"Empire_Shipyard_Level_Four",																		
            },
			Defenses_Table = Golan_Defenses,
			Government_Building = "Empire_MoffPalace",
			GTS_Building = nil
		},
		INDEPENDENT_FORCES = {
			Space_Unit_Table = {
				{"Generic_Venator", 2}
				,{"Dauntless", 2}
				,{"Dauntless_Transport", 1}
				,{"Generic_Providence", 0.5}
				,{"Keldabe", 1}
				,{"Calamari_Cruiser_Liner", 0.5}
				,{"Kuari_Princess_Liner", 0.2}
				,{"Space_ARC_Cruiser", 1}
				,{"Invincible_Cruiser", 1}
				,{"Corellian_Corvette", 5}
				,{"Corellian_Gunboat", 5}
				,{"Carrack_Cruiser", 4}
				,{"Generic_Star_Destroyer", 1}
				,{"IPV1_System_Patrol_Craft", 5}
				,{"IPV4", 5, StartYear = 12}
				,{"IPV1_Gunboat", 1}				
				,{"Lancer_Frigate_Prototype", 2}
				,{"Lancer_Frigate_PDF", 2}
				,{"Customs_Corvette", 5}
				,{"Marauder_Cruiser", 5}
				,{"Marauder_Missile_Cruiser", 3}
				,{"Dreadnaught_Empire", 4}
				,{"Generic_Victory_Destroyer", 3}
				,{"Generic_Gladiator", 2}
				,{"Generic_Gladiator_Two", 1}
				,{"Generic_Acclamator_Assault_Ship_I", 2}
				,{"Generic_Acclamator_Assault_Ship_II", 2}
				,{"Generic_Acclamator_Assault_Ship_Leveler", 2}
				,{"Generic_Imperial_I_Frigate", 2}
				,{"Generic_Imperial_II_Frigate", 2}
				,{"Vindicator_Cruiser", 2}
				,{"Munificent", 0.5}
				,{"Recusant", 0.5}
				,{"Captor", 0.5}
				,{"Lucrehulk_Core_Destroyer", 0.5}
				,{"Liberator_Cruiser", 2}
				,{"Nebulon_B_Zsinj", 5}
				,{"Nebulon_B_Empire", 4, StartYear = 12}
				,{"Arquitens", 2, LastYear = 14}
				,{"Strike_Cruiser", 2}
				,{"Strike_Interdictor", 0.5}
				,{"Super_Transport_VI", 1}
				,{"Super_Transport_VII", 1}
				,{"Super_Transport_VII_Interdictor", 1}
				,{"Super_Transport_XI", 1}
				,{"Guardian_Lasers_Squadron", 4}
				,{"Citadel_Cruiser_Squadron", 4}
				,{"Gozanti_Cruiser_Squadron", 5}
				,{"Neutron_Star", 4}
				,{"Neutron_Star_Mercenary", 1}
				,{"Neutron_Star_Tender", 1}
				,{"Galleon", 2}
				,{"CC7700", 1}
				,{"Generic_Quasar", 1}
				,{"Crusader_Gunship", 1}
				,{"Interceptor_Frigate", 5}
				,{"Kaloth_Battlecruiser", 2}
				,{"Heavy_Minstrel_Yacht", 1}
				,{"CEC_Light_Cruiser", 3}
				,{"Starbolt", 2}
				,{"Proficient", 1}
				,{"Proficient_tender", 1}
				,{"Corona", 3, StartYear = 12}
				,{"Belarus", 2, StartYear = 12}				
				,{"Home_One_Type_Liner", 0.5}
				,{"Lucrehulk_CSA", 0.5}				
				,{"Generic_Secutor", 0.25}				
				,{"Generic_Tagge_Battlecruiser", 0.1}
				,{"Generic_Praetor", 0.125}								
			},
			Land_Unit_Table = {
				{"Police_Responder_Team", 2}
				,{"Security_Trooper_Team", 2}
				,{"Military_Soldier_Team", 3}
				,{"PDF_Soldier_Team", 3}
				,{"PDF_Tactical_Unit_Team", 2}
				,{"Light_Mercenary_Team", 3}
				,{"Mercenary_Team", 3}
				,{"Elite_Mercenary_Team", 3}
				,{"Scavenger_Team", 2}
				,{"Heavy_Scavenger_Team", 1}
				,{"PDF_Force_Cultist_Team", 0.1}				
				,{"SD_6_Droid_Company", 1}
				,{"SD_9_Droid_Company", 0.5, StartYear = 9}
				,{"SD_9_Assault_Droid_Company", 0.5, StartYear = 9}
				,{"CSA_B1_Droid_Squad", 1}
				,{"CSA_Destroyer_Droid_Company", 1}
				,{"Destroyer_Droid_II_Company", 0.5}
				,{"Overracer_Speeder_Bike_Company", 2}
				,{"X34_Technical_Company", 3}
				,{"Imperial_AT_AP_Walker_Company", 2}
				,{"Imperial_AT_RT_Company", 1}
				,{"Espo_Walker_Early_Squad", 2}
				,{"ISP_Company", 1}
				,{"Imperial_LAAT_Group", 1}
				,{"Imperial_MAAT_Group", 1}
				,{"AAC_1_Company", 1}
				,{"Imperial_TNT_Company", 1}
				,{"Imperial_TX130_Company", 2}
				,{"Imperial_ULAV_Company", 2}
				,{"Imperial_AT_PT_Company", 3}
				,{"Arrow_23_Company", 3}
				,{"ULAV_Early_Company", 2}
				,{"AA70_Company", 2}
				,{"T2A_Company", 2}
				,{"T1A_Company", 1}
				,{"Freerunner_Early_Company", 3}
				,{"Freerunner_Assault_Company", 1}
				,{"Storm_Cloud_Car_Group", 1}
				,{"Skyhopper_Group", 1}
				,{"Skyhopper_Antivehicle_Group", 1}
				,{"Skyhopper_Primitive_Group", 1}
				,{"Skyhopper_Security_Group", 1}
				,{"Imperial_Gaba18_Group", 1}
				,{"Rebel_Snowspeeder_Wing", 1}
				,{"Cor_VAAT_Group", 1}
				,{"Imperial_Modified_LAAT_Group", 0.5}					
				,{"Talon_Cloud_Car_Group", 1}
				,{"JX30_Group", 1}
				,{"T4A_Company", 2}
				,{"T3A_Company", 1}
				,{"SA5_Company_Early_Company", 2}
				,{"Imperial_SA5_Company", 0.5}
				,{"MZ8_Tank_Company", 1}
				,{"Canderous_Assault_Tank_Lasers_Company", 0.2}
				,{"Imperial_AT_TE_Walker_Company", 1}
				,{"Imperial_PX4_Company", 1}
				,{"Teklos_Company", 1}
				,{"Imperial_A5_Juggernaut_Company", 1}
				,{"Imperial_A6_Juggernaut_Company", 1}
				,{"Rebel_AA5_Company", 4}
				,{"Rebel_Freerunner_Company", 1}
				,{"Freerunner_AA_Company", 2}
				,{"Aratech_Battle_Platform_Company", 1}	
				,{"MAL_Rocket_Vehicle_Company", 1}
				,{"Gian_Company", 1}
				,{"Gian_PDF_Company", 1}
				,{"Gian_Rebel_Company", 1}
			},
			Groundbase_Table = IF_Groundbase,
			Starbase_Table = {
                "Empire_Star_Base_1",
                "Empire_Star_Base_2",			
                "Empire_Star_Base_3",
				"Empire_Star_Base_4",							
				"Empire_Star_Base_5",
            },
			Shipyard_Table = {
                "Empire_Shipyard_Level_One",
                "Empire_Shipyard_Level_Two",				
                "Empire_Shipyard_Level_Three",
				"Empire_Shipyard_Level_Four",																
            },
			Defenses_Table = Golan_Defenses,
			Government_Building = IF_Gov,
			GTS_Building = nil
		},
		GENERIC_UR = {
			Space_Unit_Table = {
				{"Action_VI_Support", 0.5}
				,{"Active_Frigate", 0.25}
				,{"Armadia", 0.5}
				,{"Baomu", 3}
				,{"Barabbula_Frigate", 0.5}
				,{"C_type_Thrustship", 0.5}
				,{"Calamari_Cruiser_Liner", 0.25}
				,{"Kuari_Princess_Liner", 0.1}
				,{"Captor", 1}
				,{"Charger_C70", 2}
				,{"Corellian_Corvette", 1}
				,{"Customs_Corvette", 2}
				,{"Etti_Lighter", 1}
				,{"Fruoro", 3}
				,{"Galleon", 0.5}
				,{"Home_One_Type_Liner", 0.25}
				,{"Invincible_Cruiser", 0.25}
				,{"IPV1_System_Patrol_Craft", 1}
				,{"Kuuro", 4}
				,{"Lucrehulk_Core_Destroyer", 0.25}
				,{"Lwhekk_Manufacturing_Ship", 1}
				,{"Marauder_Cruiser", 1}
				,{"Munificent", 0.5}
				,{"Muqaraea", 5}
				,{"Raka_Freighter_Tender", 1}
				,{"Rohkea", 3}
				,{"Skandrei_Gunship", 0.5}
				,{"Shree_Cruiser", 1}	
				,{"Space_ARC_Cruiser", 0.5}
				,{"Starbolt", 1}
				,{"Super_Transport_VI", 1}
				,{"Super_Transport_VII", 1}
				,{"Super_Transport_XI", 1}
				,{"Syndic_Destroyer", 1}
				,{"Syzygos", 2}
				,{"Szajin_Cruiser", 0.5}
				,{"Wurrif_Cruiser", 3}	
				,{"Gozanti_Cruiser_Squadron", 1}
				,{"Citadel_Cruiser_Squadron", 1}
				,{"YZ_775_Squadron", 1}
			}
		},
		BAKURANS = {
			Space_Unit_Table = {
				{"Bakura_Destroyer", 1}
				,{"Namana_Cruiser", 2}
				,{"Carrack_Cruiser", 2}
				,{"DP20_Zsinj", 4}
				,{"IPV1_System_Patrol_Craft", 5} --Standard IR-3F substitute
				,{"IPV4", 5, StartYear = 12}
			}
		},
		BALMORRANS = {
			Land_Unit_Table = {
				{"Military_Soldier_Team", 3}
				,{"CSA_B1_Droid_Squad", 2}
				,{"SD_6_Droid_Company", 5}
				,{"Imperial_AT_MP_Company", 1}
				,{"Imperial_AT_DP_Company", 1}
				,{"Imperial_AT_ST_Company", 1}
				,{"Imperial_AT_ST_A_Company", 1}
				,{"SD_9_Droid_Company", 2, StartYear = 9}
				,{"SD_9_Assault_Droid_Company", 2, StartYear = 9}
				,{"SD_10_Droid_Company", 2, StartYear = 10}
				,{"X1_Viper_Company", 2, StartYear = 10}
			},
			Government_Building = "Balmorran_Arms_HQ"
		},
		SULLUSTAN_HOME_GUARD = {
			Space_Unit_Table = {
				{"Bulwark_III", 0.1}
				,{"Quasar", 4}
				,{"Dauntless", 2}
				,{"Dauntless_Transport", 2}
				,{"Liberator_Cruiser", 3}
			},
			Land_Unit_Table = {
				{"Military_Soldier_Team", 3}
				,{"PDF_Soldier_Team", 3}
				,{"PDF_Tactical_Unit_Team", 3}
				,{"Light_Mercenary_Team", 3}
				,{"Mercenary_Team", 3}
				,{"Elite_Mercenary_Team", 3}
				,{"AAC_1_Company", 2}
				,{"Rebel_AAC_2_Company", 3}
				,{"Imperial_Flashblind_Group", 2}
				,{"Rebel_MPTL_Company", 1}	
				,{"Gian_Company", 1}
				,{"Gian_PDF_Company", 1}
				,{"Gian_Rebel_Company", 4}
			},
			Government_Building = "SoroSuub_HQ"
		},
		SIENAR = {
			Space_Unit_Table = {
				{"Generic_Dominator", 1}
				,{"Vindicator_Cruiser", 2}
				,{"Marauder_Cruiser", 3}
				,{"IPV1_System_Patrol_Craft", 5}
				,{"Guardian_Lasers_Squadron", 4}
				,{"Guardian_Squadron", 4}
				,{"YE_4_Squadron", 4}
			},
			Land_Unit_Table = {
				{"Security_Trooper_Team", 5}
				,{"Imperial_ULAV_Company", 3}
				,{"ULAV_Early_Company", 3}
				,{"Imperial_TIE_Mauler_Company", 3}
				,{"Imperial_Century_Tank_Company", 2}
				,{"Imperial_RTT_Company", 2}
				,{"Imperial_Lancet_Group", 1}	
			},
			Government_Building = "Sienar_HQ"
		},
		KDY = {
			Space_Unit_Table = {
				{"Generic_Secutor", 0.5}
				,{"Generic_Star_Destroyer_Two", 1}
				,{"Generic_Star_Destroyer", 1}
				,{"Generic_Tector", 1}
				,{"Generic_Procursator", 2}
				,{"Dragon_Heavy_Cruiser", 0.1}
				,{"Generic_Imperial_I_Frigate", 2}
				,{"Generic_Acclamator_Assault_Ship_II", 2}
				,{"Generic_Imperial_II_Frigate", 2}
				,{"Escort_Carrier", 3}
				,{"Eidolon", 3}
				,{"Broadside_Cruiser", 3}
				,{"Generic_Pursuit", 3}
				,{"Vigil", 4}
				,{"Victory_II_Frigate", 4}
				,{"Nebulon_B_Zsinj", 4}
				,{"Nebulon_B_Empire", 4, StartYear = 12}
				,{"Active_Frigate", 4}
				,{"Star_Galleon", 4}
				,{"Lancer_Frigate", 5}
				,{"Lancer_Frigate_Prototype", 2}
				,{"Raider_II_Corvette", 5}
				,{"Raider_Corvette", 5}
				,{"Decimator_Squadron", 5}
				,{"Adz", 2, StartYear = 12}
			},
			Land_Unit_Table = {
				{"Imperial_Army_Guard_Squad", 4}
				,{"Imperial_Army_Trooper_Squad", 4}
				,{"Imperial_Army_Special_Missions_Squad", 3}
				,{"Imperial_Navy_Trooper_Squad", 4}
				,{"Imperial_Navy_Commando_Squad", 3}
				,{"Imperial_Stormtrooper_Squad", 2}
				,{"Imperial_Compforce_Assault_Squad", 3}
				,{"Imperial_AT_MP_Company", 3}
				,{"Imperial_AT_DP_Company", 3}
				,{"Imperial_AT_ST_Company", 2}
				,{"Imperial_AT_ST_A_Company", 2}
				,{"Imperial_INT4_Group", 2}
				,{"Imperial_MAAT_Group", 2}
				,{"Imperial_IDT_Group", 2}
				,{"Imperial_SPMAT_Company", 1}
				,{"Imperial_SPMAG_Company", 1}
				,{"Imperial_A5_Juggernaut_Company", 1}
				,{"Imperial_C10_Siege_Tower_Company", 1}
				,{"Imperial_A9_Fortress_Company", 1}
				,{"Imperial_AT_AT_Company", 1}	
			},
			Government_Building = "KDY_HQ"
		},
		KDY_NR = {
			Space_Unit_Table = {
				{"Generic_Venator", 1}
				,{"Generic_Victory_Destroyer", 2}
				,{"Generic_Victory_Destroyer_Two", 2}
				,{"Generic_Acclamator_Assault_Ship_I", 3}
				,{"Corona", 5, StartYear = 10}
				,{"Nebulon_B_Frigate", 5}
				,{"Nebulon_B_Tender", 3}
				,{"Arquitens", 5}
				,{"Decimator_Squadron", 5}
			}
		},
		HARDLINERS = {
			Space_Unit_Table = {
				{"Generic_Maelstrom", 0.5}
				,{"Generic_Venator", 1}
				,{"Generic_Acclamator_Assault_Ship_I", 2}
				,{"Generic_Acclamator_Assault_Ship_II", 1}
				,{"Generic_Acclamator_Assault_Ship_Leveler", 1}
				,{"Quasar", 1}
				,{"Neutron_Star", 2}
				,{"Dreadnaught_Empire", 2}
				,{"Carrack_Cruiser", 2}
				,{"Charger_C70", 4}
				,{"IPV1_System_Patrol_Craft", 4}
				,{"Delta_JV7_Squadron", 4}
			},
			Land_Unit_Table = {
				{"CSA_B1_Droid_Squad", 1}
				,{"Imperial_Army_Trooper_Squad", 4}
				,{"Imperial_Stormtrooper_Squad", 2}
				,{"Imperial_BARC_Company", 2}
				,{"Imperial_Dwarf_Spider_Droid_Company", 1}
				,{"Imperial_AT_RT_Company", 2}
				,{"Imperial_TX130_Company", 2}
				,{"Imperial_AT_AP_Walker_Company", 1}
				,{"Imperial_AT_TE_Walker_Company", 1}
				,{"Imperial_LAAT_Group", 1}
				,{"Imperial_A6_Juggernaut_Company", 0.5}	
			}
		},
		ZANN_CONSORTIUM = {
			Space_Unit_Table = {
				{"Keldabe", 0.5}
				,{"Generic_Aggressor", 1}
				,{"Venator_Refit", 1}
				,{"Generic_Acclamator_Assault_Ship_II", 0.5}
				,{"Generic_Interdictor_Cruiser", 0.5}
				,{"Broadside_Cruiser", 0.5}
				,{"Star_Galleon", 1}
				,{"Vengeance_Frigate", 2}
				,{"Nebulon_B_Frigate", 0.5}
				,{"Tartan_Patrol_Cruiser", 0.5}
				,{"Marauder_Missile_Cruiser", 0.5}
				,{"Marauder_Cruiser", 2}
				,{"Action_VI_Support", 4}
				,{"Interceptor_Frigate", 4}
				,{"Crusader_Gunship", 4}
				,{"IPV1_System_Patrol_Craft", 4}
				,{"Corellian_Corvette", 2}
			},
			Land_Unit_Table = {
				{"Light_Mercenary_Team", 2}
				,{"Mercenary_Team", 4}
				,{"Elite_Mercenary_Team", 2}
				,{"Imperial_Defiler_Squad", 2}
				,{"Destroyer_Droid_II_Company", 1}
				,{"Imperial_ISP_Company", 2}
				,{"Imperial_AT_ST_Company", 2}
				,{"MAL_Rocket_Vehicle_Company", 1}
				,{"Canderous_Assault_Tank_Company", 1}
				,{"Canderous_Assault_Tank_Lasers_Company", 1}
			}
		},
		MONCAL = {
			Space_Unit_Table = {
				{"Calamari_Cruiser", 2}
				,{"Kuari_Princess_Liner", 0.2}
				,{"MC80B", 1}
				,{"MC40a", 3}
				,{"MC30c", 3}
				,{"MC30a", 5}
				,{"Home_One_Type_Liner", 1}
				,{"Generic_Providence", 0.5}
				,{"Recusant", 0.5}
			}
		},
		YUTRANE = {
			Land_Unit_Table = {
				{"Military_Soldier_Team", 3}
				,{"PDF_Tactical_Unit_Team", 3}
				,{"Mercenary_Team", 3}
				,{"Elite_Mercenary_Team", 3}
				,{"Rebel_T1B_Company", 3}
				,{"Rebel_T2B_Company", 3}
				,{"Rebel_T3B_Company", 2}
				,{"Rebel_T4B_Company", 2}
				,{"T1A_Company", 3}
				,{"T2A_Company", 3}
				,{"T3A_Company", 2}
				,{"T4A_Company", 2}
				,{"MZ8_Tank_Company", 2}
			},
			Government_Building = "Yutrane_Trackata_HQ"
		},
	}
	
	local returnValue = Faction_Table[faction]
	
	local override = Faction_Table[rosterOverride]
	
	if returnValue == nil then
		returnValue = Faction_Table["INDEPENDENT_FORCES"]
	end
	
	if override ~= nil and rosterOverride ~= faction then
		if override.Space_Unit_Table ~= nil then
			returnValue.Space_Unit_Table = override.Space_Unit_Table
		end
		if override.Land_Unit_Table ~= nil then
			returnValue.Land_Unit_Table = override.Land_Unit_Table
		end
		if faction == "INDEPENDENT_FORCES" or faction == "WARLORDS" then
			if override.Groundbase_Table ~= nil then
				returnValue.Groundbase_Table = override.Groundbase_Table
			end
			if override.Starbase_Table ~= nil then
				returnValue.Starbase_Table = override.Starbase_Table
			end
			if override.Shipyard_Table ~= nil then
				returnValue.Shipyard_Table = override.Shipyard_Table
			end
			if override.Defenses_Table ~= nil then
				returnValue.Defenses_Table = override.Defenses_Table
			end
			if override.Government_Building ~= nil then
				returnValue.Government_Building = override.Government_Building
			end
			if override.GTS_Building ~= nil then
				returnValue.GTS_Building = override.GTS_Building
			end
		end
	end

	return returnValue
end