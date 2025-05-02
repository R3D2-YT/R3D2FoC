require("deepcore/std/plugintargets")

return {
    type = "plugin",
    target = PluginTargets.always(),
    dependencies = {},
    init = function(self, ctx)
        VictoryPoint = require("eawx-plugins-gameobject-land/victory-point/VictoryPoint")
        return VictoryPoint()
    end
}
