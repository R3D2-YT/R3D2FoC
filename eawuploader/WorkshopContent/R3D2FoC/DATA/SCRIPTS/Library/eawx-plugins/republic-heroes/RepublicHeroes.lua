--**************************************************************************************************
--*    _______ __                                                                                  *
--*   |_     _|  |--.----.---.-.--.--.--.-----.-----.                                              *
--*     |   | |     |   _|  _  |  |  |  |     |__ --|                                              *
--*     |___| |__|__|__| |___._|________|__|__|_____|                                              *
--*    ______                                                                                      *
--*   |   __ \.-----.--.--.-----.-----.-----.-----.                                                *
--*   |      <|  -__|  |  |  -__|     |  _  |  -__|                                                *
--*   |___|__||_____|\___/|_____|__|__|___  |_____|                                                *
--*                                   |_____|                                                      *
--*                                                                                                *
--*                                                                                                *
--*       File:              RepublicHeroes.lua                                                     *
--*       File Created:      Monday, 24th February 2020 02:19                                      *
--*       Author:            [TR] Jorritkarwehr                                                             *
--*       Last Modified:     Monday, 24th February 2020 02:34                                      *
--*       Modified By:       [TR] Jorritkarwehr                                                             *
--*       Copyright:         Thrawns Revenge Development Team                                      *
--*       License:           This code may not be used without the author's explicit permission    *
--**************************************************************************************************

require("PGStoryMode")
require("PGSpawnUnits")
require("deepcore/std/class")
require("HeroSystem")
require("SetFighterResearch")

RepublicHeroes = class()
StoryUtil = require("eawx-util/StoryUtil")
UnitUtil = require("eawx-util/UnitUtil")

function RepublicHeroes:new(gc, herokilled_finished_event, human_player)
	self.human_player = human_player
	gc.Events.GalacticProductionFinished:attach_listener(self.on_production_finished, self)
	herokilled_finished_event:attach_listener(self.on_galactic_hero_killed, self)
	self.inited = false
	self.NJOspeech = false
	self.NJOinit = false
	
	crossplot:subscribe("NR_ADMIRAL_DECREMENT", self.admiral_decrement, self)
	crossplot:subscribe("NR_ADMIRAL_LOCKIN", self.admiral_lockin, self)
	crossplot:subscribe("NR_ADMIRAL_EXIT", self.admiral_exit, self)
	crossplot:subscribe("NR_ADMIRAL_STORYLOCK", self.admiral_storylock, self)
	crossplot:subscribe("NR_ADMIRAL_RETURN", self.admiral_return, self)
	
	crossplot:subscribe("NR_FILTER_ADD", self.Add_Filter_Options, self)
	crossplot:subscribe("NR_FILTER_REMOVE", self.Remove_Filter_Options, self)
	
	crossplot:subscribe("ERA_THREE_TRANSITION", self.Era_3, self)
	crossplot:subscribe("ERA_FOUR_TRANSITION", self.Era_4, self)
	crossplot:subscribe("ERA_SEVEN_TRANSITION", self.Era_7, self)
	
	crossplot:subscribe("NCMP2_HEROES", self.NCMP2_handler, self)
	crossplot:subscribe("BAC_HEROES", self.Bothan_Heroes, self)
	crossplot:subscribe("MEDIATOR_HEROES", self.Mediator_Heroes, self)
	
	crossplot:subscribe("NJO_CREATED", self.New_Jedi_Order_Init, self)
	crossplot:subscribe("NR_CANON_ADMIRALS", self.Canon_Heroes, self)
	
	admiral_data = {
		total_slots = 4,			--Max slot number. Set at the start of the GC and never change
		free_hero_slots = 4,		--Slots open to buy
		vacant_hero_slots = 0,	    --Slots that need another action to move to free
		vacant_limit = 5,           --Number of times a lost slot can be reopened
		initialized = false,
		full_list = { --All options for reference operations
			["Ackbar"] = {"ACKBAR_ASSIGN",{"ACKBAR_RETIRE","ACKBAR_RETIRE2"},{"HOME_ONE","GALACTIC_VOYAGER","ACKBAR_GUARDIAN"},"Gial Ackbar"},
			["Nantz"] = {"NANTZ_ASSIGN",{"NANTZ_RETIRE","NANTZ_RETIRE2"},{"NANTZ_INDEPENDENCE","NANTZ_FAITHFUL_WATCHMAN"},"Firmus Nantz"},
			["Sovv"] = {"SOVV_ASSIGN",{"SOVV_RETIRE","SOVV_RETIRE2"},{"SOVV_DAUNTLESS","SOVV_VOICE_OF_THE_PEOPLE"},"Sien Sovv"},
			["Han_Solo_Mon_Remonda"] = {"HAN_SOLO_MON_REMONDA_ASSIGN",{"HAN_SOLO_MON_REMONDA_RETIRE"},{"HAN_SOLO_MON_REMONDA"},"Han Solo",["no_random"] = true, ["required_unit"] = "MILLENNIUM_FALCON", ["required_team"] = "HAN_SOLO_TEAM"},
			["Han_Solo_Intrepid"] = {"HAN_SOLO_INTREPID_ASSIGN",{"HAN_SOLO_INTREPID_RETIRE"},{"HAN_SOLO_INTREPID"},"Han Solo",["no_random"] = true, ["required_unit"] = "MILLENNIUM_FALCON", ["required_team"] = "HAN_SOLO_TEAM"}, --Han's forms are so separate that it's easier to handle them separately
			["Iblis"] = {"IBLIS_ASSIGN",{"IBLIS_RETIRE","IBLIS_RETIRE2","IBLIS_RETIRE3","IBLIS_RETIRE4"},{"IBLIS_PEREGRINE","IBLIS_SELONIAN_FIRE","IBLIS_BAIL_ORGANA","IBLIS_HARBINGER"},"Garm Bel Iblis"},
			["Drayson"] = {"DRAYSON_ASSIGN",{"DRAYSON_RETIRE","DRAYSON_RETIRE2"},{"DRAYSON_TRUE_FIDELITY","DRAYSON_NEW_HOPE"},"Hiram Drayson"},
			["Ragab"] = {"RAGAB_ASSIGN",{"RAGAB_RETIRE"},{"RAGAB_EMANCIPATOR"},"Ragab"},
			["Kalback"] = {"KALBACK_ASSIGN",{"KALBACK_RETIRE"},{"KALBACK_JUSTICE"},"Kalback"},
			["Tallon"] = {"TALLON_ASSIGN",{"TALLON_RETIRE"},{"TALLON_SILENT_WATER"},"Adar Tallon"},
			["Vantai"] = {"VANTAI_ASSIGN",{"VANTAI_RETIRE"},{"VANTAI_MOONSHADOW"},"Kir Vantai"},
			["Brand"] = {"BRAND_ASSIGN",{"BRAND_RETIRE","BRAND_RETIRE2"},{"BRAND_INDOMITABLE","BRAND_YALD"},"Turk Brand"},
			["Bell"] = {"BELL_ASSIGN",{"BELL_RETIRE"},{"BELL_ENDURANCE"},"Areta Bell"},
			["Abaht"] = {"ABAHT_ASSIGN",{"ABAHT_RETIRE"},{"ABAHT_INTREPID"},"Etahn A'baht"},
			["Nammo"] = {"NAMMO_ASSIGN",{"NAMMO_RETIRE"},{"NAMMO_DEFIANCE"},"Nammo"},
			["Krefey"] = {"KREFEY_ASSIGN",{"KREFEY_RETIRE"},{"KREFEY_RALROOST"},"Traest Kre'fey"},
			["Snunb"] = {"SNUNB_ASSIGN",{"SNUNB_RETIRE","SNUNB_RETIRE2"},{"SNUNB_ANTARES_SIX","SNUNB_RESOLVE"},"Syub Snunb"},
			["Ackdool"] = {"ACKDOOL_ASSIGN",{"ACKDOOL_RETIRE"},{"ACKDOOL_MEDIATOR"},"Ackdool"},
			["Burke"] = {"BURKE_ASSIGN",{"BURKE_RETIRE"},{"BURKE_REMEMBER_ALDERAAN"},"Willham Burke"},
			["Massa"] = {"MASSA_ASSIGN",{"MASSA_RETIRE","MASSA_RETIRE2"},{"MASSA_LUCREHULK_AUXILIARY","MASSA_LUCREHULK_CARRIER"},"Voon Massa"},
			["Dorat"] = {"DORAT_ASSIGN",{"DORAT_RETIRE"},{"DORAT_ARROW_OF_SULLUST"},"Chel Dorat"},
			["Grant"] = {"GRANT_ASSIGN",{"GRANT_RETIRE"},{"GRANT_ORIFLAMME"},"Octavian Grant"},
			["Lando"] = {"LANDO_ASSIGN",{"LANDO_RETIRE","LANDO_RETIRE2"},{"LANDO_LIBERATOR","LANDO_ALLEGIANCE"},"Lando Calrissian",["no_random"] = true},
			["Raddus"] = {"RADDUS_ASSIGN",{"RADDUS_RETIRE"},{"RADDUS_PROFUNDITY"},"Raddus"},
			["Hera"] = {"HERA_ASSIGN",{"HERA_RETIRE"},{"HERA_STARHAWK"},"Hera Syndulla"},
			-- Historical command staff
			["Standish"] = {"TEMPLATE_FLAGSHIP_SWAP",{"TEMPLATE_FLAGSHIP_SWAP"},{"ANTON_STANDISH"},"Anton Standish",["Locked"] = true},
		},
		available_list = {--Heroes currently available for purchase. Seeded with those who have no special prereqs
			"Ackbar",
			"Nantz",
			"Sovv",
			"Han_Solo_Mon_Remonda",
			"Drayson",
			"Ragab",
			"Kalback",
			"Tallon",
			"Vantai",
			"Snunb",
			"Burke",
			"Massa",
		},
		story_locked_list = {--Heroes not accessible, but able to return with the right conditions
			["Dorat"] = true,
			["Lando"] = true,
		},
		active_player = Find_Player("Rebel"),
		extra_name = "EXTRA_ADMIRAL_SLOT",
		random_name = "RANDOM_ADMIRAL_ASSIGN",
		global_display_list = "NR_ADMIRAL_LIST", --Name of global array used for documention of currently active heroes
		disabled = false
	}

	general_data = {
		total_slots = 3,			--Max slot number. Set at the start of the GC and never change
		free_hero_slots = 3,		--Slots open to buy
		vacant_hero_slots = 0,	    --Slots that need another action to move to free
		vacant_limit = 3,           --Number of times a lost slot can be reopened
		initialized = false,
		full_list = { --All options for reference operations
			["Calrissian"] = {"CALRISSIAN_ASSIGN",{"CALRISSIAN_RETIRE"},{"LANDO_CALRISSIAN"},"Lando Calrissian", ["Companies"] = {"LANDO_CALRISSIAN_TEAM"}},
			["Northal"] = {"NORTHAL_ASSIGN",{"NORTHAL_RETIRE"},{"VIN_NORTHAL"},"Vin Northal", ["Companies"] = {"VIN_NORTHAL_TEAM"}},
			["Kryll"] = {"KRYLL_ASSIGN",{"KRYLL_RETIRE"},{"KRYLL"},"Kryll", ["Companies"] = {"KRYLL_TEAM"}},
			["Garret"] = {"GARRET_ASSIGN",{"GARRET_RETIRE"},{"ROGAR_GARRET"},"Rogar Garret", ["Companies"] = {"ROGAR_GARRET_TEAM"}},
			["Madine"] = {"MADINE_ASSIGN",{"MADINE_RETIRE"},{"CRIX_MADINE"},"Crix Madine", ["Companies"] = {"CRIX_MADINE_TEAM"}},
			["Cracken"] = {"CRACKEN_ASSIGN",{"CRACKEN_RETIRE"},{"AIREN_CRACKEN"},"Airen Cracken", ["Companies"] = {"AIREN_CRACKEN_TEAM"}},
			["Taskeen"] = {"TASKEEN_ASSIGN",{"TASKEEN_RETIRE"},{"TYR_TASKEEN"},"Tyr Taskeen", ["Companies"] = {"TYR_TASKEEN_TEAM"}},
			["Tantor"] = {"TANTOR_ASSIGN",{"TANTOR_RETIRE"},{"BRENN_TANTOR"},"Brenn Tantor", ["Companies"] = {"BRENN_TANTOR_TEAM"}},
			["Jamiro"] = {"JAMIRO_ASSIGN",{"JAMIRO_RETIRE"},{"TIGRAN_JAMIRO"},"Tigran Jamiro", ["Companies"] = {"TIGRAN_JAMIRO_TEAM"}},
			["Veertag"] = {"VEERTAG_ASSIGN",{"VEERTAG_RETIRE"},{"DURON_VEERTAG"},"Duron Veertag", ["Companies"] = {"DURON_VEERTAG_TEAM"}},
			["Tulon"] = {"TULON_ASSIGN",{"TULON_RETIRE"},{"BERI_TULON"},"Beri Tulon", ["Companies"] = {"BERI_TULON_TEAM"}},
		},
		available_list = {--Heroes currently available for purchase. Seeded with those who have no special prereqs
			"Calrissian",
			"Northal",
			"Kryll",
			"Garret",
			"Madine",
			"Cracken",
			"Taskeen",
			"Tantor",
			"Jamiro",
			"Veertag",
			"Tulon",
		},
		story_locked_list = {},--Heroes not accessible, but able to return with the right conditions
		active_player = Find_Player("Rebel"),
		extra_name = "EXTRA_GENERAL_SLOT",
		random_name = "RANDOM_GENERAL_ASSIGN",
		global_display_list = "NR_GENERAL_LIST", --Name of global array used for documention of currently active heroes
		disabled = true
	}
	
	council_data = {
		total_slots = 1,			--Max slot number. Set at the start of the GC and never change
		free_hero_slots = 1,		--Slots open to buy
		vacant_hero_slots = 0,	    --Slots that need another action to move to free
		vacant_limit = 1,           --Number of times a lost slot can be reopened
		initialized = false,
		full_list = { --All options for reference operations
			["Corran"] = {"CORRAN_ASSIGN",{"CORRAN_RETIRE"},{"CORRAN_HORN"},"Corran Horn", ["Companies"] = {"CORRAN_HORN_TEAM"}},
			["Kyle"] = {"KYLE_ASSIGN",{"KYLE_RETIRE"},{"KYLE_KATARN"},"Kyle Katarn", ["Companies"] = {"KATARN_TEAM"}},
			["Mara"] = {"MARA_ASSIGN",{"MARA_RETIRE"},{"MARA_JADE_LIGHTSABER"},"Mara Jade", ["Companies"] = {"MARA_SABER_TEAM"}},
			["Cilghal"] = {"CILGHAL_ASSIGN",{"CILGHAL_RETIRE"},{"CILGHAL"},"Cilghal", ["Companies"] = {"CILGHAL_TEAM"}},
			-- Historical command staff
			["Mander"] = {"TEMPLATE_FLAGSHIP_SWAP",{"TEMPLATE_FLAGSHIP_SWAP"},{"MANDER_ZUMA"},"Mander Zuma", ["Companies"] = {"ZUMA_TEAM"},["Locked"] = true},
		},
		available_list = {--Heroes currently available for purchase. Seeded with those who have no special prereqs
			"Kyle",
		},
		story_locked_list = {},--Heroes not accessible, but able to return with the right conditions
		active_player = Find_Player("Rebel"),
		extra_name = "EXTRA_COUNCIL_SLOT",
		random_name = "RANDOM_COUNCIL_ASSIGN",
		global_display_list = "NR_JEDI_LIST", --Name of global array used for documention of currently active heroes
		disabled = true
	}
	
	CoS_dummies = {
		"Candidate_Leia",
		"Candidate_Borsk",
		"Candidate_Mothma",
		"Candidate_Gavrisom",
		"Candidate_Tevv",
		"Candidate_SoBilles",
		"Candidate_Navik",
	}
	CoS_dummies_enabled = false
	
	fighter_assigns = {
		"Wedge_Rogues_Location_Set",
		"SalmY_Location_Set",
		"Ranulf_Trommer_Location_Set",
	}
	fighter_assign_enabled = false
	
	viewers = {
		["VIEW_ADMIRALS"] = 1,
		["VIEW_GENERALS"] = 2,
		["VIEW_COUNCIL"] = 3,
		["VIEW_COS"] = 4,
		["VIEW_FIGHTERS"] = 5,
	}
	
	old_view = 1
	
	Krefey_Checks = 0
end

function RepublicHeroes:on_production_finished(planet, object_type_name)--object_type_name, owner)
	--Logger:trace("entering RepublicHeroes:on_production_finished")
	if not self.inited then
		self.inited = true
		self:init_heroes()
		if not admiral_data.active_player.Is_Human() then --All options for AI
			Enable_Hero_Options(admiral_data)
			Enable_Hero_Options(council_data)
			Enable_Hero_Options(general_data)
		end
		local temp = Find_First_Object("Jedi_Temple")
		if TestValid(temp) then
			self:New_Jedi_Order()
		end
	end
	if object_type_name == "DORAT_MASSA" then
		Handle_Hero_Exit("Dorat", admiral_data, true)
		Handle_Hero_Add("Massa", admiral_data)
	elseif object_type_name == "MASSA_DORAT" or object_type_name == "MASSA_DORAT2" then
		Handle_Hero_Exit("Massa", admiral_data, true)
		Handle_Hero_Add("Dorat", admiral_data)
	elseif object_type_name == "CALRISSIAN_G2A" then
		Handle_Hero_Exit("Calrissian", general_data, true)
		Handle_Hero_Add("Lando", admiral_data)
	elseif object_type_name == "LANDO_A2G" or object_type_name == "LANDO_A2G_TWO" then
		Handle_Hero_Exit("Lando", admiral_data, true)
		Handle_Hero_Add("Calrissian", general_data)
	elseif object_type_name == "JEDI_TEMPLE" then
		self:New_Jedi_Order()
	elseif object_type_name == "REFORM_ROGUES" then
		Remove_Fighter_Set("Reform_Rogues")
		UnitUtil.SetBuildable(admiral_data.active_player, "Wedge_Rogues_Location_Set", true)
		UnitUtil.SetBuildable(admiral_data.active_player, "Tycho_Rogues_Location_Set", true)
	elseif object_type_name == "REFORM_127TH" then
		local assign_unit = Find_Object_Type("Reform_127th")
		Find_Player("Zsinj_Empire").Lock_Tech(assign_unit)		
		UnitUtil.SetBuildable(Find_Player("Zsinj_Empire"), "Jag_127th_Location_Set", true)
	elseif object_type_name == "REBUILD_BRASHIN" then
		GlobalValue.Set("BRASHIN_TRMB_DEAD", nil)
		local assign_unit = Find_Object_Type("Rebuild_Brashin")
		Find_Player("Empire").Lock_Tech(assign_unit)
	else
		if viewers[object_type_name] and admiral_data.active_player.Is_Human() then
			switch_views(viewers[object_type_name])
			local viewer = Find_First_Object(object_type_name)
			if TestValid(viewer) then
				viewer.Despawn()
			end
		end
		Handle_Build_Options(object_type_name, admiral_data)
		Handle_Build_Options(object_type_name, general_data)
		Handle_Build_Options(object_type_name, council_data)
		if object_type_name == "HAN_SOLO_INTREPID_ASSIGN" then
			Handle_Hero_Exit("Abaht", admiral_data)
			Transfer_Fighter_Hero("ABAHT_INTREPID", "HAN_SOLO_INTREPID")
			if admiral_data.active_player.Is_Human() then
				StoryUtil.Multimedia("TEXT_CONQUEST_HAN_INTREPID", 20, nil, "Han_Solo_Loop", 0)
			end
		elseif object_type_name == "HAN_SOLO_INTREPID_RETIRE" then
			Handle_Hero_Add("Abaht", admiral_data)
			Transfer_Fighter_Hero("HAN_SOLO_INTREPID", "ABAHT_INTREPID")
		end
	end
end

function switch_views(new_view)
	--Logger:trace("entering RepublicHeroes:switch_views")
	
	local tech_unit
	
	if new_view == 1 then
		tech_unit = Find_Object_Type("VIEW_ADMIRALS")
		admiral_data.active_player.Lock_Tech(tech_unit)
		Enable_Hero_Options(admiral_data)
		Show_Hero_Info(admiral_data)
	end

	if new_view == 2 then
		tech_unit = Find_Object_Type("VIEW_GENERALS")
		admiral_data.active_player.Lock_Tech(tech_unit)
		Enable_Hero_Options(general_data)
		Show_Hero_Info(general_data)
	end

	if new_view == 3 then
		tech_unit = Find_Object_Type("VIEW_COUNCIL")
		admiral_data.active_player.Lock_Tech(tech_unit)
		Enable_Hero_Options(council_data)
		Show_Hero_Info(council_data)
	end
	
	if new_view == 4 then
		tech_unit = Find_Object_Type("VIEW_COS")
		admiral_data.active_player.Lock_Tech(tech_unit)
		Enable_CoS_Dummies()
		CoS_dummies_enabled = true
	end
	
	if new_view == 5 then
		tech_unit = Find_Object_Type("VIEW_FIGHTERS")
		admiral_data.active_player.Lock_Tech(tech_unit)
		Enable_Fighter_Sets()
		fighter_assign_enabled = true
	end
	
	if old_view == 1 and admiral_data.vacant_limit > -1 then
		tech_unit = Find_Object_Type("VIEW_ADMIRALS")
		admiral_data.active_player.Unlock_Tech(tech_unit)
		Disable_Hero_Options(admiral_data)
	end

	if old_view == 2 and general_data.vacant_limit > -1 then
		tech_unit = Find_Object_Type("VIEW_GENERALS")
		admiral_data.active_player.Unlock_Tech(tech_unit)
		Disable_Hero_Options(general_data)
	end

	if old_view == 3 and council_data.vacant_limit > -1 then
		tech_unit = Find_Object_Type("VIEW_COUNCIL")
		admiral_data.active_player.Unlock_Tech(tech_unit)
		Disable_Hero_Options(council_data)
	end
	
	if old_view == 4 then
		tech_unit = Find_Object_Type("VIEW_COS")
		admiral_data.active_player.Unlock_Tech(tech_unit)
		Disable_CoS_Dummies()
		CoS_dummies_enabled = false
	end
	
	if old_view == 5 then
		tech_unit = Find_Object_Type("VIEW_FIGHTERS")
		admiral_data.active_player.Unlock_Tech(tech_unit)
		Disable_Fighter_Sets()
		fighter_assign_enabled = false
	end
	
	old_view = new_view
end

function RepublicHeroes:init_heroes()
	--Logger:trace("entering RepublicHeroes:init_heroes")
	init_hero_system(admiral_data)
	init_hero_system(general_data)
	init_hero_system(council_data)
	
	local tech_level = GlobalValue.Get("CURRENT_ERA")
	
	--Handle special actions for starting tech level
	if tech_level >= 2 then
		Handle_Hero_Exit("Kalback", admiral_data)
		Handle_Hero_Exit("Massa", admiral_data)
		Handle_Hero_Add("Dorat", admiral_data)
		local assign_unit = Find_Object_Type("DORAT_MASSA")
		admiral_data.active_player.Lock_Tech(assign_unit)
	end
	
	if tech_level >= 3 then
		Handle_Hero_Add("Iblis", admiral_data)
	end
	
	if tech_level >= 4 then
		Handle_Hero_Exit("Han_Solo_Mon_Remonda", admiral_data)
		Handle_Hero_Add("Grant", admiral_data)
		local assign_unit = Find_Object_Type("GRANT_RETIRE") --Starts locked as to not be there when PA Grant is attacking
		admiral_data.active_player.Unlock_Tech(assign_unit)
	end
	
	if tech_level >= 5 then
		Handle_Hero_Exit("Ragab", admiral_data)
		set_unit_index("Lando", 2, admiral_data)
	end
	
	if tech_level >= 7 then
		Handle_Hero_Add("Brand", admiral_data)
		Handle_Hero_Add("Abaht", admiral_data)
		Handle_Hero_Add("Han_Solo_Intrepid", admiral_data)
		Handle_Hero_Exit("Madine", general_data)
		Add_CoS("Candidate_Shesh")
		Krefey_Check()
		self:New_Jedi_Order()
		
		admiral_data.total_slots = admiral_data.total_slots + 1
		admiral_data.free_hero_slots = admiral_data.free_hero_slots + 1
		Unlock_Hero_Options(admiral_data)
	end
end

function RepublicHeroes:admiral_decrement(quantity, set, vacant)
	--Logger:trace("entering RepublicHeroes:admiral_decrement")
	local decrements = {}
	local systems = {admiral_data, general_data, council_data}
	
	local start = set
	local stop = set
	if set == 0 then
		start = 1
		stop = table.getn(systems)
		decrements = quantity
	else
		decrements[set] = quantity
	end
	
	for id=start,stop do
		if vacant then
			Set_Locked_Slots(systems[id], decrements[id])
		else
			Decrement_Hero_Amount(decrements[id], systems[id])
		end
	end
end

function RepublicHeroes:admiral_lockin(list, set)
	--Logger:trace("entering RepublicHeroes:admiral_lockin")
	if set == 1 then
		lock_retires(list, admiral_data)
	end
	if set == 2 then
		lock_retires(list, general_data)
	end
	if set == 3 then
		lock_retires(list, council_data)
	end
end

function RepublicHeroes:admiral_storylock(list, set)
	--Logger:trace("entering RepublicHeroes:admiral_storylock")
	if set == 1 then
		for _, tag in pairs(list) do
			Handle_Hero_Exit(tag, admiral_data, true)
		end
	end
	if set == 2 then
		for _, tag in pairs(list) do
			Handle_Hero_Exit(tag, general_data, true)
		end
	end
	if set == 3 then
		for _, tag in pairs(list) do
			Handle_Hero_Exit(tag, council_data, true)
		end
	end
end

function RepublicHeroes:admiral_exit(list, set)
	--Logger:trace("entering RepublicHeroes:admiral_exit")
	if set == 1 then
		for _, tag in pairs(list) do
			Handle_Hero_Exit(tag, admiral_data)
		end
	end
	if set == 2 then
		for _, tag in pairs(list) do
			Handle_Hero_Exit(tag, general_data)
		end
	end
	if set == 3 then
		for _, tag in pairs(list) do
			Handle_Hero_Exit(tag, council_data)
		end
	end
end

function RepublicHeroes:admiral_return(list, set)
	--Logger:trace("entering RepublicHeroes:admiral_return")
	if set == 1 then
		for _, tag in pairs(list) do
			if check_hero_exists(tag, admiral_data) then
				Handle_Hero_Add(tag, admiral_data)
			end
		end
	end
	if set == 2 then
		for _, tag in pairs(list) do
			if check_hero_exists(tag, general_data) then
				Handle_Hero_Add(tag, general_data)
			end
		end
	end
	if set == 3 then
		for _, tag in pairs(list) do
			if check_hero_exists(tag, council_data) then
				Handle_Hero_Add(tag, council_data)
			end
		end
	end
end

function RepublicHeroes:on_galactic_hero_killed(hero_name, owner)
	--Logger:trace("entering RepublicHeroes:on_galactic_hero_killed")
	if hero_name == "YSANNE_ISARD_TEAM" or hero_name == "ISARD_LUSANKYA" or hero_name == "LUSANKYA_NO_TRANSITION" then
		Find_Player("Rebel").Unlock_Tech(Find_Object_Type("Wedge_Lusankya"))
		if admiral_data.active_player.Is_Human() then
			StoryUtil.Multimedia("TEXT_CONQUEST_ISARD_DEATH", 20, nil, "Wedge_Loop", 0)
		end
	end
	if hero_name == "THRAWN_CHIMAERA" then
		if Handle_Hero_Exit("Kalback", admiral_data) then
			if admiral_data.active_player.Is_Human() then
				StoryUtil.Multimedia("TEXT_CONQUEST_KALBACK_RETIRE", 20, nil, "Kalback_Loop", 0)
			end
		end
	end
	if hero_name == "WEDGE_ANTILLES_ROGUE_TEAM" or hero_name == "TYCHO_CELCHU_ROGUE_TEAM" then
		if admiral_data.active_player.Is_Human() then
			Add_Fighter_Set("Reform_Rogues")
			UnitUtil.SetBuildable(admiral_data.active_player, "Wedge_Rogues_Location_Set", false)
			UnitUtil.SetBuildable(admiral_data.active_player, "Tycho_Rogues_Location_Set", false)
			Clear_Fighter_Hero("WEDGE_ANTILLES_ROGUE_TEAM")
			Clear_Fighter_Hero("TYCHO_CELCHU_ROGUE_TEAM")
			StoryUtil.ShowScreenText("Rogue Squadron has taken crippling casualties and must be reformed.", 5, nil, {r = 244, g = 244, b = 0})
		else
			admiral_data.active_player.Give_Money(-1000)
		end
	end
	local tag = Handle_Hero_Killed(hero_name, owner, admiral_data)
	if tag == "Ackbar" then
		if not check_hero_exists("Ackbar", admiral_data) then
			Handle_Hero_Add("Nammo", admiral_data)
		end
	elseif tag == "Massa" then
		local assign_unit = Find_Object_Type("DORAT_MASSA")
		admiral_data.active_player.Lock_Tech(assign_unit)
		
		if check_hero_exists("Dorat", admiral_data) then
			Handle_Hero_Add("Dorat", admiral_data)
		end
	elseif tag == "Dorat" then
		local assign_unit = Find_Object_Type("MASSA_DORAT")
		admiral_data.active_player.Lock_Tech(assign_unit)
		local assign_unit = Find_Object_Type("MASSA_DORAT2")
		admiral_data.active_player.Lock_Tech(assign_unit)
		
		if check_hero_exists("Massa", admiral_data) then
			Handle_Hero_Add("Massa", admiral_data)
		end
	elseif tag == "Han_Solo_Intrepid" or tag == "Han_Solo_Mon_Remonda" then
		local planet = StoryUtil.FindFriendlyPlanet(admiral_data.active_player)
		SpawnList({"Han_Solo_Team"}, planet, admiral_data.active_player, true, false)
		if admiral_data.active_player.Is_Human() then
			StoryUtil.Multimedia("TEXT_CONQUEST_HAN_RESPAWN", 20, nil, "Han_Solo_Loop", 0)
		end
	elseif tag == "Lando" then
		Handle_Hero_Add("Calrissian", general_data)
		local assign_unit = Find_Object_Type("CALRISSIAN_G2A")
		admiral_data.active_player.Lock_Tech(assign_unit)
		if admiral_data.active_player.Is_Human() then
			StoryUtil.Multimedia("TEXT_CONQUEST_LANDO_RESPAWN", 20, nil, "Lando_Loop", 0)
		end
	end
	Handle_Hero_Killed(hero_name, owner, general_data)
	Handle_Hero_Killed(hero_name, owner, council_data)
end

function RepublicHeroes:Era_3()
	--Logger:trace("entering RepublicHeroes:Era_3")
	Handle_Hero_Add("Iblis", admiral_data)
end

function RepublicHeroes:Era_4()
	--Logger:trace("entering RepublicHeroes:Era_4")
	Handle_Hero_Exit("Kalback", admiral_data)
end

function Krefey_Check()
	--Logger:trace("entering RepublicHeroes:Krefey_Check")
	Krefey_Checks = Krefey_Checks + 1
	if Krefey_Checks == 2 then
		Handle_Hero_Add("Krefey", admiral_data)
	end
end

function RepublicHeroes:Era_7()
	--Logger:trace("entering RepublicHeroes:Era_7")
	Handle_Hero_Add("Han_Solo_Intrepid", admiral_data)
	Krefey_Check()
	Add_CoS("Candidate_Shesh")
end

function RepublicHeroes:NCMP2_handler()
	--Logger:trace("entering RepublicHeroes:NCMP2_handler")
	admiral_data.total_slots = admiral_data.total_slots + 1
	admiral_data.free_hero_slots = admiral_data.free_hero_slots + 1
	
	Handle_Hero_Add("Bell", admiral_data)
	Handle_Hero_Add("Brand", admiral_data)
	Handle_Hero_Add("Abaht", admiral_data)
	local Han_Solo_Mon_Remonda_object = Find_First_Object("Han_Solo_Mon_Remonda")
	if TestValid(Han_Solo_Mon_Remonda_object) then
		local planet = Han_Solo_Mon_Remonda_object.Get_Planet_Location()
		if not TestValid(planet) then
			planet = StoryUtil.FindFriendlyPlanet(admiral_data.active_player, true)
		elseif not StoryUtil.CheckFriendlyPlanet(planet, admiral_data.active_player) then
			planet = StoryUtil.FindFriendlyPlanet(admiral_data.active_player, true)
		end
		if Handle_Hero_Exit("Han_Solo_Mon_Remonda", admiral_data) then
			SpawnList({"Han_Solo_Team"}, planet, admiral_data.active_player, true, false)
			if admiral_data.active_player.Is_Human() then
				StoryUtil.Multimedia("TEXT_CONQUEST_HAN_RETIRE", 20, nil, "Han_Solo_Loop", 0)
			end
		end
	else
		Handle_Hero_Exit("Han_Solo_Mon_Remonda", admiral_data)
	end
	Get_Active_Heroes(false, admiral_data)
end

function RepublicHeroes:New_Jedi_Order_Init()
	--Logger:trace("entering RepublicHeroes:New_Jedi_Order_Init")
	if admiral_data.active_player.Is_Human() and not self.NJOspeech then
		StoryUtil.Multimedia("TEXT_CONQUEST_LUKE_NJO", 20, nil, "Luke_Loop", 0)
	end
	self.NJOspeech = true
	local tech_unit = Find_Object_Type("JEDI_TEMPLE")
	admiral_data.active_player.Unlock_Tech(tech_unit)
	tech_unit = Find_Object_Type("JEDI_SQUAD")
	admiral_data.active_player.Unlock_Tech(tech_unit)
end

function RepublicHeroes:New_Jedi_Order()
	--Logger:trace("entering RepublicHeroes:New_Jedi_Order")
	if not self.NJOinit then
		council_data.total_slots = council_data.total_slots + 1
		council_data.free_hero_slots = council_data.free_hero_slots + 1
		Handle_Hero_Add("Corran", council_data)
		Handle_Hero_Add("Mara", council_data)
		Handle_Hero_Add("Cilghal", council_data)
		Get_Active_Heroes(false, council_data)
	end
	self.NJOinit = true
end

function RepublicHeroes:Bothan_Heroes()
	--Logger:trace("entering RepublicHeroes:Bothan_Heroes")
	Krefey_Check()
end

function RepublicHeroes:Mediator_Heroes()
	--Logger:trace("entering RepublicHeroes:Mediator_Heroes")
	Handle_Hero_Add("Ackdool", admiral_data)
end

function RepublicHeroes:Canon_Heroes()
	--Logger:trace("entering RepublicHeroes:Canon_Heroes")
	Handle_Hero_Add("Raddus", admiral_data)
	Handle_Hero_Add("Hera", admiral_data)
end

function Enable_CoS_Dummies()
	--Logger:trace("entering RepublicHeroes:Enable_Fighter_Sets")
	for _, setter in pairs(CoS_dummies) do
		tech_unit = Find_Object_Type(setter)
		admiral_data.active_player.Unlock_Tech(tech_unit)
	end
end

function Disable_CoS_Dummies()
	--Logger:trace("entering RepublicHeroes:Disable_Fighter_Sets")
	for _, setter in pairs(CoS_dummies) do
		tech_unit = Find_Object_Type(setter)
		admiral_data.active_player.Lock_Tech(tech_unit)
	end
end

function Enable_Fighter_Sets()
	--Logger:trace("entering RepublicHeroes:Enable_Fighter_Sets")
	for _, setter in pairs(fighter_assigns) do
		tech_unit = Find_Object_Type(setter)
		admiral_data.active_player.Unlock_Tech(tech_unit)
	end
end

function Disable_Fighter_Sets()
	--Logger:trace("entering RepublicHeroes:Disable_Fighter_Sets")
	for _, setter in pairs(fighter_assigns) do
		tech_unit = Find_Object_Type(setter)
		admiral_data.active_player.Lock_Tech(tech_unit)
	end
end

function Add_CoS(set, nounlock)
--Logger:trace("entering RepublicHeroes:Add_CoS")
	--Wrapper for avoiding duplicates in list
	for i, setter in pairs(CoS_dummies) do
		if setter == set then
			return
		end
	end
	table.insert(CoS_dummies,set)
	if CoS_dummies_enabled and nounlock == nil then
		Enable_CoS_Dummies()
	end
end

function Remove_CoS(set, nolock)
--Logger:trace("entering RepublicHeroes:Remove_CoS")
	for i, setter in pairs(CoS_dummies) do
		if setter == set then
			table.remove(CoS_dummies,i)
			local assign_unit = Find_Object_Type(setter)
			admiral_data.active_player.Lock_Tech(assign_unit)
		end
	end
	if CoS_dummies_enabled and nolock == nil then
		Enable_CoS_Dummies()
	end
end

function Add_Fighter_Set(set, nounlock)
--Logger:trace("entering RepublicHeroes:Add_Fighter_Sets")
	--Wrapper for avoiding duplicates in list
	for i, setter in pairs(fighter_assigns) do
		if setter == set then
			return
		end
	end
	table.insert(fighter_assigns,set)
	if fighter_assign_enabled and nounlock == nil then
		Enable_Fighter_Sets()
	end
end

function Remove_Fighter_Set(set, nolock)
--Logger:trace("entering RepublicHeroes:Disable_Fighter_Set")
	for i, setter in pairs(fighter_assigns) do
		if setter == set then
			table.remove(fighter_assigns,i)
			local assign_unit = Find_Object_Type(setter)
			admiral_data.active_player.Lock_Tech(assign_unit)
		end
	end
	if fighter_assign_enabled and nolock == nil then
		Enable_Fighter_Sets()
	end
end

function RepublicHeroes:Add_Filter_Options(sets, filter)
--Logger:trace("entering RepublicHeroes:Add_Filter_Options")
	if filter == 1 then
		for _, set in pairs(sets) do
			Add_CoS(set, true)
		end
		if CoS_dummies_enabled then
			Enable_CoS_Dummies()
		end
	end
	if filter == 2 then
		for _, set in pairs(sets) do
			Add_Fighter_Set(set, true)
		end
		if fighter_assign_enabled then
			Enable_Fighter_Sets()
		end
	end
end

function RepublicHeroes:Remove_Filter_Options(sets, filter)
--Logger:trace("entering RepublicHeroes:Remove_Filter_Options")
	if filter == 1 then
		for _, set in pairs(sets) do
			Remove_CoS(set, true)
		end
		if CoS_dummies_enabled then
			Enable_CoS_Dummies()
		end
	end
	if filter == 2 then
		for _, set in pairs(sets) do
			Remove_Fighter_Set(set, true)
		end
		if fighter_assign_enabled then
			Enable_Fighter_Sets()
		end
	end
end