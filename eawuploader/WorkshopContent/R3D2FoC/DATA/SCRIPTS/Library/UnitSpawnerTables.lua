
function DefineUnitTable(faction, rosterOverride)
	
	if not (faction == "PLAYER") and rosterOverride == "ZANN_CONSORTIUM" then
		rosterOverride = nil
	end
	
	local Faction_Table = {
		REPUBLIC = {
			Space_Unit_Table = {
				{"ICF3_Frigate", 2}		
				,{"Besh_Bomber_Squadron", 5}
				,{"Counselor_Corvette", 5}				
				,{"CR90", 5}				
				,{"REP_Carrack", 4}
				,{"DP20", 4}
				,{"Nebulon_B_Empire", 4}
				,{"Z95_Headhunter_Republic_Squadron", 5}
				,{"Carrack_Cruiser", 4}
				,{"Praetorian_Frigate", 4}
				,{"REP_Paladin", 4}
				,{"Hammerhead_Frigate", 3}
				,{"REP_Dreadnought", 4}
				,{"REP_PDF_Dreadnought", 5}
				,{"Rep_Acclamator", 3}
				,{"Venator_Destroyer", 2}
				,{"Victory_Destroyer_I", 3}
				,{"Star_Destroyer_REP", 1}
				,{"Invincible", 1}
				,{"Inexpugnable", 1}
			},
			Land_Unit_Table = {
				{"PDF_Squad", 4}
				,{"Lance_Walker_Squad", 3}
				,{"Pod_Walker_Rep_Squad", 3}		
				,{"Manka_Company", 2}
			},
			Groundbase_Table = {
				"REP_Ground_Barracks",
                "REP_Ground_Light_Vehicle_Factory_Era1",				
                "REP_Ground_Heavy_Vehicle_Factory_Era1",		
			},
			Starbase_Table = {
                "Republic_Star_Base_1",
                "Republic_Star_Base_2",					
                "Republic_Star_Base_3",
				"Republic_Star_Base_4",									
				"Republic_Star_Base_5",								
            },
			Shipyard_Table = {
                "Light_Shipyard_Republic_Era1",
                "Medium_Shipyard_Republic_Era1",	
                "Heavy_Shipyard_Republic_Era1",															
            },
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
	
	local returnValue = Faction_Table[faction]
	
	local override = Faction_Table[rosterOverride]
	
	if returnValue == nil then
		returnValue = Faction_Table["PLAYER"]
	end
	
	if override ~= nil and rosterOverride ~= faction then
		if override.Space_Unit_Table ~= nil then
			returnValue.Space_Unit_Table = override.Space_Unit_Table
		end
		if override.Land_Unit_Table ~= nil then
			returnValue.Land_Unit_Table = override.Land_Unit_Table
		end
		if faction == "PLAYER" then
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