require("deepcore/std/class")
require("PGStoryMode")
require("PGSpawnUnits")
StoryUtil = require("eawx-util/StoryUtil")
require("eawx-util/MissionFunctions")

---@class ConstructMission
ConstructMission = class()

function ConstructMission:new(gc, player)

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
	self.ConstructType = nil
	self.ConstructAmount = 0
	self.ConstructCountCurrent = 0
	self.Buildlist = nil

	self.production_finished_event = gc.Events.GalacticProductionFinished
	self.production_finished_event:attach_listener(self.on_construction_finished, self)

end

function ConstructMission:update()
    --Logger:trace("entering ConstructMission:update")
    if self.Active == true then
        if self.TimeActive ~= nil then
            self.TimeActive = self.TimeActive - 1
            if self.TimeActive == 0 then
                self:Failed()
            end
        end
    end
end

function ConstructMission:Begin(reward_group, week_start)
	--Logger:trace("entering ConstructMission:Begin")
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

	self.Buildlist = "GROUND"

	MasterBuildingTable = require("eawx-plugins/intervention-missions/build-options/BuildOptionTables_"..self.player.Get_Faction_Name())
	if self.RewardGroupTable.GroupSupport then
		local build_list_group = self.Buildlist.."_"..self.RewardGroupTable.GroupSupport
		if MasterBuildingTable[build_list_group] ~= nil then
			self.Buildlist = build_list_group
		end
	end
	
	self.ConstructType, self.ConstructAmount = StoryUtil.SelectBuilding(self.player, self.Buildlist)

	self:UpdateDisplay()

	self.Active = true
	
	local tag = "CONSTRUCT"
	crossplot:publish("MISSION_STARTED", tag)

	Story_Event("CONSTRUCT_ASSIGN")
end

function ConstructMission:UpdateDisplay()
	--Logger:trace("entering ConstructMission:UpdateDisplay")
	local plot = Get_Story_Plot("Conquests\\Events\\MissionRepository.xml")
	local event = plot.Get_Event("Construct_Structure_01")
	event.Set_Dialog(self.Dialog)
	event.Clear_Dialog_Text()

	event.Add_Dialog_Text("TEXT_INTERVENTION_CONSTRUCT_STRUCTURE_OBJECTIVE")
	event.Add_Dialog_Text("TEXT_INTERVENTION_STRUCTURE", Find_Object_Type(self.ConstructType))
	event.Add_Dialog_Text("TEXT_INTERVENTION_QUANTITY_TARGET", self.ConstructAmount)
	event.Add_Dialog_Text("TEXT_INTERVENTION_QUANTITY_CURRENT", self.ConstructCountCurrent)
	event.Add_Dialog_Text("TEXT_NONE")

	--Try to turn these into a mission library function after basic testing.
	event.Add_Dialog_Text("TEXT_INTERVENTION_REWARD")
	event.Add_Dialog_Text("TEXT_INTERVENTION_UNIT", Find_Object_Type(self.Reward))
	event.Add_Dialog_Text("TEXT_INTERVENTION_QUANTITY", self.RewardCount)
	event.Add_Dialog_Text("TEXT_NONE")

	event.Add_Dialog_Text("TEXT_INTERVENTION_TIMER_START", self.TimerStart)
	event.Add_Dialog_Text("TEXT_INTERVENTION_TIMER_END", self.EndTime)

end

function ConstructMission:Fulfil()
	--Logger:trace("entering ConstructMission:Fulfil")
	local RewardLocation = StoryUtil.FindFriendlyPlanet(self.player)

	if RewardLocation ~= nil then
		for i=1,self.RewardCount do
			SpawnList({self.Reward}, RewardLocation, self.player, true, false)
		end
	else 
		RewardLocation = "(No safe location available; reward not granted)"
	end

	local plot = Get_Story_Plot("Conquests\\Events\\MissionRepository.xml")
	local event = plot.Get_Event("Construct_Structure_02")
	event.Set_Dialog(self.Dialog)
	event.Clear_Dialog_Text()

	event.Add_Dialog_Text("TEXT_INTERVENTION_CONSTRUCT_STRUCTURE_OBJECTIVE")
	event.Add_Dialog_Text("TEXT_INTERVENTION_STRUCTURE_COMPLETE", Find_Object_Type(self.ConstructType))
	event.Add_Dialog_Text("TEXT_INTERVENTION_QUANTITY_TARGET", self.ConstructAmount)
	event.Add_Dialog_Text("TEXT_INTERVENTION_QUANTITY_CURRENT", self.ConstructCountCurrent)
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

	Story_Event("CONSTRUCT_COMPLETE")
end

function ConstructMission:Failed()
	--Logger:trace("entering ConstructMission:Failed")

	local plot = Get_Story_Plot("Conquests\\Events\\MissionRepository.xml")
	local event = plot.Get_Event("Construct_Structure_04")
	event.Set_Dialog(self.Dialog)
	event.Clear_Dialog_Text()

	event.Add_Dialog_Text("TEXT_INTERVENTION_CONSTRUCT_STRUCTURE_OBJECTIVE")
	event.Add_Dialog_Text("TEXT_INTERVENTION_STRUCTURE_FAILED", Find_Object_Type(self.ConstructType))
	event.Add_Dialog_Text("TEXT_INTERVENTION_QUANTITY_TARGET", self.ConstructAmount)
	event.Add_Dialog_Text("TEXT_INTERVENTION_QUANTITY_CURRENT", self.ConstructCountCurrent)
	event.Add_Dialog_Text("TEXT_NONE")

	event.Add_Dialog_Text("TEXT_INTERVENTION_TIMER_START", self.TimerStart)
	event.Add_Dialog_Text("TEXT_INTERVENTION_TIMER_END", self.EndTime)

	if self.RewardGroupTable.GroupSupport then
		crossplot:publish("INCREASE_FAVOUR" , self.RewardGroupTable.GroupSupport, (0 - self.RewardGroupTable.SupportArg))
	end

    self:Reset()

	Story_Event("CONSTRUCT_FAILED")
end

function ConstructMission:Reset()
    --Logger:trace("entering ConstructMission:Reset")
    self.Active = false
	self.Dialog = nil
	self.TimerStart = nil
	self.TimeActive = nil
	self.EndTime = nil
	self.Reward = nil
	self.RewardCount = 0
	self.ConstructType = nil
	self.ConstructAmount = 0
	self.ConstructCountCurrent = 0

	local tag = "CONSTRUCT"
	crossplot:publish("MISSION_COMPLETE", tag)
end

function ConstructMission:on_construction_finished(planet, game_object_type_name)
	--Logger:trace("entering ConstructMission:on_construction_finished")
	if self.Active == true and self.ConstructType ~= nil then

		--this is a kludge to support the unique barracks type in FOTR GC "Operation: Knight Hammer" ~Mord
		if game_object_type_name == "JEDI_GROUND_BARRACKS" then
			game_object_type_name = "E_GROUND_BARRACKS"
		end

		if planet:get_owner() == self.player and game_object_type_name == Find_Object_Type(self.ConstructType).Get_Name() then
			self.ConstructCountCurrent = self.ConstructCountCurrent + 1
			if self.ConstructCountCurrent >= self.ConstructAmount then 
				self:Fulfil()
			else
				self:UpdateDisplay()
			end
		end
	end
end

return ConstructMission