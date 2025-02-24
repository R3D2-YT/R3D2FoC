require("deepcore/std/class")
require("deepcore/statemachine/dsl/TransitionPolicyFactory")
require("eawx-statemachine/transition-policies/EawXGlobalEraCheckTransitionPolicy")
require("eawx-statemachine/transition-policies/EawXPlanetLostTransitionPolicy")
require("eawx-statemachine/transition-policies/EawXMTTHTransitionPolicy")

---@class EawXTransitionPolicyFactory
EawXTransitionPolicyFactory = class(TransitionPolicyFactory)

function EawXTransitionPolicyFactory:new(plugin_ctx)
    self.ctx = plugin_ctx
end

---@param current_tech number
function EawXTransitionPolicyFactory:global_era(current_tech)
    return EawXGlobalEraCheckTransitionPolicy(current_tech)
end

---@param planet_name string
function EawXTransitionPolicyFactory:planet_lost(planet_name)
    ---@type GalacticConquest
    local gc = self.ctx.galactic_conquest
    return EawXPlanetLostTransitionPolicy(gc.Events.PlanetOwnerChanged, planet_name)
end

---@param time number
function EawXTransitionPolicyFactory:mtth(time)
    return EawXMTTHTransitionPolicy(time)
end


return EawXTransitionPolicyFactory
