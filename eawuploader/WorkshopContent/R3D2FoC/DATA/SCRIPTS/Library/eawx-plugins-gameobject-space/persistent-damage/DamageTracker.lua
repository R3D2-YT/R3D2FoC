require("PGBase")
require("deepcore/std/class")
StoryUtil = require("eawx-util/StoryUtil")

---@class DamageTracker
DamageTracker = class()

function DamageTracker:new()
        self.object_id = tostring(Object.Get_Type().Get_Name()).."_"..tostring(Object.Get_Owner().Get_Faction_Name())

        if GlobalValue.Get(self.object_id) then
                if GlobalValue.Get(self.object_id) > 0.89 then
                        GlobalValue.Set(self.object_id, 1.0)
                end

                local unit_info = require("hardpoint-lists/"..tostring(Object.Get_Type().Get_Name()))


                local percent = (1 - GlobalValue.Get(self.object_id))

                local total_damage = (percent * (unit_info[1]))
                local hardpoint_health = unit_info[2]
                local damage_done = 0
                local hardpoint_list = unit_info[3]


                for i, hardpoint in pairs(hardpoint_list) do
                        if damage_done < total_damage then
                                Object.Take_Damage(10000, hardpoint)
                                damage_done = damage_done + hardpoint_health
                        end                
                end
				
				Sleep(5)
				local big = false
				local small = false
				if percent <= 0.10 then
					big = false --No regen if no damage was applied
				elseif percent <= 0.17 then
					big = true
					small = true
				elseif percent <= 0.50 then
					big = true
				elseif percent <= 0.84 then
					small = true
				end
				
				if big then
					Spawn_Unit(Find_Object_Type("PERSISTENT_DAMAGE_SHIELD_HEAL"), Object.Get_Bone_Position("root"), Object.Get_Owner(), true, false)
				end
				
				if small then
					Spawn_Unit(Find_Object_Type("PERSISTENT_DAMAGE_SHIELD_HEAL_LIGHT"), Object.Get_Bone_Position("root"), Object.Get_Owner(), true, false)
				end
        end
end

function DamageTracker:update()

        if Object.Get_Hull() < 0.9 then
                GlobalValue.Set(self.object_id, Object.Get_Hull())
        else
                GlobalValue.Set(self.object_id, 1.0)
        end
   
end

return DamageTracker
