require("deepcore/std/class")
require("PGStoryMode")
require("PGSpawnUnits")
StoryUtil = require("eawx-util/StoryUtil")
require("eawx-util/MissionFunctions")

---@class LiberateMission
LiberateMission = class()

function LiberateMission:new(gc, player, is_ftgu)
    self.player = player
    self.is_ftgu = is_ftgu
    self.Dialog = nil
    self.RewardGroupTable = nil

    self.TimeSinceAssigned = 0

    self.Active = false
    self.TimerStart = nil
    self.TimeActive = nil
    self.EndTime = nil
    self.Reward = nil
    self.RewardCount = 0
    self.Target = nil

    self.planet_owner_changed_event = gc.Events.PlanetOwnerChanged
    self.planet_owner_changed_event:attach_listener(self.on_planet_conquered, self)

end

function LiberateMission:update()
    --Logger:trace("entering LiberateMission:update")
    if self.Active == true then
        if self.TimeActive ~= nil then
            self.TimeActive = self.TimeActive - 1
            if self.TimeActive == 0 then
                self:Failed()
            end
        end
    end
end

function LiberateMission:Begin(reward_group, week_start)
    --Logger:trace("entering LiberateMission:Begin")
    if self.Active == true then
        self:Reset()
    end

    self.TimeSinceAssigned = 0

    self.RewardGroupTable = reward_group
    self.Dialog = "DIALOG_INTERVENTION_MASTERFILE_"..self.RewardGroupTable.DialogName

    self.TimerStart = week_start
    self.TimeActive = GameRandom.Free_Random(5, 10)
    self.EndTime = self.TimerStart + self.TimeActive
    self.TimeActive = self.TimeActive + 1

    local active_enemy_only = true
    if self.is_ftgu == true then
        active_enemy_only = false
    end

    self.Target = StoryUtil.FindTargetPlanet(self.player, true, false, 1, active_enemy_only)
    if self.Target == nil then
        self:Reset()
    end

    self.Reward, self.RewardCount = StoryUtil.SelectReward(self.player, self.RewardGroupTable.RewardName, 3)


    local plot = Get_Story_Plot("Conquests\\Events\\MissionRepository.xml")
    local event = plot.Get_Event("Liberate_Planet_01")
    event.Set_Dialog(self.Dialog)
    event.Clear_Dialog_Text()

    event.Add_Dialog_Text("TEXT_INTERVENTION_PLANET_CONQUEST_OBJECTIVE")
    event.Add_Dialog_Text("TEXT_INTERVENTION_PLANET_CONQUEST_LOCATION", self.Target)
    event.Add_Dialog_Text("TEXT_NONE")

    --Try to turn these into a mission library function after basic testing.
    event.Add_Dialog_Text("TEXT_INTERVENTION_REWARD")
    event.Add_Dialog_Text("TEXT_INTERVENTION_UNIT", Find_Object_Type(self.Reward))
    event.Add_Dialog_Text("TEXT_INTERVENTION_QUANTITY", self.RewardCount)
    event.Add_Dialog_Text("TEXT_NONE")

    event.Add_Dialog_Text("TEXT_INTERVENTION_TIMER_START", self.TimerStart)
    event.Add_Dialog_Text("TEXT_INTERVENTION_TIMER_END", self.EndTime)

    local event = plot.Get_Event("Liberate_Planet_Flash")
    event.Set_Reward_Parameter(0, self.Target)

    self.Active = true

    local tag = "LIBERATE"
    crossplot:publish("MISSION_STARTED", tag)

    Story_Event("LIBERATE_ASSIGN")
end

function LiberateMission:Fulfil()
    --Logger:trace("entering LiberateMission:Fulfil")
    local RewardLocation = StoryUtil.FindFriendlyPlanet(self.player)

    if RewardLocation ~= nil then
        for i=1,self.RewardCount do
            SpawnList({self.Reward}, RewardLocation, self.player, true, false)
        end
    else 
        RewardLocation = "(No safe location available; reward not granted)"
    end

    local plot = Get_Story_Plot("Conquests\\Events\\MissionRepository.xml")
    local event = plot.Get_Event("Liberate_Planet_02")
    event.Set_Dialog(self.Dialog)
    event.Clear_Dialog_Text()

    event.Add_Dialog_Text("TEXT_INTERVENTION_PLANET_CONQUEST_OBJECTIVE")
    event.Add_Dialog_Text("TEXT_INTERVENTION_PLANET_CONQUEST_LOCATION_COMPLETE", self.Target)
    event.Add_Dialog_Text("TEXT_NONE")

    --Try to turn these into a mission library function after basic testing.
    event.Add_Dialog_Text("TEXT_INTERVENTION_REWARD")
    event.Add_Dialog_Text("TEXT_INTERVENTION_UNIT", Find_Object_Type(self.Reward))
    event.Add_Dialog_Text("TEXT_INTERVENTION_QUANTITY", self.RewardCount)
    event.Add_Dialog_Text("TEXT_INTERVENTION_LOCATION", RewardLocation)
    event.Add_Dialog_Text("TEXT_NONE")

    event.Add_Dialog_Text("TEXT_INTERVENTION_TIMER_START", self.TimerStart)
    event.Add_Dialog_Text("TEXT_INTERVENTION_TIMER_END", self.EndTime)

    if self.RewardGroupTable.GroupSupport then
        crossplot:publish("INCREASE_FAVOUR", self.RewardGroupTable.GroupSupport, self.RewardGroupTable.SupportArg)
    end

    self:Reset()

    Story_Event("LIBERATE_COMPLETE")
end

function LiberateMission:Failed()
    --Logger:trace("entering LiberateMission:Failed")

    local plot = Get_Story_Plot("Conquests\\Events\\MissionRepository.xml")
    local event = plot.Get_Event("Liberate_Planet_04")
    event.Set_Dialog(self.Dialog)
    event.Clear_Dialog_Text()

    event.Add_Dialog_Text("TEXT_INTERVENTION_PLANET_CONQUEST_OBJECTIVE")
    event.Add_Dialog_Text("TEXT_INTERVENTION_PLANET_CONQUEST_LOCATION_FAILED", self.Target)
    event.Add_Dialog_Text("TEXT_NONE")

    event.Add_Dialog_Text("TEXT_INTERVENTION_TIMER_START", self.TimerStart)
    event.Add_Dialog_Text("TEXT_INTERVENTION_TIMER_END", self.EndTime)

    if self.RewardGroupTable.GroupSupport then
        crossplot:publish("INCREASE_FAVOUR" , self.RewardGroupTable.GroupSupport, (0 - self.RewardGroupTable.SupportArg))
    end

    self:Reset()

    Story_Event("LIBERATE_FAILED")
end

function LiberateMission:Reset()
    --Logger:trace("entering LiberateMission:Reset")
    self.Active = false
    self.Dialog = nil
    self.TimerStart = nil
    self.TimeActive = nil
    self.EndTime = nil
    self.Reward = nil
    self.RewardCount = 0
    self.Target = nil

    local tag = "LIBERATE"
    crossplot:publish("MISSION_COMPLETE", tag)
end

function LiberateMission:on_planet_conquered(planet, new_owner_name, old_owner_name)
    if new_owner_name ~= self.player.Get_Faction_Name() then 
        return
    end
    --Logger:trace("entering LiberateMission:on_planet_conquered")

    if self.Active == true then
        if planet:get_game_object() == self.Target then
            self:Fulfil()
        end
    end
end

return LiberateMission