require("eawx-statemachine/dsl/StateTransitionBuilder")
require("eawx-statemachine/dsl/TransitionEffectBuilderFactory")
require("eawx-statemachine/dsl/TransitionPolicyFactory")

return function(plugin_ctx)
    return {
        transition = StateTransitionBuilder,
        conditions = require("eawx-statemachine/dsl/conditions"),
        effect = TransitionEffectBuilderFactory(plugin_ctx),
        policy = TransitionPolicyFactory(plugin_ctx)
    }
end