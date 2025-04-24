require("PGStoryMode")
require("deepcore/crossplot/crossplot")

function Definitions()

    DebugMessage("%s -- In Definitions", tostring(Script))
    StoryModeEvents = {
		Delayed_Initialize = Initialize
	}
	
end		

function Initialize(message)
    if message == OnEnter then
		crossplot:galactic()
		p_newrep = Find_Player("Rebel")
		if p_newrep.Is_Human() then
			crossplot:publish("NR_ADMIRAL_DECREMENT", {3,2,0}, 0)
			crossplot:publish("NR_ADMIRAL_DECREMENT", {1,1,1}, 0, true)
		end
		crossplot:publish("INITIALIZE_AI", "empty")
	else
		crossplot:update()
    end
end
