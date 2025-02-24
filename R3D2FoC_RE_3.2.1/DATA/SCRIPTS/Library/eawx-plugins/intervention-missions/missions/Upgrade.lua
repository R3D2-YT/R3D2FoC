require("deepcore/std/class")
require("PGStoryMode")
require("PGSpawnUnits")
StoryUtil = require("eawx-util/StoryUtil")
require("eawx-util/MissionFunctions")

---@class UpgradeMission
UpgradeMission = class()

function UpgradeMission:new(gc, player)

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
	self.UpgradeType = nil
	self.UpgradeAmount = 0
	self.UpgradeCountCurrent = 0
	self.Buildlist = nil

	self.production_finished_event = gc.Events.GalacticProductionFinished
	self.production_finished_event:attach_listener(self.on_construction_finished, self)

end

function UpgradeMission:update()
    --Logger:trace("entering UpgradeMission:update")
    if self.Active == true then
        if self.TimeActive ~= nil then
            self.TimeActive = self.TimeActive - 1
            if self.TimeActive == 0 then
                self:Failed()
            end
        end
    end
end

function UpgradeMission:Begin(reward_group, week_start)
	--Logger:trace("entering UpgradeMission:Begin")
	if self.Active == true then
		return
	end
	local plot = Get_Story_Plot("Conquests\\Events\\MissionRepository.xml")
	self.TimeSinceAssigned = 0

    self.RewardGroupTable = reward_group
	self.Dialog = "DIALOG_INTERVENTION_MASTERFILE_"..self.RewardGroupTable.DialogName
	
	self.TimerStart = week_start
	self.TimeActive = GameRandom.Free_Random(7, 13)
	self.EndTime = self.TimerStart + self.TimeActive
	self.TimeActive = self.TimeActive + 1

	self.Reward, self.RewardCount = StoryUtil.SelectReward(self.player, self.RewardGroupTable.RewardName, 2)

	self.Buildlist = "SPACE"

	MasterBuildingTable = require("eawx-plugins/intervention-missions/build-options/BuildOptionTables_"..self.player.Get_Faction_Name())
	if self.RewardGroupTable.GroupSupport then
		local build_list_group = self.Buildlist.."_"..self.RewardGroupTable.GroupSupport
		if MasterBuildingTable[build_list_group] ~= nil then
			self.Buildlist = build_list_group
		end
	end
	
	self.UpgradeType, self.UpgradeAmount = StoryUtil.SelectBuilding(self.player, self.Buildlist)

	self:UpdateDisplay()

	self.Active = true

	local tag = "UPGRADE"
	crossplot:publish("MISSION_STARTED", tag)

	Story_Event("UPGRADE_ASSIGN")
end

function UpgradeMission:UpdateDisplay()
	--Logger:trace("entering ConstructMission:UpdateDisplay")
	local plot = Get_Story_Plot("Conquests\\Events\\MissionRepository.xml")
	local event = plot.Get_Event("Upgrade_Structure_01")
	event.Set_Dialog(self.Dialog)
	event.Clear_Dialog_Text()

	event.Add_Dialog_Text("TEXT_INTERVENTION_UPGRADE_STRUCTURE_OBJECTIVE")
	event.Add_Dialog_Text("TEXT_INTERVENTION_STRUCTURE", Find_Object_Type(self.UpgradeType))
	event.Add_Dialog_Text("TEXT_INTERVENTION_QUANTITY_TARGET", self.UpgradeAmount)
	event.Add_Dialog_Text("TEXT_INTERVENTION_QUANTITY_CURRENT", self.UpgradeCountCurrent)
	event.Add_Dialog_Text("TEXT_NONE")

	--Try to turn these into a mission library function after basic testing.
	event.Add_Dialog_Text("TEXT_INTERVENTION_REWARD")
	event.Add_Dialog_Text("TEXT_INTERVENTION_UNIT", Find_Object_Type(self.Reward))
	event.Add_Dialog_Text("TEXT_INTERVENTION_QUANTITY", self.RewardCount)
	event.Add_Dialog_Text("TEXT_NONE")

	event.Add_Dialog_Text("TEXT_INTERVENTION_TIMER_START", self.TimerStart)
	event.Add_Dialog_Text("TEXT_INTERVENTION_TIMER_END", self.EndTime)

end

function UpgradeMission:Fulfil()
	--Logger:trace("entering UpgradeMission:Fulfil")
	local RewardLocation = StoryUtil.FindFriendlyPlanet(self.player)

	if RewardLocation ~= nil then
		for i=1,self.RewardCount do
			SpawnList({self.Reward}, RewardLocation, self.player, true, false)
		end
	else 
		RewardLocation = "(No safe location available; reward not granted)"
	end

	local plot = Get_Story_Plot("Conquests\\Events\\MissionRepository.xml")
	local event = plot.Get_Event("Upgrade_Structure_02")
	event.Set_Dialog(self.Dialog)
	event.Clear_Dialog_Text()

	event.Add_Dialog_Text("TEXT_INTERVENTION_UPGRADE_STRUCTURE_OBJECTIVE")
	event.Add_Dialog_Text("TEXT_INTERVENTION_STRUCTURE_COMPLETE", Find_Object_Type(self.UpgradeType))
	event.Add_Dialog_Text("TEXT_INTERVENTION_QUANTITY_TARGET", self.UpgradeAmount)
	event.Add_Dialog_Text("TEXT_INTERVENTION_QUANTITY_CURRENT", self.UpgradeCountCurrent)
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

	Story_Event("UPGRADE_COMPLETE")
end

function UpgradeMission:Failed()
	--Logger:trace("entering UpgradeMission:Failed")

	local plot = Get_Story_Plot("Conquests\\Events\\MissionRepository.xml")
	local event = plot.Get_Event("Upgrade_Structure_04")
	event.Set_Dialog(self.Dialog)
	event.Clear_Dialog_Text()

	event.Add_Dialog_Text("TEXT_INTERVENTION_UPGRADE_STRUCTURE_OBJECTIVE")
	event.Add_Dialog_Text("TEXT_INTERVENTION_STRUCTURE_FAILED", Find_Object_Type(self.UpgradeType))
	event.Add_Dialog_Text("TEXT_INTERVENTION_QUANTITY_TARGET", self.UpgradeAmount)
	event.Add_Dialog_Text("TEXT_INTERVENTION_QUANTITY_CURRENT", self.UpgradeCountCurrent)
	event.Add_Dialog_Text("TEXT_NONE")

	event.Add_Dialog_Text("TEXT_INTERVENTION_TIMER_START", self.TimerStart)
	event.Add_Dialog_Text("TEXT_INTERVENTION_TIMER_END", self.EndTime)

	if self.RewardGroupTable.GroupSupport then
		crossplot:publish("INCREASE_FAVOUR" , self.RewardGroupTable.GroupSupport, (0 - self.RewardGroupTable.SupportArg))
	end

    self:Reset()

	Story_Event("UPGRADE_FAILED")
end

function UpgradeMission:Reset()
    --Logger:trace("entering UpgradeMission:Reset")
    self.Active = false
	self.Dialog = nil
	self.TimerStart = nil
	self.TimeActive = nil
	self.EndTime = nil
	self.Reward = nil
	self.RewardCount = 0
	self.UpgradeType = nil
	self.UpgradeAmount = 0
	self.UpgradeCountCurrent = 0

	local tag = "UPGRADE"
	crossplot:publish("MISSION_COMPLETE", tag)
end

function UpgradeMission:on_construction_finished(planet, game_object_type_name)
	--Logger:trace("entering UpgradeMission:on_construction_finished")
	if self.Active == true and self.UpgradeType ~= nil then
		if planet:get_owner() == self.player and game_object_type_name == Find_Object_Type(self.UpgradeType).Get_Name() then
			self.UpgradeCountCurrent = self.UpgradeCountCurrent + 1
			if self.UpgradeCountCurrent >= self.UpgradeAmount then 
				self:Fulfil()
			else
				self:UpdateDisplay()
			end
		end
	end
end

return UpgradeMission