require("deepcore/std/class")
require("PGStoryMode")
require("PGSpawnUnits")
StoryUtil = require("eawx-util/StoryUtil")
require("eawx-util/MissionFunctions")

---@class InfrastructureExpansionMission
InfrastructureExpansionMission = class()

function InfrastructureExpansionMission:new(gc, player)
    self.player = player
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

    self.Infrastructure = 0
end

function InfrastructureExpansionMission:update()
    --Logger:trace("entering InfrastructureExpansionMission:update")
    if self.Active == true then
        if (GlobalValue.Get("CURRENT_INFRASTRUCTURE") >= self.Target) then
            self:Fulfil()
        end
        if self.TimeActive ~= nil then
            self.TimeActive = self.TimeActive - 1
            if self.TimeActive == 0 then
                self:Failed()
            end
        end
    end
end

function InfrastructureExpansionMission:Begin(reward_group, week_start)
	--Logger:trace("entering InfrastructureExpansionMission:Begin")
	if self.Active == true then
		return
	end

	if GlobalValue.Get("OPEN_INFRASTRUCTURE_SLOTS") < 10 then
		return
	end

	self.TimeSinceAssigned = 0

    self.RewardGroupTable = reward_group
	self.Dialog = "DIALOG_INTERVENTION_MASTERFILE_"..self.RewardGroupTable.DialogName

	self.Infrastructure = GlobalValue.Get("CURRENT_INFRASTRUCTURE")
	self.Target = self.Infrastructure + GameRandom.Free_Random(6, 10)

	self.Active = true
	
	self.TimerStart = week_start
	self.TimeActive = GameRandom.Free_Random(6, 10)
	self.EndTime = self.TimerStart + self.TimeActive
	self.TimeActive = self.TimeActive + 1

	self.Reward, self.RewardCount = StoryUtil.SelectReward(self.player, self.RewardGroupTable.RewardName, 1)

	local plot = Get_Story_Plot("Conquests\\Events\\MissionRepository.xml")
	local event = plot.Get_Event("Expanding_Infrastructure_01")
	event.Set_Dialog(self.Dialog)
	event.Clear_Dialog_Text()

	event.Add_Dialog_Text("TEXT_INTERVENTION_INFRASTRUCTURE_EXPANSION_OBJECTIVE")
	event.Add_Dialog_Text("TEXT_INTERVENTION_INFRASTRUCTURE_EXPANSION_TARGET", self.Target)
	event.Add_Dialog_Text("TEXT_NONE")

    --Try to turn these into a mission library function after basic testing.
	event.Add_Dialog_Text("TEXT_INTERVENTION_REWARD")
	event.Add_Dialog_Text("TEXT_INTERVENTION_UNIT", Find_Object_Type(self.Reward))
	event.Add_Dialog_Text("TEXT_INTERVENTION_QUANTITY", self.RewardCount)
	event.Add_Dialog_Text("TEXT_NONE")

	event.Add_Dialog_Text("TEXT_INTERVENTION_TIMER_START", self.TimerStart)
	event.Add_Dialog_Text("TEXT_INTERVENTION_TIMER_END", self.EndTime)

	self.Active = true

	local tag = "INFRASTRUCTURE_EXPANSION"
	crossplot:publish("MISSION_STARTED", tag)

	Story_Event("INFRASTRUCTURE_EXPANSION_ASSIGN")
end

function InfrastructureExpansionMission:Fulfil()
	--Logger:trace("entering InfrastructureExpansionMission:Fulfil")
	local RewardLocation = StoryUtil.FindFriendlyPlanet(self.player)

	if RewardLocation ~= nil then
		for i=1,self.RewardCount do
			SpawnList({self.Reward}, RewardLocation, self.player, true, false)
		end
	else 
		RewardLocation = "(No safe location available; reward not granted)"
	end

	local plot = Get_Story_Plot("Conquests\\Events\\MissionRepository.xml")
	local event = plot.Get_Event("Expanding_Infrastructure_02")
	event.Set_Dialog(self.Dialog)
	event.Clear_Dialog_Text()

	event.Add_Dialog_Text("TEXT_INTERVENTION_INFRASTRUCTURE_EXPANSION_OBJECTIVE")
	event.Add_Dialog_Text("TEXT_INTERVENTION_INFRASTRUCTURE_EXPANSION_TARGET_COMPLETE", self.Target)
	event.Add_Dialog_Text("TEXT_NONE")

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

	Story_Event("INFRASTRUCTURE_EXPANSION_COMPLETE")
end

function InfrastructureExpansionMission:Failed()
	--Logger:trace("entering InfrastructureExpansionMission:Failed")

	self.Infrastructure = GlobalValue.Get("CURRENT_INFRASTRUCTURE")

	local plot = Get_Story_Plot("Conquests\\Events\\MissionRepository.xml")
	local event = plot.Get_Event("Expanding_Infrastructure_04")
	event.Set_Dialog(self.Dialog)
	event.Clear_Dialog_Text()

	event.Add_Dialog_Text("TEXT_INTERVENTION_INFRASTRUCTURE_EXPANSION_OBJECTIVE")
	event.Add_Dialog_Text("TEXT_INTERVENTION_INFRASTRUCTURE_EXPANSION_TARGET_FAILED", self.Target)
	event.Add_Dialog_Text("TEXT_INTERVENTION_INFRASTRUCTURE_EXPANSION_TARGET_CURRENT", self.Infrastructure)
	event.Add_Dialog_Text("TEXT_NONE")

	event.Add_Dialog_Text("TEXT_INTERVENTION_TIMER_START", self.TimerStart)
	event.Add_Dialog_Text("TEXT_INTERVENTION_TIMER_END", self.EndTime)

	if self.RewardGroupTable.GroupSupport then
		crossplot:publish("INCREASE_FAVOUR" , self.RewardGroupTable.GroupSupport, (0 - self.RewardGroupTable.SupportArg))
	end

    self:Reset()

	Story_Event("INFRASTRUCTURE_EXPANSION_FAILED")
end

function InfrastructureExpansionMission:Reset()
    --Logger:trace("entering InfrastructureExpansionMission:Reset")
    self.Active = false
	self.Dialog = nil
	self.TimerStart = nil
	self.TimeActive = nil
	self.EndTime = nil
	self.Reward = nil
	self.RewardCount = 0
	self.Target = nil
	self.Infrastructure = nil

	local tag = "INFRASTRUCTURE_EXPANSION"
	crossplot:publish("MISSION_COMPLETE", tag)
end

return InfrastructureExpansionMission