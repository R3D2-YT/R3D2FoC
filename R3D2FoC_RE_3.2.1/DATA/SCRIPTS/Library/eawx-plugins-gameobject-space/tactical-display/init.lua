require("deepcore/std/plugintargets")

return {
    type = "plugin",
    target = PluginTargets.always(),
    init = function(self, ctx)
        TacticalDisplay = require("eawx-plugins-gameobject-space/tactical-display/TacticalDisplay")
        plot = Get_Story_Plot("Conquests\\Tactical_Raids.XML")
        return TacticalDisplay(plot)
    end
}
