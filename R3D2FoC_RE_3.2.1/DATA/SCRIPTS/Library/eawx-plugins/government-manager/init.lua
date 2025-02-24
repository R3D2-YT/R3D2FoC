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
--*       File:              init.lua                                                              *
--*       File Created:      Monday, 24th February 2020 12:12                                      *
--*       Author:            [TR] Pox                                                              *
--*       Last Modified:     Monday, 16th March 2020 10:39                                         *
--*       Modified By:       [TR] Pox                                                              *
--*       Copyright:         Thrawns Revenge Development Team                                      *
--*       License:           This code may not be used without the author's explicit permission    *
--**************************************************************************************************

require("deepcore/std/plugintargets")
require("eawx-plugins/government-manager/GovernmentManager")
require("eawx-plugins/government-manager/GovernmentNewsSource")

return {
    type = "plugin",
    target = PluginTargets.weekly(),
    dependencies = {"key-dummy-lifecycle-handler", "ui/galactic-display"},
    ---@param ctx table<string, any>
    ---@param dummy_lifecycle_handler KeyDummyLifeCycleHandler
    ---@param galactic_display DisplayComponentContainer
    init = function(self, ctx, dummy_lifecycle_handler, galactic_display)
        local government_manager = GovernmentManager(ctx.galactic_conquest, ctx.legitimacy_absorb, ctx.dark_empire, ctx.id, dummy_lifecycle_handler)
        local news_feed = galactic_display:get_component("news_feed")
        news_feed:add_news_source(GovernmentNewsSource(government_manager))

        return government_manager
    end
}

