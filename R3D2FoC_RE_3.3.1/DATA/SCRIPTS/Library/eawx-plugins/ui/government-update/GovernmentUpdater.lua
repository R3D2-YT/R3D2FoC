require("deepcore/std/class")
---@class GovernmentUpdater
GovernmentUpdater = class()

function GovernmentUpdater:new()

    local plot_name = StoryUtil.PlayerAgnosticPlots.Galactic
    local plot = Get_Story_Plot(plot_name)

    local click_event = plot.Get_Event("Government_Display_Clicked")
    click_event.Set_Reward_Parameter(1, Find_Player("local").Get_Faction_Name())
end

function GovernmentUpdater:update()
    DebugMessage("GovernmentUpdater:update -- update started")

    crossplot:publish("UPDATE_GOVERNMENT", "empty")

end

return GovernmentUpdater
