require("PGStoryMode")
require("PGSpawnUnits")

return {
    on_enter = function(self, state_context)

        GlobalValue.Set("CURRENT_ERA", 2)

    end,
    on_update = function(self, state_context)
    end,
    on_exit = function(self, state_context)
    end
}