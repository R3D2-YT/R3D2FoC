require("deepcore/std/class")
require("PGStoryMode")
require("PGSpawnUnits")
StoryUtil = require("eawx-util/StoryUtil")
require("eawx-util/MissionFunctions")

---@class HeroConvoyMission
HeroConvoyMission = class()

function HeroConvoyMission:new(gc, player, is_ftgu)

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
    self.HeroConvoyUnit = nil
    self.HeroConvoyCountCurrent = nil
    self.HeroConvoyLocationCurrent = nil
    self.HeroConvoyFleet = nil

    self.galactic_hero_killed_event = gc.Events.GalacticHeroKilled
    self.galactic_hero_killed_event:attach_listener(self.on_galactic_hero_killed, self)
end

function HeroConvoyMission:update()
    --Logger:trace("entering HeroConvoyMission:update")
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

function HeroConvoyMission:Begin(reward_group, week_start)
    --Logger:trace("entering HeroConvoyMission:Begin")
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

    self.HeroConvoyUnit = Find_Object_Type("SUPER_TRANSPORT_XI_HERO_CONVOY")
    self.HeroConvoyCountCurrent = 2
    self.HeroConvoyLocationCurrent = StoryUtil.FindTargetPlanet(self.player, true, false, 1, active_enemy_only)

    if self.HeroConvoyLocationCurrent == nil then
        return
    end

    local convoy_list = {"SUPER_TRANSPORT_XI_HERO_CONVOY", "SUPER_TRANSPORT_XI_HERO_CONVOY"}
    local convoy_unit_list = SpawnList(convoy_list, self.HeroConvoyLocationCurrent, self.HeroConvoyLocationCurrent.Get_Owner(), false, false)
    self.HeroConvoyFleet = Assemble_Fleet(convoy_unit_list)
    
    self.TimerStart = week_start
    self.TimeActive = GameRandom.Free_Random(5, 10)
    self.EndTime = self.TimerStart + self.TimeActive
    self.TimeActive = self.TimeActive + 1

    self.Reward, self.RewardCount = StoryUtil.SelectReward(self.player, self.RewardGroupTable.RewardName, 3)
    
    self:UpdateDisplay()

    self.Active = true

    local tag = "HERO_CONVOY"
    crossplot:publish("MISSION_STARTED", tag)

    Story_Event("HERO_CONVOY_ASSIGN")
end

function HeroConvoyMission:UpdateDisplay()
    --Logger:trace("entering HeroConvoyMission:UpdateDisplay")
    local plot = Get_Story_Plot("Conquests\\Events\\MissionRepository.xml")
    local event = plot.Get_Event("Hunt_Hero_Convoy_01")
    event.Set_Dialog(self.Dialog)
    event.Clear_Dialog_Text()

    self.HeroConvoyLocationCurrent = self.HeroConvoyFleet.Get_Parent_Object()
    event.Add_Dialog_Text("TEXT_INTERVENTION_CONVOY_HUNT_OBJECTIVE")
    event.Add_Dialog_Text("TEXT_INTERVENTION_HUNT", self.HeroConvoyUnit)
    event.Add_Dialog_Text("TEXT_INTERVENTION_QUANTITY", self.HeroConvoyCountCurrent)
    if TestValid(self.HeroConvoyLocationCurrent) then
        event.Add_Dialog_Text("TEXT_INTERVENTION_LOCATION", self.HeroConvoyLocationCurrent)
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
        local event = plot.Get_Event("Hunt_Hero_Convoy_Flash")
        event.Set_Reward_Parameter(0, self.HeroConvoyLocationCurrent)
    end
end

function HeroConvoyMission:Fulfil()
    --Logger:trace("entering HeroConvoyMission:Fulfil")
    local RewardLocation = StoryUtil.FindFriendlyPlanet(self.player)

    if RewardLocation ~= nil then
        for i=1,self.RewardCount do
            SpawnList({self.Reward}, RewardLocation, self.player, true, false)
        end
    else 
        RewardLocation = "(No safe location available; reward not granted)"
    end

    local plot = Get_Story_Plot("Conquests\\Events\\MissionRepository.xml")
    local event = plot.Get_Event("Hunt_Hero_Convoy_02")
    event.Set_Dialog(self.Dialog)
    event.Clear_Dialog_Text()

    event.Add_Dialog_Text("TEXT_INTERVENTION_CONVOY_HUNT_OBJECTIVE")
    event.Add_Dialog_Text("TEXT_INTERVENTION_HUNT_COMPLETE", self.HeroConvoyUnit)
    event.Add_Dialog_Text("TEXT_INTERVENTION_QUANTITY", self.HeroConvoyCountCurrent)
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

    Story_Event("HERO_CONVOY_COMPLETE")
end

function HeroConvoyMission:Failed()
    --Logger:trace("entering HeroConvoyMission:Failed")

    local plot = Get_Story_Plot("Conquests\\Events\\MissionRepository.xml")
    local event = plot.Get_Event("Hunt_Hero_Convoy_04")
    event.Set_Dialog(self.Dialog)
    event.Clear_Dialog_Text()

    event.Add_Dialog_Text("TEXT_INTERVENTION_CONVOY_HUNT_OBJECTIVE")
    event.Add_Dialog_Text("TEXT_INTERVENTION_HUNT_FAILED", self.HeroConvoyUnit)
    event.Add_Dialog_Text("TEXT_INTERVENTION_QUANTITY", self.HeroConvoyCountCurrent)
    event.Add_Dialog_Text("TEXT_NONE")

    event.Add_Dialog_Text("TEXT_INTERVENTION_TIMER_START", self.TimerStart)
    event.Add_Dialog_Text("TEXT_INTERVENTION_TIMER_END", self.EndTime)

    if self.RewardGroupTable.GroupSupport then
        crossplot:publish("INCREASE_FAVOUR" , self.RewardGroupTable.GroupSupport, (0 - self.RewardGroupTable.SupportArg))
    end

    convoy_despawn_list = Find_All_Objects_Of_Type("SUPER_TRANSPORT_XI_HERO_CONVOY")
    for _,unit in pairs(convoy_despawn_list) do
        if TestValid(unit) then
            unit.Despawn()
        end
    end

    self:Reset()

    Story_Event("HERO_CONVOY_FAILED")
end


function HeroConvoyMission:on_galactic_hero_killed(hero_type_name)
    --Logger:trace("entering HeroConvoyMission:on_galactic_hero_killed")

    if self.Active == true then
        if hero_type_name == "SUPER_TRANSPORT_XI_HERO_CONVOY" then
            self.HeroConvoyCountCurrent = self.HeroConvoyCountCurrent - 1

            if self.HeroConvoyCountCurrent == 0 then
                self:Fulfil()
            else
                self:UpdateDisplay()
            end
        end
    end
end

function HeroConvoyMission:Reset()
    --Logger:trace("entering HeroConvoyMission:Reset")
    self.Active = false
    self.Dialog = nil
    self.TimerStart = nil
    self.TimeActive = nil
    self.EndTime = nil
    self.Reward = nil
    self.RewardCount = 0
    self.HeroConvoyUnit = nil
    self.HeroConvoyCountCurrent = nil
    self.HeroConvoyLocationCurrent = nil
    self.HeroConvoyFleet = nil

    local tag = "HERO_CONVOY"
    crossplot:publish("MISSION_COMPLETE", tag)
end

return HeroConvoyMission