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
--*       File Created:      Sunday, 23rd February 2020 08:24                                      *
--*       Author:            [TR] Pox                                                              *
--*       Last Modified:     Sunday, 23rd February 2020 09:12                                      *
--*       Modified By:       [TR] Pox                                                              *
--*       Copyright:         Thrawns Revenge Development Team                                      *
--*       License:           This code may not be used without the author's explicit permission    *
--**************************************************************************************************

require("deepcore/std/plugintargets")
require("eawx-plugins/orbital-structure-handler/OrbitalStructureHandler")

return {
    type = "plugin",
    target = PluginTargets.never(),
    init = function(self, ctx)
        return OrbitalStructureHandler(ctx.galactic_conquest)
    end
}
