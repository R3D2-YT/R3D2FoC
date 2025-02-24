require("deepcore/std/class")
require("eawx-util/StoryUtil")

ShipCrewDisplayComponent = class()

---@param resource_manager LockBasedResourceManager
function ShipCrewDisplayComponent:new(resource_manager, abstract_resources)
    self.ship_crews = resource_manager.ship_crews
	self.income = resource_manager.income
    self.stockpiled_text_id = ""
    self.upkeep_text_id = ""
    self.infrastructure_text_id = ""
    self.__needs_update = true

    self.UpkeepCost = abstract_resources.UpkeepCost
    self.InfrastructureScore = abstract_resources.InfrastructureScore
    self.NetIncome = abstract_resources.NetIncome
    self.SmugglingIncome = tonumber(Dirty_Floor(abstract_resources.SmugglingIncome))
    self.HumanIsHutts = Find_Player("Hutt_Cartels").Is_Human()

    resource_manager.resources_changed_event:attach_listener(self.on_ship_crews_changed, self)
    abstract_resources.abstract_changed_event:attach_listener(self.on_abstract_changed, self)
end

function ShipCrewDisplayComponent:needs_update()
    return self.__needs_update
end

function ShipCrewDisplayComponent:render()
    self.__needs_update = false
    StoryUtil.RemoveScreenText(self.infrastructure_text_id)
    StoryUtil.RemoveScreenText(self.stockpiled_text_id)
    StoryUtil.RemoveScreenText(self.upkeep_text_id)
	
    self.infrastructure_text_id = "INFRASTRUCTURE SCORE: " .. tostring(self.InfrastructureScore)
    self.stockpiled_text_id = "SHIP CREWS: " .. tostring(self.ship_crews) .. " | PER CYCLE: +" .. tostring(self.income)
    if self.HumanIsHutts == true then
        self.upkeep_text_id = "SHIP UPKEEP: $" .. tostring(self.UpkeepCost) .. " | SMUGGLING: $" .. tostring(self.SmugglingIncome) .. " | NET INCOME: $" .. tostring(self.NetIncome)
    else
        self.upkeep_text_id = "SHIP UPKEEP: $" .. tostring(self.UpkeepCost) .. " | NET INCOME: $" .. tostring(self.NetIncome)
    end
    StoryUtil.ShowScreenText("===========  INFRASTRUCTURE & RESOURCES   ===========", -1, nil, {r = 160, g = 160, b = 164}, false)
    StoryUtil.ShowScreenText(self.infrastructure_text_id, -1)
    StoryUtil.ShowScreenText(self.stockpiled_text_id, -1)
    StoryUtil.ShowScreenText(self.upkeep_text_id, -1)
end

function ShipCrewDisplayComponent:on_ship_crews_changed(ship_crews, income)
    GlobalValue.Set("CURRENT_SHIP_CREWS", ship_crews)

    self.ship_crews = ship_crews
    self.income = income

    self.__needs_update = true
end

function ShipCrewDisplayComponent:on_abstract_changed(upkeep_cost, infrastructure_cost, net_income, smuggling_income)
    self.UpkeepCost = upkeep_cost
    self.SmugglingIncome = tonumber(Dirty_Floor(smuggling_income))
    self.InfrastructureScore = infrastructure_cost
    self.NetIncome = net_income
    
    self.__needs_update = true
end