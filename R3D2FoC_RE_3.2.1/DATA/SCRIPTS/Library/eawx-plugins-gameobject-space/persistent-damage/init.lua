require("deepcore/std/plugintargets")

return {
    type = "plugin",
    target = PluginTargets.always(),
    init = function(self, ctx)
        DamageTracker = require("eawx-plugins-gameobject-space/persistent-damage/DamageTracker")
        return DamageTracker()
    end
}
