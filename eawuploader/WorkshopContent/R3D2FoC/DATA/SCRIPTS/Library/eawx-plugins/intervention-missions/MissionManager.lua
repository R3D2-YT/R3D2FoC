require("deepcore/std/class")
require("eawx-plugins/intervention-missions/MissionHandlerHuman")
require("eawx-plugins/intervention-missions/MissionHandlerAI")

---@class MissionManager
MissionManager = class()

function MissionManager:new(gc, id)
	local is_ftgu = false
	
	if id == "FTGU" or id == "CUSTOM" then
		is_ftgu = true
	end

	--local p_hand = Find_Player("EmpireoftheHand")
	local p_hapes = Find_Player("Hapes_Consortium")
	local p_hutts = Find_Player("Hutt_Cartels")
	local p_newrep = Find_Player("Rebel")
	local p_human = Find_Player("local")

	self.human_faction_name = p_human.Get_Name()

	-- if p_hand == p_human then
		-- self.HandMissions = MissionHandlerHuman(gc,p_hand,is_ftgu)
	-- else
		-- self.HandMissions = MissionHandlerAI(gc,p_hand)
	-- end

	if p_hapes == p_human then
		self.HapesMissions = MissionHandlerHuman(gc,p_hapes,is_ftgu)
	-- else
		-- self.HapesMissions = MissionHandlerAI(gc,p_hapes)
	end
	
	if p_hutts == p_human then
		self.HuttMissions = MissionHandlerHuman(gc,p_hutts,is_ftgu)
	-- else
		-- self.HuttMissions = MissionHandlerAI(gc,p_hutts)
	end

	if p_newrep == p_human then
		self.NewRepMissions = MissionHandlerHuman(gc,p_newrep,is_ftgu)
	-- else
		-- self.NewRepMissions = MissionHandlerAI(gc,p_newrep)
	end	
end

function MissionManager:update()
	--Logger:trace("entering MissionManager:Update")
	-- self.HandMissions:update()
	if self.human_faction_name == "Hapes Consortium" then
	self.HapesMissions:update()
	end
	
	if self.human_faction_name == "Hutt Cartels" then	
	self.HuttMissions:update()
	end

	if self.human_faction_name == "New Republic" then
	self.NewRepMissions:update()
	end
end

return MissionManager
