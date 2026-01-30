require("deepcore/std/class")
require("PGStoryMode")
require("PGSpawnUnits")
StoryUtil = require("eawx-util/StoryUtil")
require("eawx-util/MissionFunctions")

require("eawx-plugins/intervention-missions/missions/Accumulate")
require("eawx-plugins/intervention-missions/missions/CargoConvoy")
require("eawx-plugins/intervention-missions/missions/Conquer")
require("eawx-plugins/intervention-missions/missions/Construct")
require("eawx-plugins/intervention-missions/missions/CrewRecruitment")
require("eawx-plugins/intervention-missions/missions/HeroConvoy")
require("eawx-plugins/intervention-missions/missions/InfrastructureExpansion")
require("eawx-plugins/intervention-missions/missions/Liberate")
require("eawx-plugins/intervention-missions/missions/RaiseInfluence")
require("eawx-plugins/intervention-missions/missions/Recon")
require("eawx-plugins/intervention-missions/missions/Upgrade")

---@class MissionHandlerHuman
MissionHandlerHuman = class()

function MissionHandlerHuman:new(gc, player, is_ftgu)
	self.player = player
	self.is_ftgu = is_ftgu

	self.potential_targets = {}

	self.CurrentTime = 0
	self.ActiveMissions = 0
	self.TimeSinceAssigned = 0

	self.era = GlobalValue.Get("CURRENT_ERA")
	
	FactionTable = require("eawx-plugins/intervention-missions/factions/FactionTables_"..player.Get_Faction_Name())

	self.RewardGroups = FactionTable.RewardGroups
	self.RewardGroupDetails = FactionTable.RewardGroupDetails
	self.Missions = FactionTable.Missions

	self.AccumulateMission = AccumulateMission(gc, self.player)
	self.CargoConvoyMission = CargoConvoyMission(gc, self.player, self.is_ftgu)
	self.ConquerMission = ConquerMission(gc, self.player)
	self.ConstructMission = ConstructMission(gc, self.player)
	self.CrewRecruitmentMission = CrewRecruitmentMission(gc, self.player)
	self.HeroConvoyMission = HeroConvoyMission(gc, self.player, self.is_ftgu)
	self.InfrastructureExpansionMission = InfrastructureExpansionMission(gc, self.player)
	self.LiberateMission = LiberateMission(gc, self.player, self.is_ftgu)
--	self.RaiseInfluenceMission = RaiseInfluenceMission(gc, self.player)
	self.ReconMission = ReconMission(gc, self.player)
	self.UpgradeMission = UpgradeMission(gc, self.player)

	crossplot:subscribe("MISSION_STARTED", self.mission_increment, self)
	crossplot:subscribe("MISSION_COMPLETE", self.mission_decrement, self)
end

function MissionHandlerHuman:update()
	--Logger:trace("entering MissionHandlerHuman:Update")
	self.CurrentTime = self.CurrentTime + 1

	if EvaluatePerception("Planet_Ownership", self.player) == 0 then
		return
	end

	self.TimeSinceAssigned = self.TimeSinceAssigned + 1

	if self.TimeSinceAssigned >= 4 then
		self.TimeSinceAssigned = 0
		if self.ActiveMissions <= 3 then
			self:AssignNewMission()
		end
	end

	self.AccumulateMission:update()
	self.CargoConvoyMission:update()
	self.ConquerMission:update()
	self.ConstructMission:update()
	self.CrewRecruitmentMission:update()
	self.HeroConvoyMission:update()
	self.InfrastructureExpansionMission:update()
	self.LiberateMission:update()
--	self.RaiseInfluenceMission:update()
	self.ReconMission:update()
	self.UpgradeMission:update()
	--self.RiotMission:update()
	--self.SabotageMission:update()
	--self.AssassinationMission:update()
	--self.PrisonerRescueMission:update()
	--self.ExfiltrationMission:update()
end

function MissionHandlerHuman:AssignNewMission()
	local RewardGamble
	local RunningTotal = 0
	local NewMissionName = nil
	local loop_escaper = 0

	repeat
		RewardGamble = GameRandom.Free_Random(1, 100)
		for mission_name,mission_attributes in pairs(self.Missions) do
			RunningTotal = RunningTotal + mission_attributes.chance

			if RewardGamble <= RunningTotal then
				if mission_attributes.active == false then
					NewMissionName = mission_name
				end
				break
			end
		end
		loop_escaper = loop_escaper + 1
	until NewMissionName ~= nil or loop_escaper == 25

	if NewMissionName == nil then
		return
	end

	local reward_group = self:determine_group()

	self.Missions[NewMissionName].active = true

	if NewMissionName == "ACCUMULATE" then
		self.AccumulateMission:Begin(reward_group, self.CurrentTime)
	elseif NewMissionName == "CARGO_CONVOY" then
		self.CargoConvoyMission:Begin(reward_group, self.CurrentTime)
	elseif NewMissionName == "CONQUER" then
		self.ConquerMission:Begin(reward_group, self.CurrentTime)		
	elseif NewMissionName == "CONSTRUCT" then
		self.ConstructMission:Begin(reward_group, self.CurrentTime)
	elseif NewMissionName == "CREW_RECRUITMENT" then
		self.CrewRecruitmentMission:Begin(reward_group, self.CurrentTime)
	elseif NewMissionName == "HERO_CONVOY" then
		self.HeroConvoyMission:Begin(reward_group, self.CurrentTime)
	elseif NewMissionName == "INFRASTRUCTURE_EXPANSION" then
		self.InfrastructureExpansionMission:Begin(reward_group, self.CurrentTime)
	elseif NewMissionName == "LIBERATE" then
		self.LiberateMission:Begin(reward_group, self.CurrentTime)
--	elseif NewMissionName == "RAISE_INFLUENCE" then
--		self.RaiseInfluenceMission:Begin(reward_group, self.CurrentTime)
	elseif NewMissionName == "RECON" then
		self.ReconMission:Begin(reward_group, self.CurrentTime)
	elseif NewMissionName == "UPGRADE" then
		self.UpgradeMission:Begin(reward_group, self.CurrentTime)
	end
end

function MissionHandlerHuman:determine_group()
	local FactionIndex = GameRandom.Free_Random(1, table.getn(self.RewardGroups))
	local faction_info = self.RewardGroups[FactionIndex]

	local reward_group = self.RewardGroupDetails[faction_info]

	return reward_group
end

function MissionHandlerHuman:mission_increment(tag)
	--Logger:trace("entering MissionHandlerHuman:mission_increment")
	self.ActiveMissions = self.ActiveMissions + 1
	self.Missions[tag].active = true
end

function MissionHandlerHuman:mission_decrement(tag)
	--Logger:trace("entering MissionHandlerHuman:mission_decrement")
	self.ActiveMissions = self.ActiveMissions - 1
	self.Missions[tag].active = false
end

return MissionHandlerHuman
