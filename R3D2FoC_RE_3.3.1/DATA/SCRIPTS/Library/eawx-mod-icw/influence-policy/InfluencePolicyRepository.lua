InfluencePolicyRepository = {
    DEFAULT = function(planet)
        local chief_of_state = GlobalValue.Get("ChiefOfState")
        if planet:get_owner() == Find_Player("Rebel") and chief_of_state == "DUMMY_CHIEFOFSTATE_LEIA" then
            return 1
        end

        return 0
    end
}

---@param planet Planet
function InfluencePolicyRepository.chandrila(planet)
    local chief_of_state = GlobalValue.Get("ChiefOfState")
	if planet:get_owner() == Find_Player("Rebel") then
		if chief_of_state ==  "DUMMY_CHIEFOFSTATE_MOTHMA" then
			return 10
		end
		
		if chief_of_state == "DUMMY_CHIEFOFSTATE_LEIA" then
            return 1
        end
	end

    return 0
end

---@param planet Planet
function InfluencePolicyRepository.bothawui(planet)
    local chief_of_state = GlobalValue.Get("ChiefOfState")	
	if planet:get_owner() == Find_Player("Rebel") then
		if chief_of_state ==  "DUMMY_CHIEFOFSTATE_FEYLYA" then
			return 10
		end
		
		if chief_of_state == "DUMMY_CHIEFOFSTATE_LEIA" then
            return 1
        end
	end

    return 0
end

---@param planet Planet
function InfluencePolicyRepository.sullust(planet)
    local chief_of_state = GlobalValue.Get("ChiefOfState")	
	if planet:get_owner() == Find_Player("Rebel") then
		if chief_of_state ==  "DUMMY_CHIEFOFSTATE_TEVV" then
			return 10
		end
		
		if chief_of_state == "DUMMY_CHIEFOFSTATE_LEIA" then
            return 1
        end
	end

    return 0
end

---@param planet Planet
function InfluencePolicyRepository.duro(planet)
    local chief_of_state = GlobalValue.Get("ChiefOfState")	
	if planet:get_owner() == Find_Player("Rebel") then
		if chief_of_state ==  "DUMMY_CHIEFOFSTATE_SOBILLES" then
			return 10
		end
		
		if chief_of_state == "DUMMY_CHIEFOFSTATE_LEIA" then
            return 1
        end
	end

    return 0
end

---@param planet Planet
function InfluencePolicyRepository.rodia(planet)
    local chief_of_state = GlobalValue.Get("ChiefOfState")
	if planet:get_owner() == Find_Player("Rebel") then
		if chief_of_state ==  "DUMMY_CHIEFOFSTATE_NAVIK" then
			return 10
		end
		
		if chief_of_state == "DUMMY_CHIEFOFSTATE_LEIA" then
            return 1
        end
	end

    return 0
end

---@param planet Planet
function InfluencePolicyRepository.kashyyyk(planet)
    if planet:get_owner() ~= Find_Player("Rebel") then
        return -2
    end

    return 0
end

---@param planet Planet
function InfluencePolicyRepository.kuat(planet)
    local chief_of_state = GlobalValue.Get("ChiefOfState")	
	if planet:get_owner() == Find_Player("Rebel") then
		if chief_of_state ==  "DUMMY_CHIEFOFSTATE_SHESH" then
			return 10
		end
		
		if chief_of_state == "DUMMY_CHIEFOFSTATE_LEIA" then
            return 1
        end
	end

    return 0
end

