return {
    on_enter = function(self, state_context)

        GlobalValue.Set("CURRENT_ERA", 3)
		
		self.entry_time = GetCurrentTime()

    end,
    on_update = function(self, state_context)
		local current = GetCurrentTime() - self.entry_time
        if (current <=5) then
			UnitUtil.SetLockList("REBEL", {
				"Republic_SD",
				"Corona",
				"Belarus",
				"Sacheen",
				"Hajen"
			})
			UnitUtil.SetLockList("REBEL", {
				"Nebulon_B_Frigate",
				"Nebulon_B_Tender",
				"Wedge_Lusankya"
			}, false)
        end
    end,
    on_exit = function(self, state_context)
    end
}