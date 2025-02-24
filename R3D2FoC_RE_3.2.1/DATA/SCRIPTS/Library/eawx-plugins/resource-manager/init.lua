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
--*       File Created:      Sunday, 23rd February 2020 05:00                                      *
--*       Author:            [TR] Pox                                                              *
--*       Last Modified:     Wednesday, 8th July 2020 12:02                                        *
--*       Modified By:       [TR] Pox                                                              *
--*       Copyright:         Thrawns Revenge Development Team                                      *
--*       License:           This code may not be used without the author's explicit permission    *
--**************************************************************************************************

require("deepcore/std/plugintargets")
require("eawx-plugins/resource-manager/LockBasedResourceManager")

return {
    type = "plugin",
    target = PluginTargets.never(),
    dependencies = {"key-dummy-lifecycle-handler", "selected-planet-listener"},
    init = function(self, ctx, ai_dummy_handler, selected_planet_changed_event)
        return LockBasedResourceManager(ctx.galactic_conquest, ai_dummy_handler, selected_planet_changed_event)
    end
}
