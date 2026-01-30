require("deepcore/std/class")
require("deepcore/std/Observable")

CONSTANTS = ModContentLoader.get("GameConstants")

---@class GalacticEventsNewsSource : Observable
GalacticEventsNewsSource = class(Observable)

---@param planet_owner_changed_event PlanetOwnerChangedEvent
function GalacticEventsNewsSource:new(
    planet_owner_changed_event,
    galactic_hero_killed_event,
    galactic_ssd_killed_event,
    incoming_fleet_event,
    blockade_attrition_unit_killed,
    influence_unrest_growing,
    influence_revolt_occured,
    structure_swap_warning,
    structure_swapped,
    infrastructure_entered,
    victory_handler_shipyards_available)
    planet_owner_changed_event:attach_listener(self.on_planet_owner_changed, self)
    galactic_hero_killed_event:attach_listener(self.on_galactic_hero_killed, self)
    galactic_ssd_killed_event:attach_listener(self.on_galactic_ssd_killed, self)
    incoming_fleet_event:attach_listener(self.on_incoming_fleet, self)
    blockade_attrition_unit_killed:attach_listener(self.on_blockade_unit_killed, self)
    influence_unrest_growing:attach_listener(self.on_unrest_growing, self)
    influence_revolt_occured:attach_listener(self.on_revolt_occured, self)
    structure_swap_warning:attach_listener(self.on_structure_swap_warning, self)
	structure_swapped:attach_listener(self.on_structure_swapped, self)
    infrastructure_entered:attach_listener(self.on_infrastructure_entered, self)
    victory_handler_shipyards_available:attach_listener(self.on_shipyard_victory_available, self)
end

---@param planet Planet
function GalacticEventsNewsSource:on_planet_owner_changed(planet)
    --Logger:trace("entering GalacticEventsNewsSource:on_planet_owner_changed")
    local owner = planet:get_game_object().Get_Owner()
    local conquest_text = CONSTANTS.ALL_FACTION_NAMES[owner.Get_Faction_Name()] .. " has conquered " .. planet:get_readable_name() .. "!"
    local color = CONSTANTS.FACTION_COLORS[owner.Get_Faction_Name()]
    self:notify {
        headline = conquest_text,
        var = nil,
        color = color
    }
end

---@param hero_name string
function GalacticEventsNewsSource:on_galactic_hero_killed(hero_name, owner)
    --Logger:trace("entering GalacticEventsNewsSource:on_galactic_hero_killed")
    self:notify {
        headline = "TEXT_NEWS_HERO_KILLED_GALACTIC",
        var = Find_Object_Type(hero_name),
        color = {r = 255, g = 0, b = 0}
    }
end

---@param hero_name string
function GalacticEventsNewsSource:on_galactic_ssd_killed(ssd_name, owner)
    --Logger:trace("entering GalacticEventsNewsSource:on_galactic_ssd_killed")
    local ssd_name = Find_Object_Type(ssd_name).Get_Name()
    local ssd_death_text = Find_Player(owner).Get_Name() .. "'s %s has been destroyed!"

    self:notify {
        headline = ssd_death_text,
        var = ssd_name,
        color = {r = 255, g = 0, b = 0}
    }
end

function GalacticEventsNewsSource:on_incoming_fleet(planet)
    if not planet:get_owner().Is_Human() then
        return
    end
    --Logger:trace("entering GalacticEventsNewsSource:on_incoming_fleet")
    self:notify {
        headline = "TEXT_NEWS_ENEMY_FLEET_INCOMING",
        duration = 20,
        var = planet:get_game_object(),
        color = {r = 255, g = 0, b = 0}
    }
end

---@param planet Planet
---@param unit_owner_name string
function GalacticEventsNewsSource:on_blockade_unit_killed(planet, unit, unit_owner_name)
    if not Find_Player(unit_owner_name).Is_Human() then
        return
    end
    --Logger:trace("entering GalacticEventsNewsSource:on_blockade_unit_killed")
    self:notify {
        headline = "%s has been destroyed by a ground-to-space cannon over " .. tostring(planet:get_readable_name()),
        duration = 20,
        var = unit.Get_Type(),
        color = {r = 255, g = 0, b = 0}
    }
end

function GalacticEventsNewsSource:on_unrest_growing(planet, unrest)
    --Logger:trace("entering GalacticEventsNewsSource:on_unrest_growing")
    self:notify {
        headline = "Unrest has grown on " .. tostring(planet:get_readable_name()) .." to "..tostring(unrest),
        duration = 20,
        var = planet:get_game_object(),
        color = {r = 255, g = 0, b = 0}
    }
end


function GalacticEventsNewsSource:on_revolt_occured(planet)
    --Logger:trace("entering GalacticEventsNewsSource:on_revolt_occured")
    self:notify {
        headline = "A revolt has occured on ".. tostring(planet:get_readable_name()),
        duration = 20,
        var = planet:get_game_object(),
        color = {r = 255, g = 0, b = 0}
    }
end

function GalacticEventsNewsSource:on_structure_swap_warning(planet, new_structure, structure_type)
    --Logger:trace("entering GalacticEventsNewsSource:on_structure_swap_warning")
    self:notify {
        headline = "Queued "..structure_type.." category station will replace an existing %s on ".. tostring(planet:get_readable_name()),
        duration = 20,
        var = Find_Object_Type(new_structure),
        color = {r = 255, g = 255, b = 255}
    }
end

function GalacticEventsNewsSource:on_structure_swapped(planet, new_structure, structure_type)
    --Logger:trace("entering GalacticEventsNewsSource:on_structure_swapped")
    self:notify {
        headline = "A new %s has replaced an existing structure of the "..structure_type.." category on ".. tostring(planet:get_readable_name()),
        duration = 20,
        var = Find_Object_Type(new_structure),
        color = {r = 255, g = 255, b = 255}
    }
end

function GalacticEventsNewsSource:on_infrastructure_entered(status)
    --Logger:trace("entering GalacticEventsNewsSource:on_deficit_entered")
    local headline = "A lack of infrastructure has increased prices and slowed production for your faction."
    local color = {r = 255, g = 0, b = 0}
    if status == "surplus" then
        headline = "A surplus of infrastructure has decreased prices and sped up production for your faction."
        color = {r = 0, g = 255, b = 0}
    end
    self:notify {
        headline = headline,
        duration = 20,
        var = nil,
        color = color
    }
end

---@param player_name string
function GalacticEventsNewsSource:on_shipyard_victory_available(player_name)
    --Logger:trace("entering GalacticEventsNewsSource:on_shipyard_victory_available")
    local owner_name = player_name
    local color = CONSTANTS.FACTION_COLORS[owner_name]
    self:notify {
        headline = "Your faction has conquered all major shipyards. You may declare victory from the policial options menu.",
        var = nil,
        color = color
    }
end