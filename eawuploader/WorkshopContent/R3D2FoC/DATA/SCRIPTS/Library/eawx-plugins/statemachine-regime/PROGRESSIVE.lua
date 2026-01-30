require("deepcore/statemachine/DeepCoreState")

---@param dsl dsl
return function(dsl)
    local policy = dsl.policy
    local effect = dsl.effect
    local owned_by = dsl.conditions.owned_by

    local initialize = DeepCoreState.with_empty_policy()
    local setup = DeepCoreState(require("eawx-states/regimes/regime-setup-state"))
    local pestage = DeepCoreState(require("eawx-states/regimes/regime-pestage"))
    local isard = DeepCoreState(require("eawx-states/regimes/regime-isard"))
    local ccogm = DeepCoreState(require("eawx-states/regimes/regime-ccogm"))
    local thrawn = DeepCoreState(require("eawx-states/regimes/regime-thrawn"))
    local interregnum = DeepCoreState(require("eawx-states/regimes/regime-interregnum"))
    local palpatine = DeepCoreState(require("eawx-states/regimes/regime-palpatine"))
    local carnor = DeepCoreState(require("eawx-states/regimes/regime-carnor"))
    local daala = DeepCoreState(require("eawx-states/regimes/regime-daala"))
    local pellaeon = DeepCoreState(require("eawx-states/regimes/regime-pellaeon"))

    -- Initial setup

    dsl.transition(initialize)
        :to(setup)
        :when(policy:timed(3))
        :end_()
    dsl.transition(setup)
        :to(pestage)
        :when(policy:global_era(1))
        :end_()
    dsl.transition(setup)
        :to(isard)
        :when(policy:global_era(2))
        :end_()
    dsl.transition(setup)
        :to(thrawn)
        :when(policy:global_era(3))
        :end_()
    dsl.transition(setup)
        :to(palpatine)
        :when(policy:global_era(4))
        :end_()
    dsl.transition(setup)
        :to(carnor)
        :when(policy:global_era(5))
        :end_()
    dsl.transition(setup)
        :to(daala)
        :when(policy:global_era(6))
        :end_()
    dsl.transition(setup)
        :to(pellaeon)
        :when(policy:global_era(7))
        :end_()


    -- Exiting Pestage

    dsl.transition(pestage)
        :to(isard)
        :when(policy:hero_dies("Pestage_Team"))
        :with_effects(
            effect:transfer_planets("KESSEL")
            :to_owner("Warlords")
            :if_(owned_by("Empire")),
            effect:transfer_planets("KALIST", "ABREGADO_RAE")
            :to_owner("Warlords")
            :if_(owned_by("Empire"))
        ):end_()
    dsl.transition(pestage)
        :to(isard)
        :when(policy:planet_lost("CORUSCANT"))
        :with_effects(
            effect:transfer_planets("KESSEL")
            :to_owner("Warlords")
            :if_(owned_by("Empire")),
            effect:transfer_planets("KALIST", "ABREGADO_RAE")
            :to_owner("Warlords")
            :if_(owned_by("Empire"))
        ):end_()
    dsl.transition(pestage)
        :to(isard)
        :when(policy:object_constructed("Project_Ambition_Dummy"))
        :end_()
    dsl.transition(pestage)
        :to(ccogm)
        :when(policy:object_constructed("Dummy_Regicide_CCoGM"))
        :with_effects(
			effect:transfer_planets("THYFERRA")
            :to_owner("Warlords")
            :if_(owned_by("Empire"))
        ):end_()

    -- Exiting Isard

    dsl.transition(isard)
        :to(thrawn)
        :when(policy:hero_dies("Ysanne_Isard_Team"))
        :end_()
	dsl.transition(isard)
        :to(thrawn)
        :when(policy:hero_dies("Isard_Lusankya"))
        :end_()
    dsl.transition(isard)
        :to(thrawn)
        :when(policy:object_constructed("Dummy_Regicide_Thrawn"))
        :end_()
    dsl.transition(ccogm)
        :to(thrawn)
        :when(policy:hero_dies("Hissa_Moffship"))
        :end_()
    dsl.transition(ccogm)
        :to(thrawn)
        :when(policy:object_constructed("Dummy_Regicide_Thrawn"))
        :end_()


    --Exiting Thrawn
   
    dsl.transition(thrawn)
        :to(interregnum)
        :when(policy:hero_dies("Thrawn_Chimaera"))
        :with_effects(
            effect:transfer_planets("CIUTRIC", "VROSYNRI", "CORVIS_MINOR")
            :to_owner("Warlords")
            :if_(owned_by("Empire"))
        ):end_()

    -- Entering Dark Empire

    dsl.transition(pestage)
        :to(palpatine)
        :when(policy:crossplot_trigger("DARK_EMPIRE_TRIGGER"))
        :with_effects(
            effect:eawx_set_tech_level(2)
            :for_factions({"Rebel", "Empire", "Pentastar", "Eriadu_Authority", "Zsinj_Empire", "Greater_Maldrood", "EmpireoftheHand", "Corporate_Sector", "Hapes_Consortium", "Hutt_Cartels"})
        ):end_()

    dsl.transition(isard)
        :to(palpatine)
        :when(policy:crossplot_trigger("DARK_EMPIRE_TRIGGER"))
        :with_effects(
            effect:eawx_set_tech_level(2)
            :for_factions({"Rebel", "Empire", "Pentastar", "Eriadu_Authority", "Zsinj_Empire", "Greater_Maldrood", "EmpireoftheHand", "Corporate_Sector", "Hapes_Consortium", "Hutt_Cartels"})
        ):end_()

    dsl.transition(ccogm)
        :to(palpatine)
        :when(policy:crossplot_trigger("DARK_EMPIRE_TRIGGER"))
        :with_effects(
            effect:eawx_set_tech_level(2)
            :for_factions({"Rebel", "Empire", "Pentastar", "Eriadu_Authority", "Zsinj_Empire", "Greater_Maldrood", "EmpireoftheHand", "Corporate_Sector", "Hapes_Consortium", "Hutt_Cartels"})
        ):end_()

    dsl.transition(thrawn)
        :to(palpatine)
        :when(policy:crossplot_trigger("DARK_EMPIRE_TRIGGER"))
        :with_effects(
            effect:eawx_set_tech_level(2)
            :for_factions({"Rebel", "Empire", "Pentastar", "Eriadu_Authority", "Zsinj_Empire", "Greater_Maldrood", "EmpireoftheHand", "Corporate_Sector", "Hapes_Consortium", "Hutt_Cartels"})
        ):end_()
   
    dsl.transition(interregnum)
        :to(palpatine)
        :when(policy:crossplot_trigger("DARK_EMPIRE_TRIGGER"))
        :with_effects(
            effect:eawx_set_tech_level(2)
            :for_factions({"Rebel", "Empire", "Pentastar", "Eriadu_Authority", "Zsinj_Empire", "Greater_Maldrood", "EmpireoftheHand", "Corporate_Sector", "Hapes_Consortium", "Hutt_Cartels"})
        ):end_()

    -- Exiting Dark Empire

    dsl.transition(palpatine)
        :to(carnor)
        :when(policy:object_constructed("DUMMY_REGICIDE_JAX"))
        :end_()
    dsl.transition(palpatine)
        :to(carnor)
        :when(policy:hero_dies("Emperor_Palpatine_Team"))
        :end_()
	dsl.transition(palpatine)
        :to(carnor)
        :when(policy:hero_dies("Dark_Empire_Cloning_Facility"))
        :end_()

    -- Exiting Carnor

    dsl.transition(carnor)
        :to(daala)
        :when(policy:hero_dies("Carnor_Jax_Team"))
        :with_effects(
            effect:eawx_set_tech_level(3)
            :for_factions({"Rebel", "Empire", "Pentastar", "Eriadu_Authority", "Zsinj_Empire", "Greater_Maldrood", "EmpireoftheHand", "Corporate_Sector", "Hapes_Consortium", "Hutt_Cartels"})
        ):end_()
    dsl.transition(carnor)
        :to(daala)
        :when(policy:object_constructed("Dummy_Regicide_Daala"))
        :with_effects(
            effect:eawx_set_tech_level(3)
            :for_factions({"Rebel", "Empire", "Pentastar", "Eriadu_Authority", "Zsinj_Empire", "Greater_Maldrood", "EmpireoftheHand", "Corporate_Sector", "Hapes_Consortium", "Hutt_Cartels"})
        ):end_()

    -- Exiting Daala

    dsl.transition(daala)
        :to(pellaeon)
        :when(policy:hero_dies("Daala_Gorgon"))
        :end_()
	dsl.transition(daala)
        :to(pellaeon)
        :when(policy:hero_dies("Daala_Knight_Hammer"))
        :end_()
    dsl.transition(daala)
        :to(pellaeon)
        :when(policy:object_constructed("Dummy_Regicide_Pellaeon"))
        :end_()

    return initialize
end
