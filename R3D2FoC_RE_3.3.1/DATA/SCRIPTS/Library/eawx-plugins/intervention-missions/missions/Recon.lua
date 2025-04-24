require("deepcore/std/class")
require("PGStoryMode")
require("PGSpawnUnits")
StoryUtil = require("eawx-util/StoryUtil")
require("eawx-util/MissionFunctions")

---@class ReconMission
ReconMission = class()

function ReconMission:new(gc, player)

    self.player = player
	
	self.player_is_main_faction = false
	if self.player == Find_Player("Empire") then
		self.player_is_main_faction = true
	elseif self.player == Find_Player("Rebel") then
		self.player_is_main_faction = true
	elseif self.player == Find_Player("Underworld") then
		self.player_is_main_faction = true
	end
	
    self.Dialog = nil
    self.RewardGroupTable = nil

    self.TimeSinceAssigned = 0

    self.Active = false
	self.TimerStart = nil
	self.TimeActive = nil
	self.EndTime = nil
	self.Reward = nil
	self.RewardCount = 0
	self.ReconTarget01 = nil
	self.ReconTarget02 = nil
	self.Recon01Complete = false
	self.Recon02Complete = false
	self.ValidReconTarget02 = true

	self.planet_owner_changed_event = gc.Events.PlanetOwnerChanged
	self.planet_owner_changed_event:attach_listener(self.on_planet_conquered, self)
end

function ReconMission:update()
    --Logger:trace("entering ReconMission:update")
    if self.Active == true then
		self:Fulfil()
        if self.TimeActive ~= nil then
            self.TimeActive = self.TimeActive - 1
            if self.TimeActive == 0 then
                self:Failed()
            end
        end
    end
end

function ReconMission:Begin(reward_group, week_start)
	--Logger:trace("entering ReconMission:Begin")
	if self.Active == true then
		self:Reset()
	end
	local plot = Get_Story_Plot("Conquests\\Events\\MissionRepository_"..self.player.Get_Faction_Name()..".xml")
	self.TimeSinceAssigned = 0

    self.RewardGroupTable = reward_group
	self.Dialog = "DIALOG_INTERVENTION_MASTERFILE_"..self.RewardGroupTable.DialogName

	self.TimerStart = week_start
	self.TimeActive = GameRandom.Free_Random(5, 10)
	self.EndTime = self.TimerStart + self.TimeActive
	self.TimeActive = self.TimeActive + 1

	self.ReconTarget01, self.ReconTarget02 = StoryUtil.FindTargetPlanet(self.player, false, true, 2, false)
	if self.ReconTarget01 then
		if not TestValid(self.ReconTarget02) then
			self.ReconTarget02 = self.ReconTarget01
			self.ValidReconTarget02 = false
		else
			self.ValidReconTarget02 = true
		end

		self.Reward, self.RewardCount = StoryUtil.SelectReward(self.player, self.RewardGroupTable.RewardName, 2)

		self:UpdateDisplay()

		local tag = "RECON"
		crossplot:publish("MISSION_STARTED", tag)

		Story_Event("RECON_ASSIGN")
	else
		self:Reset()
	end
end

function ReconMission:UpdateDisplay()
	--Logger:trace("entering UpdateDisplay:Begin")
	local plot = Get_Story_Plot("Conquests\\Events\\MissionRepository_"..self.player.Get_Faction_Name()..".xml")
	local event = plot.Get_Event("Recon_Planet_01")
	event.Set_Dialog(self.Dialog)
	event.Clear_Dialog_Text()

	if self.player_is_main_faction == true then
		event.Add_Dialog_Text("TEXT_INTERVENTION_RECONNAISSANCE_OBJECTIVE_MAIN_FACTION")
	else
		event.Add_Dialog_Text("TEXT_INTERVENTION_RECONNAISSANCE_OBJECTIVE_SECONDARY_FACTION")
	end

	if self.Recon01Complete == false then
		event.Add_Dialog_Text("TEXT_INTERVENTION_RECONNAISSANCE_LOCATION", self.ReconTarget01)
	else
		event.Add_Dialog_Text("TEXT_INTERVENTION_RECONNAISSANCE_LOCATION_COMPLETE", self.ReconTarget01)
	end	
	if self.ValidReconTarget02 == true then
		if self.Recon02Complete == false then
			event.Add_Dialog_Text("TEXT_INTERVENTION_RECONNAISSANCE_LOCATION", self.ReconTarget02)
		else
			event.Add_Dialog_Text("TEXT_INTERVENTION_RECONNAISSANCE_LOCATION_COMPLETE", self.ReconTarget02)
		end	
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
		local event = plot.Get_Event("Recon_Planet_I_Enter")
		event.Set_Event_Parameter(0, self.ReconTarget01)
		event.Set_Reward_Parameter(1, self.player.Get_Faction_Name())

		local event = plot.Get_Event("Recon_Planet_I_Flash")
		event.Set_Reward_Parameter(0, self.ReconTarget01)

		local event = plot.Get_Event("Recon_Planet_II_Enter")
		event.Set_Event_Parameter(0, self.ReconTarget02)
		event.Set_Reward_Parameter(1, self.player.Get_Faction_Name())

		local event = plot.Get_Event("Recon_Planet_II_Flash")
		event.Set_Reward_Parameter(0, self.ReconTarget02)
	end
	self.Active = true
end

function ReconMission:Fulfil()
	--Logger:trace("entering ReconMission:Fulfil")

	local plot = Get_Story_Plot("Conquests\\Events\\MissionRepository_"..self.player.Get_Faction_Name()..".xml")
	if Check_Story_Flag(self.player, "RECON_I_FULFILLED", nil, true) and self.Recon01Complete == false then
		self.Recon01Complete = true
	end
	if Check_Story_Flag(self.player, "RECON_II_FULFILLED", nil, true) and self.Recon02Complete == false then
		self.Recon02Complete = true
	end

	if self.Recon01Complete == false or self.Recon02Complete == false then
		self:UpdateDisplay()
	else
		local RewardLocation = StoryUtil.FindFriendlyPlanet(self.player)

		if RewardLocation ~= nil then
			for i=1,self.RewardCount do
				SpawnList({self.Reward}, RewardLocation, self.player, true, false)
			end
		else 
			RewardLocation = "(No safe location available; reward not granted)"
		end

		local event = plot.Get_Event("Recon_Planet_02")
		event.Set_Dialog(self.Dialog)
		event.Clear_Dialog_Text()

		if self.player_is_main_faction == true then
			event.Add_Dialog_Text("TEXT_INTERVENTION_RECONNAISSANCE_OBJECTIVE_MAIN_FACTION")
		else
			event.Add_Dialog_Text("TEXT_INTERVENTION_RECONNAISSANCE_OBJECTIVE_SECONDARY_FACTION")
		end

		event.Add_Dialog_Text("TEXT_INTERVENTION_RECONNAISSANCE_LOCATION_COMPLETE", self.ReconTarget01)
		if self.ValidReconTarget02 == true then
			event.Add_Dialog_Text("TEXT_INTERVENTION_RECONNAISSANCE_LOCATION_COMPLETE", self.ReconTarget02)
		end
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

		Story_Event("RECON_COMPLETE")
	end
end

function ReconMission:Failed()
	--Logger:trace("entering ReconMission:Failed")

	local plot = Get_Story_Plot("Conquests\\Events\\MissionRepository_"..self.player.Get_Faction_Name()..".xml")
	local event = plot.Get_Event("Recon_Planet_04")
	event.Set_Dialog(self.Dialog)
	event.Clear_Dialog_Text()

	if self.player_is_main_faction == true then
		event.Add_Dialog_Text("TEXT_INTERVENTION_RECONNAISSANCE_OBJECTIVE_MAIN_FACTION")
	else
		event.Add_Dialog_Text("TEXT_INTERVENTION_RECONNAISSANCE_OBJECTIVE_SECONDARY_FACTION")
	end

	if self.Recon01Complete == false then
		event.Add_Dialog_Text("TEXT_INTERVENTION_RECONNAISSANCE_LOCATION_FAILED", self.ReconTarget01)
	else
		event.Add_Dialog_Text("TEXT_INTERVENTION_RECONNAISSANCE_LOCATION_COMPLETE", self.ReconTarget01)
	end
	if self.ValidReconTarget02 == true then
		if self.Recon02Complete == false then
			event.Add_Dialog_Text("TEXT_INTERVENTION_RECONNAISSANCE_LOCATION_FAILED", self.ReconTarget02)
		else
			event.Add_Dialog_Text("TEXT_INTERVENTION_RECONNAISSANCE_LOCATION_COMPLETE", self.ReconTarget02)
		end
	end
	event.Add_Dialog_Text("TEXT_NONE")

	event.Add_Dialog_Text("TEXT_INTERVENTION_TIMER_START", self.TimerStart)
	event.Add_Dialog_Text("TEXT_INTERVENTION_TIMER_END", self.EndTime)

	if self.RewardGroupTable.GroupSupport then
		crossplot:publish("INCREASE_FAVOUR" , self.RewardGroupTable.GroupSupport, (0 - self.RewardGroupTable.SupportArg))
	end

    self:Reset()

	Story_Event("RECON_FAILED")
end

function ReconMission:Reset()
    --Logger:trace("entering ReconMission:Reset")
    self.Active = false
	self.Dialog = nil
	self.TimerStart = nil
	self.TimeActive = nil
	self.EndTime = nil
	self.Reward = nil
	self.RewardCount = 0
	self.ReconTarget01 = nil
	self.ReconTarget02 = nil
	self.Recon01Complete = false
	self.Recon02Complete = false
	self.ValidReconTarget02 = true

	local tag = "RECON"
	crossplot:publish("MISSION_COMPLETE", tag)
end

function ReconMission:on_planet_conquered(planet, new_owner_name, old_owner_name)
	if planet:get_owner() ~= self.player then 
		return
	else
		--Logger:trace("entering ReconMission:on_planet_conquered")
		if self.Active == true then
			if planet:get_game_object() == self.ReconTarget01 and self.Recon01Complete == false then
				self.Recon01Complete = true
			end
			if planet:get_game_object() == self.ReconTarget02 and self.Recon02Complete == false then
				self.Recon02Complete = true
			end
			self:Fulfil()
		end
	end
end

return ReconMission