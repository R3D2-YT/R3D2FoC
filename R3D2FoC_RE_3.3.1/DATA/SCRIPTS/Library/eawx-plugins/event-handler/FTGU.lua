require("deepcore/std/class")
require("eawx-events/GenericResearch")
require("eawx-events/GenericSwap")
require("eawx-events/GenericConquer")


---@class EventManager
EventManager = class()

function EventManager:new(galactic_conquest, human_player, planets)
    self.galactic_conquest = galactic_conquest
    self.human_player = human_player
    self.planets = planets
    self.starting_era = nil




end

function EventManager:update()
    


end

return EventManager
