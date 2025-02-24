require("deepcore/std/class")
require("PGStoryMode")
require("PGSpawnUnits")
StoryUtil = require("eawx-util/StoryUtil")
require("eawx-util/MissionFunctions")

---@class CargoConvoyMission
CargoConvoyMission = class()

function CargoConvoyMission:new(gc, player, is_ftgu)

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
    self.CargoConvoyUnit = nil
    self.CargoConvoyCountCurrent = nil
    self.CargoConvoyLocationCurrent = nil
    self.CargoConvoyFleet = nil

    self.galactic_hero_killed_event = gc.Events.GalacticHeroKilled
    self.galactic_hero_killed_event:attach_listener(self.on_galactic_hero_killed, self)
end

function CargoConvoyMission:update()
    --Logger:trace("entering CargoConvoyMission:update")
    if self.Active == true then
        self:UpdateDisplay()
        if self.TimeActive ~= nil then
            self.TimeActive = self.TimeActive - 1
            if self.TimeActive == 0 then
                self:Failed()
            end
        end
    end
end

function CargoConvoyMission:Begin(reward_group, week_start)
    --Logger:trace("entering CargoConvoyMission:Begin")
    if self.Active == true then
        return
    end
    local plot = Get_Story_Plot("Conquests\\Events\\MissionRepository.xml")
    self.TimeSinceAssigned = 0

    self.RewardGroupTable = reward_group
    self.Dialog = "DIALOG_INTERVENTION_MASTERFILE_"..self.RewardGroupTable.DialogName

    local active_enemy_only = true
    if self.is_ftgu == true then
        active_enemy_only = false
    end

    self.CargoConvoyUnit = Find_Object_Type("SUPER_TRANSPORT_XI_CARGO_CONVOY")
    self.CargoConvoyCountCurrent = 2
    self.CargoConvoyLocationCurrent = StoryUtil.FindTargetPlanet(self.player, true, false, 1, active_enemy_only)

    if self.CargoConvoyLocationCurrent == nil then
        return
    end

    local convoy_list = {"SUPER_TRANSPORT_XI_CARGO_CONVOY", "SUPER_TRANSPORT_XI_CARGO_CONVOY"}
    local convoy_unit_list = SpawnList(convoy_list, self.CargoConvoyLocationCurrent, self.CargoConvoyLocationCurrent.Get_Owner(), false, false)
    self.CargoConvoyFleet = Assemble_Fleet(convoy_unit_list)
    
    self.TimerStart = week_start
    self.TimeActive = GameRandom.Free_Random(5, 10)
    self.EndTime = self.TimerStart + self.TimeActive
    self.TimeActive = self.TimeActive + 1

    self.Reward, self.RewardCount = StoryUtil.SelectReward(self.player, self.RewardGroupTable.RewardName, 3)
    
    self:UpdateDisplay()

    self.Active = true

    local tag = "CARGO_CONVOY"
    crossplot:publish("MISSION_STARTED", tag)

    Story_Event("CARGO_CONVOY_ASSIGN")
end

function CargoConvoyMission:UpdateDisplay()
    --Logger:trace("entering CargoConvoyMission:UpdateDisplay")
    local plot = Get_Story_Plot("Conquests\\Events\\MissionRepository.xml")
    local event = plot.Get_Event("Hunt_Cargo_Convoy_01")
    event.Set_Dialog(self.Dialog)
    event.Clear_Dialog_Text()

    self.CargoConvoyLocationCurrent = self.CargoConvoyFleet.Get_Parent_Object()
    event.Add_Dialog_Text("TEXT_INTERVENTION_CONVOY_HUNT_OBJECTIVE")
    event.Add_Dialog_Text("TEXT_INTERVENTION_HUNT", self.CargoConvoyUnit)
    event.Add_Dialog_Text("TEXT_INTERVENTION_QUANTITY", self.CargoConvoyCountCurrent)
    if TestValid(self.CargoConvoyLocationCurrent) then
        event.Add_Dialog_Text("TEXT_INTERVENTION_LOCATION", self.CargoConvoyLocationCurrent)
    else
        event.Add_Dialog_Text("TEXT_INTERVENTION_CONVOY_HUNT_TRANSIT")
    end
    event.Add_Dialog_Text("TEXT_NONE")

    --Try to turn these into a mission library function after basic testing.
    event.Add_Dialog_Text("TEXT_INTERVENTION_REWARD")
    event.Add_Dialog_Text("TEXT_INTERVENTION_UNIT", Find_Object_Type(self.Reward))
    event.Add_Dialog_Text("TEXT_INTERVENTION_QUANTITY", self.RewardCount)
    event.Add_Dialog_Text("TEXT_NONE")

    event.Add_Dialog_Text("TEXT_INTERVENTION_TIMER_START", self.TimerStart)
    event.Add_Dialog_Text("TEXT_INTERVENTION_TIMER_END", self.EndTime)

    if self.Active == false then
        local event = plot.Get_Event("Hunt_Cargo_Convoy_Flash")
        event.Set_Reward_Parameter(0, self.CargoConvoyLocationCurrent)
    end
end

function CargoConvoyMission:Fulfil()
    --Logger:trace("entering CargoConvoyMission:Fulfil")
    local RewardLocation = StoryUtil.FindFriendlyPlanet(self.player)

    if RewardLocation ~= nil then
        for i=1,self.RewardCount do
            SpawnList({self.Reward}, RewardLocation, self.player, true, false)
        end
    else 
        RewardLocation = "(No safe location available; reward not granted)"
    end

    local plot = Get_Story_Plot("Conquests\\Events\\MissionRepository.xml")
    local event = plot.Get_Event("Hunt_Cargo_Convoy_02")
    event.Set_Dialog(self.Dialog)
    event.Clear_Dialog_Text()

    event.Add_Dialog_Text("TEXT_INTERVENTION_CONVOY_HUNT_OBJECTIVE")
    event.Add_Dialog_Text("TEXT_INTERVENTION_HUNT_COMPLETE", self.CargoConvoyUnit)
    event.Add_Dialog_Text("TEXT_INTERVENTION_QUANTITY", self.CargoConvoyCountCurrent)
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

    Story_Event("CARGO_CONVOY_COMPLETE")
end

function CargoConvoyMission:Failed()
    --Logger:trace("entering CargoConvoyMission:Failed")

    local plot = Get_Story_Plot("Conquests\\Events\\MissionRepository.xml")
    local event = plot.Get_Event("Hunt_Cargo_Convoy_04")
    event.Set_Dialog(self.Dialog)
    event.Clear_Dialog_Text()

    event.Add_Dialog_Text("TEXT_INTERVENTION_CONVOY_HUNT_OBJECTIVE")
    event.Add_Dialog_Text("TEXT_INTERVENTION_HUNT_FAILED", self.CargoConvoyUnit)
    event.Add_Dialog_Text("TEXT_INTERVENTION_QUANTITY", self.CargoConvoyCountCurrent)
    event.Add_Dialog_Text("TEXT_NONE")

    event.Add_Dialog_Text("TEXT_INTERVENTION_TIMER_START", self.TimerStart)
    event.Add_Dialog_Text("TEXT_INTERVENTION_TIMER_END", self.EndTime)

    if self.RewardGroupTable.GroupSupport then
        crossplot:publish("INCREASE_FAVOUR" , self.RewardGroupTable.GroupSupport, (0 - self.RewardGroupTable.SupportArg))
    end

    convoy_despawn_list = Find_All_Objects_Of_Type("SUPER_TRANSPORT_XI_CARGO_CONVOY")
    for _,unit in pairs(convoy_despawn_list) do
        if TestValid(unit) then
            unit.Despawn()
        end
    end

    self:Reset()

    Story_Event("CARGO_CONVOY_FAILED")
end


function CargoConvoyMission:on_galactic_hero_killed(hero_type_name)
    --Logger:trace("entering CargoConvoyMission:on_galactic_hero_killed")

    if self.Active == true then
        if hero_type_name == "SUPER_TRANSPORT_XI_CARGO_CONVOY" then
            self.CargoConvoyCountCurrent = self.CargoConvoyCountCurrent - 1

            if self.CargoConvoyCountCurrent == 0 then
                self:Fulfil()
            else
                self:UpdateDisplay()
            end
        end
    end
end

function CargoConvoyMission:Reset()
    --Logger:trace("entering CargoConvoyMission:Reset")
    self.Active = false
    self.Dialog = nil
    self.TimerStart = nil
    self.TimeActive = nil
    self.EndTime = nil
    self.Reward = nil
    self.RewardCount = 0
    self.CargoConvoyUnit = nil
    self.CargoConvoyCountCurrent = nil
    self.CargoConvoyLocationCurrent = nil
    self.CargoConvoyFleet = nil

    local tag = "CARGO_CONVOY"
    crossplot:publish("MISSION_COMPLETE", tag)
end

return CargoConvoyMission