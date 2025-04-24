return {
    on_enter = function(self, state_context)

        GlobalValue.Set("CURRENT_ERA", 6)
		
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
				"Hajen",
				"Agave_Corvette",
				"Warrior_Gunship",
				"Majestic",
				"Defender_Carrier",
				"Nebula",
				"Endurance"
			})
			UnitUtil.SetLockList("REBEL", {
				"Nebulon_B_Frigate",
				"Nebulon_B_Tender",
				"Corellian_Corvette",
				"Corellian_Gunboat",
				"Quasar",
				"Liberator_Cruiser",
				"Wedge_Lusankya"
			}, false)
			UnitUtil.SetLockList("ZSINJ_EMPIRE", {
				"Corona"
			})
			UnitUtil.SetLockList("ZSINJ_EMPIRE", {
				"Nebulon_B_Zsinj"
			}, false)
        end
    end,
    on_exit = function(self, state_context)
    end
}