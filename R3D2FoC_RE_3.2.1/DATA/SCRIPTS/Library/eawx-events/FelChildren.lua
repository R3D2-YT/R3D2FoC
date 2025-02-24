require("deepcore/std/class")
require("SetFighterResearch")
StoryUtil = require("eawx-util/StoryUtil")

---@class FelChildren
FelChildren = class()

function FelChildren:new(gc)
    self.p_eoth = Find_Player("EmpireoftheHand")

    crossplot:subscribe("CHECK_ELIGIBILITY_FEL_CHILDREN", self.check_eligibility, self)
	
	self.FelChildrenData = {
		["CHAK_FEL"] = {
			active = false,
			first_year = 19,
			first_month = 7,
			hero_squadron = "CHAK_FEL_SQUADRON",
			default_host = "SIATH_BATTLEHAMMER",
			unlock_tech_name = "CHAK_FEL_LOCATION_SET",
		},
		["JAGGED_FEL"] = {
			active = false,
			first_year = 23,
			first_month = 3,
			hero_squadron = "JAGGED_FEL_SQUADRON",
			default_host = "STENT_THRAWNS_HAND",
			unlock_tech_name = "JAGGED_FEL_LOCATION_SET",
		},
	}
end

function FelChildren:check_eligibility()
    --Logger:trace("entering FelChildren:check_eligibility")

	if GlobalValue.Get("REGIME_INDEX") == 1 then
		return
	end

	local FelChildrenPending = {}

	for name,data in pairs(self.FelChildrenData) do
		if self.FelChildrenData[name].active == false then
			table.insert(FelChildrenPending,name)
		end
	end

	if table.getn(FelChildrenPending) == 0 then
		return
	end

	local current_year = GlobalValue.Get("GALACTIC_YEAR")
	local current_month = GlobalValue.Get("GALACTIC_MONTH")

	for i,name in pairs(FelChildrenPending) do
		if current_year < self.FelChildrenData[name].first_year or (current_year == self.FelChildrenData[name].first_year and current_month < self.FelChildrenData[name].first_month) then
			table.remove(FelChildrenPending,i)
		end
	end

	if table.getn(FelChildrenPending) == 0 then
		return
	end

	for i,name in pairs(FelChildrenPending) do
		self.FelChildrenData[name].active = true

		if Get_Fighter_Hero(self.FelChildrenData[name].hero_squadron) ~= nil then
			return
		end

		Set_To_First_Extant_Host(self.FelChildrenData[name].unlock_tech_name, self.p_eoth)
		self.p_eoth.Unlock_Tech(Find_Object_Type(self.FelChildrenData[name].unlock_tech_name))
		
		if self.p_eoth == Find_Player("local") then
			child_name = Find_Object_Type(self.FelChildrenData[name].hero_squadron).Get_Name()
			StoryUtil.ShowScreenText("%s has come of age.", 10, child_name, {r = 244, g = 244, b = 0})
		end
	end
end

return FelChildren
