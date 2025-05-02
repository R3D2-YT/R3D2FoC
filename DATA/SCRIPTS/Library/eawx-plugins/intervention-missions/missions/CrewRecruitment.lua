require("deepcore/std/class")
require("PGStoryMode")
require("PGSpawnUnits")
StoryUtil = require("eawx-util/StoryUtil")
require("eawx-util/MissionFunctions")

require("eawx-plugins/ui/galactic-display/ShipCrewDisplayComponent")

---@class CrewRecruitmentMission
CrewRecruitmentMission = class()

function CrewRecruitmentMission:new(gc, player)
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
	self.CurrentShipCrewIncome = nil
	self.TargetShipCrewIncome = nil

	self.p_human = Find_Player("local")	
	
end

function CrewRecruitmentMission:update()
    --Logger:trace("entering CrewRecruitmentMission:update")
    if self.Active == true then
		self.CurrentShipCrewIncome = (10 * EvaluatePerception("NavalAcademy_Count", self.p_human)) + (30 * EvaluatePerception("CloningFacility_Count", self.p_human))

        if self.CurrentShipCrewIncome >= self.TargetShipCrewIncome then
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

function CrewRecruitmentMission:Begin(reward_group, week_start)
	--Logger:trace("entering CrewRecruitmentMission:Begin")
	if self.Active == true then
		return
	end

	local current_crew_income = (10 * EvaluatePerception("NavalAcademy_Count", self.p_human)) + (30 * EvaluatePerception("CloningFacility_Count", self.p_human))

	if current_crew_income > 100 then
		return
	end

	self.TimeSinceAssigned = 0

    self.RewardGroupTable = reward_group
	self.Dialog = "DIALOG_INTERVENTION_MASTERFILE_"..self.RewardGroupTable.DialogName

	self.TargetShipCrewIncome = GameRandom.Free_Random(2, 3) * 10 + current_crew_income

	self.Active = true
	
	self.TimerStart = week_start
	self.TimeActive = GameRandom.Free_Random(6, 10)
	self.EndTime = self.TimerStart + self.TimeActive
	self.TimeActive = self.TimeActive + 1

	self.Reward, self.RewardCount = StoryUtil.SelectReward(self.player, self.RewardGroupTable.RewardName, 1)

	local plot = Get_Story_Plot("Conquests\\Events\\MissionRepository.xml")
	local event = plot.Get_Event("Crew_Recruitment_01")
	event.Set_Dialog(self.Dialog)
	event.Clear_Dialog_Text()

	event.Add_Dialog_Text("TEXT_INTERVENTION_CREW_RECRUITMENT_OBJECTIVE")
	event.Add_Dialog_Text("TEXT_INTERVENTION_CREW_RECRUITMENT_TARGET", self.TargetShipCrewIncome)
	event.Add_Dialog_Text("TEXT_NONE")

    --Try to turn these into a mission library function after basic testing.
	event.Add_Dialog_Text("TEXT_INTERVENTION_REWARD")
	event.Add_Dialog_Text("TEXT_INTERVENTION_UNIT", Find_Object_Type(self.Reward))
	event.Add_Dialog_Text("TEXT_INTERVENTION_QUANTITY", self.RewardCount)
	event.Add_Dialog_Text("TEXT_NONE")

	event.Add_Dialog_Text("TEXT_INTERVENTION_TIMER_START", self.TimerStart)
	event.Add_Dialog_Text("TEXT_INTERVENTION_TIMER_END", self.EndTime)

	self.Active = true
	
	local tag = "CREW_RECRUITMENT"
	crossplot:publish("MISSION_STARTED", tag)
	
	Story_Event("CREW_RECRUITMENT_ASSIGN")
end

function CrewRecruitmentMission:Fulfil()
	--Logger:trace("entering CrewRecruitmentMission:Fulfil")
	local RewardLocation = StoryUtil.FindFriendlyPlanet(self.player)

	if RewardLocation ~= nil then
		for i=1,self.RewardCount do
			SpawnList({self.Reward}, RewardLocation, self.player, true, false)
		end
	else 
		RewardLocation = "(No safe location available; reward not granted)"
	end

	local plot = Get_Story_Plot("Conquests\\Events\\MissionRepository.xml")
	local event = plot.Get_Event("Crew_Recruitment_02")
	event.Set_Dialog(self.Dialog)
	event.Clear_Dialog_Text()

	event.Add_Dialog_Text("TEXT_INTERVENTION_CREW_RECRUITMENT_OBJECTIVE")
	event.Add_Dialog_Text("TEXT_INTERVENTION_CREW_RECRUITMENT_TARGET_COMPLETE", self.TargetShipCrewIncome)
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

	Story_Event("CREW_RECRUITMENT_COMPLETE")
end

function CrewRecruitmentMission:Failed()
	--Logger:trace("entering CrewRecruitmentMission:Failed")

	local plot = Get_Story_Plot("Conquests\\Events\\MissionRepository.xml")
	local event = plot.Get_Event("Crew_Recruitment_04")
	event.Set_Dialog(self.Dialog)
	event.Clear_Dialog_Text()

	event.Add_Dialog_Text("TEXT_INTERVENTION_CREW_RECRUITMENT_OBJECTIVE")
	event.Add_Dialog_Text("TEXT_INTERVENTION_CREW_RECRUITMENT_TARGET_FAILED", self.TargetShipCrewIncome)
	event.Add_Dialog_Text("TEXT_INTERVENTION_CREW_RECRUITMENT_TARGET_CURRENT", self.CurrentShipCrewIncome)
	event.Add_Dialog_Text("TEXT_NONE")

	event.Add_Dialog_Text("TEXT_INTERVENTION_TIMER_START", self.TimerStart)
	event.Add_Dialog_Text("TEXT_INTERVENTION_TIMER_END", self.EndTime)

	if self.RewardGroupTable.GroupSupport then
		crossplot:publish("INCREASE_FAVOUR" , self.RewardGroupTable.GroupSupport, (0 - self.RewardGroupTable.SupportArg))
	end

    self:Reset()

	Story_Event("CREW_RECRUITMENT_FAILED")
end

function CrewRecruitmentMission:Reset()
    --Logger:trace("entering CrewRecruitmentMission:Reset")
    self.Active = false
	self.Dialog = nil
	self.TimerStart = nil
	self.TimeActive = nil
	self.EndTime = nil
	self.Reward = nil
	self.RewardCount = 0
	self.CurrentShipCrewIncome = nil
	self.TargetShipCrewIncome = nil

	local tag = "CREW_RECRUITMENT"
	crossplot:publish("MISSION_COMPLETE", tag)
end

return CrewRecruitmentMission