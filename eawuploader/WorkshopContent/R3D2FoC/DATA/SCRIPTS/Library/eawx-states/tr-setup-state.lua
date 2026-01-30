require("deepcore/crossplot/crossplot")

return {
    on_enter = function(self, state_context)
        crossplot:publish("INITIALIZE_AI", "empty")
    end,
    on_update = function(self, state_context)
    end,
    on_exit = function(self, state_context)
        local placeholder_table = Find_All_Objects_Of_Type("Placement_Dummy")
        for i, unit in pairs(placeholder_table) do
            unit.Despawn()
        end
    end
}