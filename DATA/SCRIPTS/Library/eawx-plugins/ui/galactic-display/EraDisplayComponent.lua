require("deepcore/std/class")
require("eawx-util/StoryUtil")

EraDisplayComponent = class()

function EraDisplayComponent:new(selectedPlanetChangedEvent, year_handler)
    self.current_text_id = ""
    self.__needs_update = true
    self.era_header = "Era"
    self.year_handler = year_handler
    selectedPlanetChangedEvent:attach_listener(self.generic_update, self)

end

function EraDisplayComponent:needs_update()
    return self.__needs_update
end

function EraDisplayComponent:render()
    self.__needs_update = false
    StoryUtil.RemoveScreenText(self.era_header)
    StoryUtil.RemoveScreenText(self.current_text_id)

    local enemy = Find_Player("Empire")
    if Find_Player("Empire").Is_Human() then
        enemy = Find_Player("Rebel")
    end

    local difficulty_text = "Captain"
    if EvaluatePerception("DisplayDifficulty", enemy) == 1 then
        difficulty_text = "Recruit"
    elseif EvaluatePerception("DisplayDifficulty", enemy) == 3 then
        difficulty_text = "Admiral"
    end

    local cruel = ""
    if GlobalValue.Get("CRUEL_ON") == 1 then
        cruel = "Cruel "
    end


    self.current_text_id = self.year_handler.current_year_text .. " (Era " .. tostring(GlobalValue.Get("CURRENT_ERA")) .. ") - Difficulty: " .. cruel .. difficulty_text 
    
    StoryUtil.ShowScreenText(self.era_header)
    StoryUtil.ShowScreenText(self.current_text_id, -1)
end

function EraDisplayComponent:generic_update()
    self.__needs_update = true
end