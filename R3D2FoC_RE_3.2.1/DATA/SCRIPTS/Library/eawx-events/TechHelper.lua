require("deepcore/std/class")
require("PGSpawnUnits")
StoryUtil = require("eawx-util/StoryUtil")

---@class TechHelper
TechHelper = class()

function TechHelper:new(gc)
	self.helper_fired = false
    self.is_active = false
	self.mediator_fired = false
	
	crossplot:subscribe("NCMP2_TIME_HELPER", self.Late_era, self)
	crossplot:subscribe("NCMP2_HELPER", self.NCMP1, self)
	
	crossplot:subscribe("MEDIATOR_TIME_HELPER", self.Mediator_Time, self)
	crossplot:subscribe("MEDIATOR_HELPER", self.Viscount, self)
end

function TechHelper:Late_era()
	--Logger:trace("entering TechHelper:Late_era")
	if self.helper_fired then
		crossplot:publish("NCMP2_RESEARCH", "empty")
	else
		self.helper_fired = true
	end
end

function TechHelper:NCMP1()
	--Logger:trace("entering TechHelper:NCMP1")
	if not self.helper_fired then
		self.helper_fired = true
		if GlobalValue.Get("CURRENT_ERA") > 3 then
			crossplot:publish("NCMP2_RESEARCH", "empty")
		end
	else
		crossplot:publish("NCMP2_RESEARCH", "empty")
	end
end

function TechHelper:Mediator_Time()
	--Logger:trace("entering TechHelper:Mediator_Time")
	if self.mediator_fired then
		crossplot:publish("MEDIATOR_RESEARCH", "empty")
	else
		self.mediator_fired = true
	end
end

function TechHelper:Viscount()
	--Logger:trace("entering TechHelper:Viscount")
	if not self.mediator_fired then
		self.mediator_fired = true
		if GlobalValue.Get("CURRENT_ERA") > 6 then
			crossplot:publish("MEDIATOR_RESEARCH", "empty")
		end
	else
		crossplot:publish("MEDIATOR_RESEARCH", "empty")
	end
end

return TechHelper
