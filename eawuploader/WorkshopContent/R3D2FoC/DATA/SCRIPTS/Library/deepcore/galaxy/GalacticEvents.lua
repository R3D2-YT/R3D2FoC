--*****************************************************************************
--*    _______ __
--*   |_     _|  |--.----.---.-.--.--.--.-----.-----.
--*     |   | |     |   _|  _  |  |  |  |     |__ --|
--*     |___| |__|__|__| |___._|________|__|__|_____|
--*    ______
--*   |   __ \.-----.--.--.-----.-----.-----.-----.
--*   |      <|  -__|  |  |  -__|     |  _  |  -__|
--*   |___|__||_____|\___/|_____|__|__|___  |_____|
--*                                   |_____|
--*
--*   @Author:              [EaWX]Pox
--*   @Date:                2020-12-23
--*   @Project:             Empire at War Expanded
--*   @Filename:            GalacticEvents.lua
--*   @License:             MIT
--*****************************************************************************

require("deepcore/std/class")
require("deepcore/std/Observable")
require("deepcore/crossplot/crossplot")

---@class PlanetOwnerChangedEvent : Observable
PlanetOwnerChangedEvent = class(Observable)

function PlanetOwnerChangedEvent:new(planets)
    self.planets = planets
    crossplot:subscribe("PLANET_OWNER_CHANGED", self.planet_owner_changed, self)
end

function PlanetOwnerChangedEvent:planet_owner_changed(planet_name, new_owner_name, old_owner_name)
    if not planet_name then
        return
    end

    local planet = self.planets[planet_name]
    self:notify(planet, new_owner_name, old_owner_name)
end

---@class ProductionStartedEvent : Observable
ProductionStartedEvent = class(Observable)

function ProductionStartedEvent:new(planets)
    ---@private
    ---@type Planet[]
    self.planets = planets
    crossplot:subscribe("PRODUCTION_STARTED", self.production_started, self)
end

function ProductionStartedEvent:production_started(planet_name, object_type_name)
    local planet = self.planets[planet_name]
    self:notify(planet, object_type_name)
end

---@class ProductionFinishedEvent : Observable
ProductionFinishedEvent = class(Observable)

function ProductionFinishedEvent:new(planets)
    self.planets = planets
    crossplot:subscribe("PRODUCTION_FINISHED", self.production_finished, self)
end

function ProductionFinishedEvent:production_finished(planet_name, object_type_name)
    local planet = self.planets[planet_name]
    self:notify(planet, object_type_name)
end

---@class ProductionCanceledEvent : Observable
ProductionCanceledEvent = class(Observable)

function ProductionCanceledEvent:new(planets)
    ---@private
    ---@type Planet[]
    self.planets = planets
    crossplot:subscribe("PRODUCTION_CANCELED", self.production_canceled, self)
end

function ProductionCanceledEvent:production_canceled(planet_name, object_type_name)
    local planet = self.planets[planet_name]
    self:notify(planet, object_type_name)
end

---@class GalacticHeroKilledEvent : Observable
GalacticHeroKilledEvent = class(Observable)

function GalacticHeroKilledEvent:new()
    crossplot:subscribe("GALACTIC_HERO_KILLED", self.galactic_hero_killed, self)
end

function GalacticHeroKilledEvent:galactic_hero_killed(hero_name, owner_name, killer_name)
    self:notify(hero_name, owner_name, killer_name)
end

---@class GalacticHeroNeutralizedEvent : Observable
GalacticHeroNeutralizedEvent = class(Observable)

function GalacticHeroNeutralizedEvent:new()
    crossplot:subscribe("GALACTIC_HERO_NEUTRALIZED", self.galactic_hero_neutralized, self)
end

function GalacticHeroNeutralizedEvent:galactic_hero_neutralized(hero_name, killer_name)
    self:notify(hero_name, killer_name)
end

---@class GalacticSSDKilledEvent : Observable
GalacticSSDKilledEvent = class(Observable)

function GalacticSSDKilledEvent:new()
    crossplot:subscribe("GALACTIC_SSD_KILLED", self.galactic_ssd_killed, self)
end

function GalacticSSDKilledEvent:galactic_ssd_killed(ssd_name, owner_name, killer_name)
    self:notify(ssd_name, owner_name, killer_name)
end

---@class TacticalBattleEndedEvent : Observable
TacticalBattleEndedEvent = class(Observable)

function TacticalBattleEndedEvent:new()
    crossplot:subscribe("GAME_MODE_ENDING", self.battle_ended, self)
end

function TacticalBattleEndedEvent:battle_ended(mode_name)
    self:notify(mode_name)
end

---@class GalacticStarbaseLevelChangeEvent : Observable
GalacticStarbaseLevelChangeEvent = class(Observable)

function GalacticStarbaseLevelChangeEvent:new()
    crossplot:subscribe("STARBASE_LEVEL_CHANGED", self.galactic_starbase_change, self)
end

function GalacticStarbaseLevelChangeEvent:galactic_starbase_change(owner_name, planet, old_type, new_type, killer_name)
    self:notify(owner_name, planet, old_type, new_type, killer_name)
end