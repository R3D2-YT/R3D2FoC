require("deepcore/std/class")
require("PGStoryMode")
require("PGSpawnUnits")
StoryUtil = require("eawx-util/StoryUtil")
require("eawx-util/MissionFunctions")

---@class AccumulateMission
AccumulateMission = class()

function AccumulateMission:new(gc, player)

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
	self.CurrentCreditIncome = nil
	self.TargetCreditIncome = nil	
end

function AccumulateMission:update()
    --Logger:trace("entering AccumulateMission:update")
    if self.Active == true then
        self.CurrentCreditIncome = GlobalValue.Get("HUMAN_CURRENT_NET_INCOME")
        if self.CurrentCreditIncome >= self.TargetCreditIncome then
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

function AccumulateMission:Begin(reward_group, week_start)
	--Logger:trace("entering AccumulateMission:Begin")
	if self.Active == true then
		return
	end

	local current_credit_income = GlobalValue.Get("HUMAN_CURRENT_NET_INCOME")

	if current_credit_income > 20000 then
		return
	end

	self.TimeSinceAssigned = 0

    self.RewardGroupTable = reward_group
	self.Dialog = "DIALOG_INTERVENTION_MASTERFILE_"..self.RewardGroupTable.DialogName

	self.TargetCreditIncome = GameRandom.Free_Random(10, 30) * 100 + current_credit_income

	self.Active = true
	
	self.TimerStart = week_start
	self.TimeActive = GameRandom.Free_Random(5, 10)
	self.EndTime = self.TimerStart + self.TimeActive
	self.TimeActive = self.TimeActive + 1

	self.Reward, self.RewardCount = StoryUtil.SelectReward(self.player, self.RewardGroupTable.RewardName, 1)

	local plot = Get_Story_Plot("Conquests\\Events\\MissionRepository.xml")
	local event = plot.Get_Event("Accumulate_Credits_01")
	event.Set_Dialog(self.Dialog)
	event.Clear_Dialog_Text()

	event.Add_Dialog_Text("TEXT_INTERVENTION_ACCUMULATE_OBJECTIVE")
	event.Add_Dialog_Text("TEXT_INTERVENTION_ACCUMULATE_TARGET", self.TargetCreditIncome)
	event.Add_Dialog_Text("TEXT_NONE")

    --Try to turn these into a mission library function after basic testing.
	event.Add_Dialog_Text("TEXT_INTERVENTION_REWARD")
	event.Add_Dialog_Text("TEXT_INTERVENTION_UNIT", Find_Object_Type(self.Reward))
	event.Add_Dialog_Text("TEXT_INTERVENTION_QUANTITY", self.RewardCount)
	event.Add_Dialog_Text("TEXT_NONE")

	event.Add_Dialog_Text("TEXT_INTERVENTION_TIMER_START", self.TimerStart)
	event.Add_Dialog_Text("TEXT_INTERVENTION_TIMER_END", self.EndTime)

	self.Active = true

	local tag = "ACCUMULATE"
	crossplot:publish("MISSION_STARTED", tag)

	Story_Event("ACCUMULATE_ASSIGN")
end

function AccumulateMission:Fulfil()
	--Logger:trace("entering AccumulateMission:Fulfil")
	local RewardLocation = StoryUtil.FindFriendlyPlanet(self.player)

	if RewardLocation ~= nil then
		for i=1,self.RewardCount do
			SpawnList({self.Reward}, RewardLocation, self.player, true, false)
		end
	else 
		RewardLocation = "(No safe location available; reward not granted)"
	end

	local plot = Get_Story_Plot("Conquests\\Events\\MissionRepository.xml")
	local event = plot.Get_Event("Accumulate_Credits_02")
	event.Set_Dialog(self.Dialog)
	event.Clear_Dialog_Text()

	event.Add_Dialog_Text("TEXT_INTERVENTION_ACCUMULATE_OBJECTIVE")
	event.Add_Dialog_Text("TEXT_INTERVENTION_ACCUMULATE_TARGET_COMPLETE", self.TargetCreditIncome)
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

	Story_Event("ACCUMULATE_COMPLETE")
end

function AccumulateMission:Failed()
	--Logger:trace("entering AccumulateMission:Failed")

	local plot = Get_Story_Plot("Conquests\\Events\\MissionRepository.xml")
	local event = plot.Get_Event("Accumulate_Credits_04")
	event.Set_Dialog(self.Dialog)
	event.Clear_Dialog_Text()

	event.Add_Dialog_Text("TEXT_INTERVENTION_ACCUMULATE_OBJECTIVE")
	event.Add_Dialog_Text("TEXT_INTERVENTION_ACCUMULATE_TARGET_FAILED", self.TargetCreditIncome)
	event.Add_Dialog_Text("TEXT_INTERVENTION_ACCUMULATE_TARGET_CURRENT", self.CurrentCreditIncome)
	event.Add_Dialog_Text("TEXT_NONE")

	event.Add_Dialog_Text("TEXT_INTERVENTION_TIMER_START", self.TimerStart)
	event.Add_Dialog_Text("TEXT_INTERVENTION_TIMER_END", self.EndTime)

	if self.RewardGroupTable.GroupSupport then
		crossplot:publish("INCREASE_FAVOUR" , self.RewardGroupTable.GroupSupport, (0 - self.RewardGroupTable.SupportArg))
	end

    self:Reset()

	Story_Event("ACCUMULATE_FAILED")
end

function AccumulateMission:Reset()
    --Logger:trace("entering AccumulateMission:Reset")
    self.Active = false
	self.Dialog = nil
	self.TimerStart = nil
	self.TimeActive = nil
	self.EndTime = nil
	self.Reward = nil
	self.RewardCount = 0
	self.CurrentCreditIncome = nil
	self.TargetCreditIncome = nil

	local tag = "ACCUMULATE"
	crossplot:publish("MISSION_COMPLETE", tag)
end

return AccumulateMission