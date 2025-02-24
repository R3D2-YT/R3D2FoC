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
--*   @Author:              Kiwi ❤
--*   @Date:                2018-03-10T11:56:43+01:00
--*   @Project:             Imperial Civil War
--*   @Filename:            TacticalDisplay.lua
--*   @Last modified by:    Kiwi ❤
--*   @Last modified time:  2018-03-10T19:29:08+01:00
--*   @License:             This source code may only be used with explicit permission from the developers
--*   @Copyright:           © TR: Imperial Civil War Development Team
--******************************************************************************
require("deepcore/std/class")
require("eawx-util/StoryUtil")

TacticalDisplay = class()

function TacticalDisplay:new(plot)
    if not Object.Get_Owner().Is_Human() then return end
    self.HumanPlayer = Find_Player("local")
    self.GameConstants = ModContentLoader.get("GameConstants")
    
    local owner_name = Object.Get_Owner().Get_Faction_Name()
    self.color = self.GameConstants.FACTION_COLORS[owner_name]

    local event = plot.Get_Event("Select_" .. Object.Get_Type().Get_Name())
    if event then
        event.Set_Reward_Parameter(1, Find_Player("local").Get_Faction_Name())
    end
    self.objectName = Object.Get_Type().Get_Name()

    self.text_Table = {
        "TEXT_SELECTED_UNIT",
    }
end

function TacticalDisplay:update()
    if not Object.Get_Owner().Is_Human() then return end

    if self:is_selected() then
        if self.unit_shield ~= self:get_shield() or self.unit_health ~= self:get_health() then
            self:render(false)
        end
    end

    if Check_Story_Flag(Find_Player("local"), "SELECTED_" .. Object.Get_Type().Get_Name(), nil, true) then
        self:render(true)
    end
end

function TacticalDisplay:is_selected()
    return (GlobalValue.Get("SELECTED_TYPE") == tostring(Object))
end

function TacticalDisplay:get_health()
    local unit_health = Object.Get_Hull()
    if unit_health >= 0.01 then
        unit_health = unit_health * 100
        unit_health = Dirty_Floor(unit_health)
        return tonumber(unit_health)
     end
    return 0
end


function TacticalDisplay:get_shield()
    local unit_shield = Object.Get_Shield()
    if unit_shield >= 0.01 then
        unit_shield = unit_shield * 100
        unit_shield = Dirty_Floor(unit_shield)
        return tonumber(unit_shield)
    end
    return 0
end

function TacticalDisplay:render(teletype)
    self:clear()
    StoryUtil.ShowScreenText("TEXT_DISPLAY_SPACER_3", -1)
    self.current_text = {"TEXT_SELECTED_UNIT"}
    StoryUtil.ShowScreenText("TEXT_SELECTED_UNIT", -1, Object, self.color, teletype)

    local unit_health = self:get_health()    
    if unit_health == 0 then
        self:clear()
        return
    end

    self.unit_health = unit_health
    health_id = "Hull: " .. tostring(unit_health) .. "%"
    table.insert(self.current_text, health_id)
    StoryUtil.ShowScreenText(health_id, -1, unit_health, self.color, teletype)


    local unit_shield = self:get_shield()
    if unit_shield > 0 then
        self.unit_shield = unit_shield
        shield_id = "Shield: " .. tostring(unit_shield) .. "%"
        table.insert(self.current_text, shield_id)
        StoryUtil.ShowScreenText(shield_id, -1, unit_shield, self.color, teletype)
    end

    GlobalValue.Set("CURRENT_TEXT", {health_id or nil, shield_id or nil})
    GlobalValue.Set("SELECTED_TYPE", tostring(Object))
end

function TacticalDisplay:clear()
    for i, text in pairs(self.text_Table) do
        StoryUtil.RemoveScreenText(text)
    end
    if GlobalValue.Get("CURRENT_TEXT") ~= nil then
        for i, text in pairs(GlobalValue.Get("CURRENT_TEXT")) do
            StoryUtil.RemoveScreenText(text)
        end
    end
end

return TacticalDisplay