require("deepcore/std/class")
require("deepcore/std/Observable")

---@class GovernmentNewsSource : Observable
GovernmentNewsSource = class(Observable)

---@param government_manager GovernmentManager
function GovernmentNewsSource:new(government_manager)
    government_manager.NRGOV.Events.ElectionHeld:attach_listener(self.on_election_held, self)
    government_manager.EMPIREGOV.Events.FactionIntegrated:attach_listener(self.on_faction_join, self)
    government_manager.SHIPMARKET.Events.ShipsAdded:attach_listener(self.on_ships_added, self)
    government_manager.FAVOUR.Events.SupportReached:attach_listener(self.on_support_reached, self)
end

function GovernmentNewsSource:on_election_held(election_result)
    --Logger:trace("entering GovernmentNewsSource:on_election_held")
    DebugMessage("GovernmentNewsSource Started")
    self:notify {
        headline = "TEXT_NEWS_NR_ELECTION_RESULT",
        var = election_result.winner,
        color = {r = 239, g = 139, b = 9}
    }
    DebugMessage("GovernmentNewsSource Finished")
end

function GovernmentNewsSource:on_faction_join(joining_info)
    --Logger:trace("entering GovernmentNewsSource:on_faction_join")
    DebugMessage("GovernmentNewsSource Started")
    self:notify {
        headline = "TEXT_NEWS_EMPIRE_FACTION_JOINED",
        var = joining_info.joined,
        color = {r = 255, g = 255, b = 255}
    }
    DebugMessage("GovernmentNewsSource Finished")
end

function GovernmentNewsSource:on_ships_added(ship_info)
    --Logger:trace("entering GovernmentNewsSource:on_ships_added")
    DebugMessage("GovernmentNewsSource Started")
    self:notify {
        headline = "A(n) "..ship_info.added.." has been added to the ".. ship_info.market_name,
        var = nil,
        color = ship_info.news_colour
    }
    DebugMessage("GovernmentNewsSource Finished")
end


function GovernmentNewsSource:on_support_reached(support_info)
    --Logger:trace("entering GovernmentNewsSource:on_support_reached")
    DebugMessage("GovernmentNewsSource Started")
    self:notify {
        headline = support_info.added,
        var = nil,
        color = {r = 255, g = 255, b = 255}
    }
    DebugMessage("GovernmentNewsSource Finished")
end

