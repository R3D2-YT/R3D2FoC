require("deepcore/std/class")
require("eawx-events/GenericResearch")
require("eawx-events/GenericSwap")
require("eawx-events/TechHelper")

---@class TechManager
TechManager = class()

function TechManager:new(galactic_conquest, human_player, planets)
    self.galactic_conquest = galactic_conquest
    self.human_player = human_player
    self.planets = planets
	
	self.BACResearch = GenericResearch(self.galactic_conquest,
        "BAC_RESEARCH",
        "Research_BAC", {"Rebel"},
        {"BAC", "Bothawui_HQ"},
        nil, nil, nil,
        {"BAC_HEROES"})
	
    self.RepublicResearch = GenericResearch(self.galactic_conquest,
        "REPUBLIC_RESEARCH",
        "Dummy_RepublicSD", {"Rebel"},
        {"Republic_SD", "SnunbUpgrade"})

    self.NCMPResearch = GenericResearch(self.galactic_conquest,
        "NCMP_RESEARCH",
        "Dummy_NewClass", {"Rebel"}, 
        {"Sacheen", "Hajen", "Corona", "Belarus", "REC_HQ"},
        {"Nebulon_B_Frigate", "Nebulon_B_Tender", "Sienar_HQ"})

    self.NCMP2Research = GenericResearch(self.galactic_conquest,
        "NCMP2_RESEARCH",
        "Dummy_NewClass_PhaseTwo", {"Rebel"},
        {"Agave_Corvette", "Warrior_Gunship", "Majestic", "Defender_Carrier", "Nebula", "SovvDaunt2VP", "Endurance"},
        {"Corellian_Corvette", "Corellian_Gunboat", "Quasar", "Liberator_Cruiser"},
        nil, nil,
        {"NCMP2_HEROES"})
	
	 self.AAC3Research = GenericResearch(self.galactic_conquest,
        "AAC3_RESEARCH",
        "Dummy_AAC3", {"Rebel"}, 
        {"Rebel_AAC_3_Company"},
        {"Rebel_AAC_2_Company"})
		
	self.ViscountResearch = GenericResearch(self.galactic_conquest,
        "VISCOUNT_RESEARCH",
        "Dummy_Viscount", {"Rebel"}, 
        {"Viscount"},
        nil,
        {"Mini_Viscount"}, "Mon_Calamari")

    self.MediatorResearch = GenericResearch(self.galactic_conquest,
        "MEDIATOR_RESEARCH",
        "Dummy_Mediator", {"Rebel"}, 
        {"Mediator", "IblisUpgrade3", "IblisUpgrade4"},
        {"Home_One_Type", "Bulwark_III"},
        nil, nil,
        {"BLUE_DIVER_RESEARCH","MEDIATOR_HEROES"})

    self.BlueDiverResearch = GenericResearch(self.galactic_conquest,
        "BLUE_DIVER_RESEARCH",
        "Dummy_BlueDiver", {"Rebel"},
        {"BlueDiver"})

    self.MonMothmaResearch = GenericResearch(self.galactic_conquest,
        "MON_MOTHMA_RESEARCH",
        "Research_MMSD", {"Rebel"}, 
        {"Mothma_Star_Destroyer", "IblisUpgrade2"})
		
	self.ThrawnCloneResearch = GenericResearch(self.galactic_conquest,
        "THRAWNCLONE_RESEARCH",
        "Dummy_Find_Thrawn_Clone", {"EmpireoftheHand"}, 
        nil,
        nil,
        {"Thrawn_Clone_Eviscerator"}, "Nirauan")

	self.CoronaResearch = GenericResearch(self.galactic_conquest,
        "CORONA_RESEARCH",
        "Dummy_Research_Corona", {"Zsinj_Empire"}, 
        {"Corona"},
        {"Nebulon_B_Zsinj"})
		
	self.GorathResearch = GenericResearch(self.galactic_conquest,
        "GORATH_RESEARCH",
        "Dummy_Research_Gorath", {"Greater_Maldrood"}, 
        {"Strike_Cruiser_Gorath"},
        {"Strike_Cruiser"})
		
	self.TempestResearch = GenericResearch(self.galactic_conquest,
		"TEMPEST_RESEARCH",
		"Dummy_Research_Tempest", {"Hutt_Cartels"},
		{"Tempest_Cruiser"},
		{}, 
		{"Mika_Tempest"}, "Nal_Hutta")

	self.TechHelper = TechHelper(self.galactic_conquest)

end

function TechManager:update()
    
end

return TechManager
