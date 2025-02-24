require("deepcore/std/class")
require("PGSpawnUnits")
StoryUtil = require("eawx-util/StoryUtil")

---@class VentureUpgrade
VentureUpgrade = class()

function VentureUpgrade:new(gc)
    self.is_complete = false
    self.is_active = false
    self.plot = Get_Story_Plot("Conquests\\Events\\EventLogRepository.XML")

    self.ForPlayer = Find_Player("Rebel")
    self.HumanPlayer = Find_Player("local")

    crossplot:subscribe("TERRIK_UPGRADE_START", self.activate, self)
    
    self.production_finished_event = gc.Events.GalacticProductionFinished
    self.production_finished_event:attach_listener(self.on_production_finished, self)
    
end

function VentureUpgrade:activate()
    --Logger:trace("entering VentureUpgrade:activate")
    if (self.is_complete == false) and (self.is_active == false) then
        self.is_active = true

		if self.ForPlayer == self.HumanPlayer then
			StoryUtil.Multimedia("TEXT_CONQUEST_TERRIK_VENTURE", 15, nil, "Karrde_Loop", 0)
			local plot = self.plot
			Story_Event("ERRANT_VENTURE_STARTED")      
		end

		self.ForPlayer.Unlock_Tech(Find_Object_Type("TerrikUpgrade"))
    end
end

function VentureUpgrade:on_production_finished(planet, object_type_name)
    --Logger:trace("entering VentureUpgrade:on_production_finished")
    if object_type_name == "TERRIKUPGRADE" then
        local plot = self.plot
        Story_Event("ERRANT_VENTURE_COMPLETED")
        self.production_finished_event:detach_listener(self.on_production_finished)
	--Lock the other options for leader SSDs when one is taken
	elseif object_type_name == "KAINEUPGRADE" then
		local assign_unit = Find_Object_Type("PELLAEONUPGRADE")
		local PA = Find_Player("Pentastar")
		PA.Lock_Tech(assign_unit)
	elseif object_type_name == "PELLAEONUPGRADE" then --Technically we only need to do this if the builder is PA. But if they're not, PA is dead and it doesn't hurt
		local assign_unit = Find_Object_Type("KAINEUPGRADE")
		local PA = Find_Player("Pentastar")
		PA.Lock_Tech(assign_unit)
	elseif object_type_name == "DAALAUPGRADE" then
		local assign_unit = Find_Object_Type("DELVARDUS_THALASSAUPGRADE")
		local EA = Find_Player("Eriadu_Authority")
		EA.Lock_Tech(assign_unit)
		assign_unit = Find_Object_Type("BRILLIANTUPGRADE")
		EA.Lock_Tech(assign_unit)
	elseif object_type_name == "DELVARDUS_THALASSAUPGRADE" or object_type_name == "BRILLIANTUPGRADE" then
		local assign_unit = Find_Object_Type("DAALAUPGRADE")
		local EA = Find_Player("Eriadu_Authority")
		EA.Lock_Tech(assign_unit)
    else
        return
    end
end

return VentureUpgrade
