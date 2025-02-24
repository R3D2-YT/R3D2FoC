require("deepcore/std/class")
require("eawx-util/Math")

---@class EawXTimedTransitionPolicy : EawXTransitionPolicy
EawXMTTHTransitionPolicy = class()

---@param mean_time_to_happen number
---@param transition_function fun(state_context: table<string, any>)
function EawXMTTHTransitionPolicy:new(mean_time_to_happen, transition_function)
    ---@private
    self.mean_time_to_happen = mean_time_to_happen or 0

    ---@public
    self.transition_function = transition_function or function()
        end
end

---@param state_context table<string, any>
function EawXMTTHTransitionPolicy:should_transition(state_context)
	local current_week = GetCurrentTime() / 40
	local random_chance =  GameRandom.Free_Random(0, 100) / 100
    return random_chance > MeanTimeToHappenChance(current_week, self.mean_time_to_happen)
end

---@param state_context table<string, any>
function EawXMTTHTransitionPolicy:on_transition(state_context)
    self.transition_function(state_context)
end
