--**************************************************************************************************
--*    _______ __                                                                                  *
--*   |_     _|  |--.----.---.-.--.--.--.-----.-----.                                              *
--*     |   | |     |   _|  _  |  |  |  |     |__ --|                                              *
--*     |___| |__|__|__| |___._|________|__|__|_____|                                              *
--*    ______                                                                                      *
--*   |   __ \.-----.--.--.-----.-----.-----.-----.                                                *
--*   |      <|  -__|  |  |  -__|     |  _  |  -__|                                                *
--*   |___|__||_____|\___/|_____|__|__|___  |_____|                                                *
--*                                   |_____|                                                      *
--*                                                                                                *
--*                                                                                                *
--*       File:              RevoltManager.lua                                                     *
--*       File Created:      Thursday, 15th October 2020 08:26                                     *
--*       Author:            [TR] Hexodus Scar                                                     *
--*       Last Modified:     Sunday, 23rd February 2020 10:22                                      *
--*       Modified By:       [TR] Hexodus Scar                                                     *
--*       Copyright:         Thrawns Revenge Development Team                                      *
--*       License:           This code may not be used without the author's explicit permission    *
--**************************************************************************************************

require("PGSpawnUnits")
require("eawx-util/ChangeOwnerUtilities")
require("eawx-util/PopulatePlanetUtilities")
require("eawx-plugins/revolt-manager/LoyaltyPolicyRepository")
ModContentLoader.get("influence-policy/InfluencePolicyRepository")
CONSTANTS = ModContentLoader.get("GameConstants")

---@class RevoltManager
require("deepcore/std/class")

RevoltManager = class()

---@param human_player PlayerObject
function RevoltManager:new(human_player, planets, generated)
    self.human_player = human_player
    self.planet = nil
end

---@param planet Planet
function RevoltManager:planetary_revolt(planet)
    --Logger:trace("entering RevoltManager:planetary_revolt")
    self.planet = planet:get_game_object()
 
    local choose_owner = LoyaltyPolicyRepository[string.lower(planet:get_name())] or LoyaltyPolicyRepository.DEFAULT
    ChangePlanetOwnerAndPopulate(self.planet, choose_owner(planet), 4500)
end