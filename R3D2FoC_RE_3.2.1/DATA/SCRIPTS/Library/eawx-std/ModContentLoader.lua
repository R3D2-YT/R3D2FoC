ModContentLoader = {}
ModContentLoader.mods = {
	"rev",
    "fotr",
    "icw"
}

ModContentLoader.mod_id = nil

function ModContentLoader.get_mod_id()
    if ModContentLoader.mod_id then
        return ModContentLoader.mod_id
    end

    local mod_id_dummy
    for _, mod_id in ipairs(ModContentLoader.mods) do
        mod_id_dummy = Find_Object_Type(mod_id)
        if mod_id_dummy then
            ModContentLoader.mod_id = mod_id
            break
        end
    end

    return ModContentLoader.mod_id
end

function ModContentLoader.get(script)
    return require(ModContentLoader.get_mod_specific_path() .. "/" .. script)
end

function ModContentLoader.get_object_script(game_object_type_name)
    if GameObjectLibrary.Units[game_object_type_name] == true then
        object = require(ModContentLoader.get_mod_specific_path() .. "/gameobjects/" .. game_object_type_name)
		if object.Flags then
			if object.Flags.FULLINHERIT ~= nil then
				if GameObjectLibrary.Units[object.Flags.FULLINHERIT] == true then
					object = require(ModContentLoader.get_mod_specific_path() .. "/gameobjects/" .. object.Flags.FULLINHERIT)
				end
			elseif object.Flags.FIGHTERLESSINHERIT ~= nil then
				if GameObjectLibrary.Units[object.Flags.FIGHTERLESSINHERIT] == true then
					inheritEntry = require(ModContentLoader.get_mod_specific_path() .. "/gameobjects/" .. object.Flags.FIGHTERLESSINHERIT)
				end
				object.Ship_Crew_Requirement = inheritEntry.Ship_Crew_Requirement
				object.Flags = inheritEntry.Flags
				object.Scripts = inheritEntry.Scripts
			end
		end
		return object
    else
        return nil
    end
end

function ModContentLoader.get_mod_specific_path()
    if not ModContentLoader.mod_id then
        ModContentLoader.mod_id = GlobalValue.Get("MOD_ID")
    end

    local lower_mod_id = string.lower(ModContentLoader.mod_id)
    return "eawx-mod-" .. lower_mod_id
end

return ModContentLoader