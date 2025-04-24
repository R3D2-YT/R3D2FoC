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
--*   @Filename:            UnitSwitcherLibrary.lua
--*   @Last modified by:    [TR]Jorritkarwehr
--*   @Last modified time:  2018-03-26T09:58:14+02:00
--*   @License:             This source code may only be used with explicit permission from the developers
--*   @Copyright:           © TR: Imperial Civil War Development Team
--******************************************************************************

function Get_Swap_Entry(upgrade_object)
	local swaps = {
		-- Ship swaps for heroes
		["ACKBARHO2GV"] = {"Home_One","Galactic_Voyager"},
		["ACKBARGV2HO"] = {"Galactic_Voyager","Home_One"},
		["NANTZIN2FW"] = {"Nantz_Independence","Nantz_Faithful_Watchman"},
		["NANTZFW2IN"] = {"Nantz_Faithful_Watchman","Nantz_Independence"},
		["SOVVDAUNT2VP"] = {"Sovv_Dauntless","Sovv_Voice_of_the_People"},
		["SOVVVP2DAUNT"] = {"Sovv_Voice_of_the_People","Sovv_Dauntless"},
		["DRAYSONTF2NH"] = {"Drayson_True_Fidelity","Drayson_New_Hope"},
		["DRAYSONNH2TF"] = {"Drayson_New_Hope","Drayson_True_Fidelity"},
		["BRANDINDOMITABLE2YALD"] = {"Brand_Indomitable","Brand_Yald"},
		["BRANDYALD2INDOMITABLE"] = {"Brand_Yald","Brand_Indomitable"},
		["TROONOLUPGRADE"] = {"Troonol_Agrelcu_Haalta","Troonol_Karabos"},
		-- Ship upgrades for heroes
		["SNUNBUPGRADE"] = {"Snunb_Antares_Six","Snunb_Resolve"},
		["IBLISUPGRADE"] = {"Iblis_Peregrine","Iblis_Selonian_Fire"},
		["IBLISUPGRADE2"] = {"Iblis_Selonian_Fire","Iblis_Bail_Organa"},
		["IBLISUPGRADE3"] = {"Iblis_Selonian_Fire","Iblis_Harbinger"},
		["IBLISUPGRADE4"] = {"Iblis_Bail_Organa","Iblis_Harbinger"},
		["MASSAUPGRADE"] = {"Massa_Lucrehulk_Auxiliary","Massa_Lucrehulk_Carrier"},
		["TERRIKUPGRADE"] = {"Errant_Venture","Errant_Venture_Two"},
		["DELVARDUS_THALASSAUPGRADE"] = {"Delvardus_Thalassa","Delvardus_Night_Hammer"},
		["BRILLIANTUPGRADE"] = {"Delvardus_Brilliant","Delvardus_Night_Hammer"}, 
		["BRILLIANTUPGRADE_REUNIFICATION"] = {"Delvardus_Brilliant","Delvardus_Night_Hammer"}, 
		["BRILLIANTUPGRADEEARLY"] = {"Delvardus_Brilliant","Delvardus_Thalassa"}, 
		["KAINEUPGRADE"] = {"Ardus_Kaine","Kaine_Reaper"},
		["IRONFISTUPGRADE"] = {"Zsinj_Iron_Fist_VSD","Zsinj_Iron_Fist_Executor"},
		["ISARDUPGRADE"] = {"Ysanne_Isard","Isard_Lusankya"},
		["DAALAUPGRADE"] = {"Daala_Gorgon","Daala_Knight_Hammer"},
		["DAALAUPGRADE_REUNIFICATION"] = {"Daala_Gorgon","Daala_Knight_Hammer"}, 
		["PELLAEONUPGRADE"] = {"Pellaeon_Grand_Chimaera","Pellaeon_Reaper"},
		["PELLAEONUPGRADE2"] = {"Pellaeon_Grand_Chimaera","Pellaeon_Megador"},
		["ROGRISSUPGRADE"] = {"Rogriss_Agonizer","Rogriss_Dominion"},
		
		-- CSA Corporate Hire
		["DUMMY_RECRUIT_GROUP_SIIN_SUUB_CSA"] = {nil,{"Siin_Suub_Proclamation"}},
		["DUMMY_RECRUIT_GROUP_TAGGE_CSA"] = {nil,{"Ulric_Tagge"}},
		-- Imperial Legitimacy
		["DUMMY_RECRUIT_GROUP_TAGGE"] = {nil,{"Ulric_Tagge"}},
		["DUMMY_RECRUIT_GROUP_ANTEM"] = {nil,{"Getelles_Team", "Larm_Carrack"}},
		["DUMMY_RECRUIT_GROUP_LUMIYA_SITH"] = {nil,{"Lumiya_Team", "Bethrogg_Behemoth"}},
		["DUMMY_RECRUIT_GROUP_COMMENOR"] = {nil,{"Gendarr_Reliance", "Lott_Team"}},
		["DUMMY_RECRUIT_GROUP_ELROOD"] = {nil,{"Pryl_Thunderflare", "Zed_Stalker", "Andal_Team"}},
		["DUMMY_RECRUIT_GROUP_STORM_COMMANDO"] = {nil,{"Weir_Team", "Strang_Team", "Irlyn_Team"}},
		["DUMMY_RECRUIT_GROUP_NABOO"] = {nil,{"Jenn_Team", "Panaka_Theed"}},
		["DUMMY_RECRUIT_GROUP_STARLYTE"] = {nil,{"Brezzic_Team", "Arissa_Team"}},
		["DUMMY_RECRUIT_GROUP_TRAX"] = {nil,{"Resner_Folly", "Heggel_Tabal"}},
		["DUMMY_RECRUIT_GROUP_RADAMA"] = {nil,{"Wellam_Eternal_Wrath", "Jocaos_Team", "Xantus_Team", "Ellor_Team"}},
		["DUMMY_RECRUIT_GROUP_TAPANI"] = {nil,{"Darius_Shield_Breaker", "Corvae_Team", "Jion_Team", "Jaset_Team"}},
		["DUMMY_RECRUIT_GROUP_RAYTER"] = {nil,{"Owen_Team", "Sahreel_Impending_Doom"}},
		["DUMMY_RECRUIT_GROUP_GAROS"] = {nil,{"Carner_Team", "Zakar_Team"}},
		["DUMMY_RECRUIT_GROUP_GOROTH"] = {nil,{"Kloff_Team", "DeGoort_Valor"}},
		["DUMMY_RECRUIT_GROUP_NISHR"] = {nil,{"Kollis_Team"}},
		["DUMMY_RECRUIT_GROUP_ARDA"] = {nil,{"Balrekk_Team", "Vorrel_Team"}},
		["DUMMY_RECRUIT_GROUP_GRUNGER"] = {nil,{"Grunger_Aggressor"}},
		["DUMMY_RECRUIT_GROUP_DROMMEL"] = {nil,{"Drommel_Guardian"}},
		["DUMMY_RECRUIT_GROUP_DANGOR"] = {nil,{"Dangor_Javelin"}},
		["DUMMY_RECRUIT_GROUP_RHAMALAI"] = {nil,{"Yrros_Team", "Vedder_Team"}},
		["DUMMY_RECRUIT_GROUP_STORMTROOPER"] = {nil,{"TX5532_Team", "Tennar_Team"}},
		["DUMMY_RECRUIT_GROUP_DELURIN"] = {nil,{"Delurin_Galaxy_Dragon"}},
		["DUMMY_RECRUIT_GROUP_LAMBDA"] = {nil,{"Lankin_Knight", "Tount_Team", "Baem_Team", "Grieves_Team"}},
		["DUMMY_RECRUIT_GROUP_WESSEX"] = {nil,{"Wessex_Dauntless", "Wessex_Redoubt"}},
		["DUMMY_RECRUIT_GROUP_ZANN"] = {nil,{"Tyber_Zann_Team", "Urai_Fen_Team", "Sykes_EndofDays"}},
		["DUMMY_RECRUIT_GROUP_NIVERS"] = {nil,{"Nivers_Team"}},
		["DUMMY_RECRUIT_GROUP_TRANSNEBULAR"] = {nil,{"VeNiste_Team", "Brello_Team"}},
		["DUMMY_RECRUIT_GROUP_TATOOINE"] = {nil,{"Terro_Team", "Kosh_Team"}},
		["DUMMY_RECRUIT_GROUP_GRONN"] = {nil,{"Gronn_Aculeus"}},
		["DUMMY_RECRUIT_GROUP_MINOS"] = {nil,{"Torsch_Appropriator", "Raas_Team"}},
		["DUMMY_RECRUIT_GROUP_VOGEL"] = {nil,{"Trommer_Ravagor", "Hauser_Team"}},
		["DUMMY_RECRUIT_GROUP_PULSAR"] = {nil,{"Reder_Krieger", "Niclara_Pulsars_Revenge"}},
		["DUMMY_RECRUIT_GROUP_TIERFON"] = {nil,{"Tzenkens_Atlas"}},
		["DUMMY_RECRUIT_GROUP_SILLUME"] = {nil,{"Parnell_Super_Transport_XI"}},
		["DUMMY_RECRUIT_GROUP_SELLASAS"] = {nil,{"Kedler_Eleos", "Jedselk_Team", "Amara_Jedselk_Team"}},
		["DUMMY_RECRUIT_GROUP_RESTUSS"] = {nil,{"Grot_Resolution", "Exov_Team", "Okto_Team", "Roth_Team"}},
		["DUMMY_RECRUIT_GROUP_DOLIS_3"] = {nil,{"Chik_Apla_Team", "Anlys_Takkar_Team", "Derran_Takkar_Team", "Gatecrashers_Team"}},
		["DUMMY_RECRUIT_GROUP_RAVEEN"] = {nil,{"Raveen_Predominant"}},
		["DUMMY_RECRUIT_GROUP_PRAKITH"] = {nil,{"Yzu_Constitution", "Foga_Brill_Team", "Gann_Team", "Imperial_Dark_Jedi_Squad", "Imperial_Dark_Jedi_Squad"}},
		["DUMMY_RECRUIT_GROUP_PRENTIOCH"] = {nil,{"Prentioch_Prentioch", "Dyrra_Team"}},
		["DUMMY_RECRUIT_GROUP_VERPALION"] = {nil,{"Verpalion_Warlord"}},
		["DUMMY_RECRUIT_GROUP_MAELSTROM"] = {nil,{"Torpin_Passenger", "Vanko_Invincible", "Vatoki_Team"}},
		["DUMMY_RECRUIT_GROUP_KAMINO"] = {nil,{"Dark_Apprentice_Team", "Cody_Team", "Touler_Korasa_Maze"}},
	}
	return swaps[upgrade_object]
end