--******************************************************************************
--     _______ __
--    |_     _|  |--.----.---.-.--.--.--.-----.-----.
--      |   | |     |   _|  _  |  |  |  |     |__ --|
--      |___| |__|__|__| |___._|________|__|__|_____|
--     ______
--    |   __ \.-----.--.--.-----.-----.-----.-----.
--    |      <|  -__|  |  |  -__|     |  _  |  -__|
--    |___|__||_____|\___/|_____|__|__|___  |_____|
--                                    |_____|
--*   @Author:              [TR]Pox <Pox>
--*   @Date:                2018-01-06T18:36:14+01:00
--*   @Project:             Imperial Civil War
--*   @Filename:            GameObjectLibrary.lua
--*   @Last modified by:    [TR]Pox
--*   @Last modified time:  2018-04-12T00:17:51+02:00
--*   @License:             This source code may only be used with explicit permission from the developers
--*   @Copyright:           © TR: Imperial Civil War Development Team
--******************************************************************************

require("eawx-util/Comparators")

GameObjectLibrary = {
    Interdictors = {
        "Eclipse_Star_Destroyer",
        "Sovereign",
        "Generic_Dominator",
        "Mothma_Star_Destroyer",
		"Generic_Interdictor_Cruiser",
		"Generic_Twin_Well_Cruiser",
		"Super_Transport_VII_Interdictor",
		"Strike_Interdictor",
		"Coronal",
		"Prolipsi",
		"CC7700",
		"CC7700_E",
		"Interdiction_Minefield_Container",
		-- heroes
        "Phulik_Binder",
		"Wellam_Eternal_Wrath",
        "Iillor_Corusca",
        "Kaerobani_Interdictor",
        "Voota_Splendor",
		"Dezon_Constrainer",
		"Lon_Donell_Detainer",
		"Iblis_Bail_Organa",
		"Lovett_Riverlord"
    },
    Numbers = {
        "Display_One",
        "Display_Two",
        "Display_Three",
        "Display_Four",
        "Display_Five",
        "Display_Six",
        "Display_Seven",
        "Display_Eight",
        "Display_Nine",
        "Display_Ten"
    },
    OrbitalStructures = {
        ["HAPAN_SHIPYARD_ROYAL"] = {
            Text = "TEXT_DISPLAY_HAPAN_SHIPYARD_ROYAL",
            Equation = "Planet_Has_Shipyard_Royal"
        },
        ["HAPAN_SHIPYARD_GALNEY"] = {
            Text = "TEXT_DISPLAY_HAPAN_SHIPYARD_GALNEY",
            Equation = "Planet_Has_Shipyard_Galney"
        },
        ["HAPAN_SHIPYARD_CORR"] = {
            Text = "TEXT_DISPLAY_HAPAN_SHIPYARD_CORR",
            Equation = "Planet_Has_Shipyard_Corr"
        },
        ["HAPAN_SHIPYARD_THANE"] = {
            Text = "TEXT_DISPLAY_HAPAN_SHIPYARD_THANE",
            Equation = "Planet_Has_Shipyard_Thane"
        },
        ["HAPAN_SHIPYARD_MALURI"] = {
            Text = "TEXT_DISPLAY_HAPAN_SHIPYARD_MALURI",
            Equation = "Planet_Has_Shipyard_Maluri"
        },
        ["HAPAN_SHIPYARD_ALGRAY"] = {
            Text = "TEXT_DISPLAY_HAPAN_SHIPYARD_ALGRAY",
            Equation = "Planet_Has_Shipyard_AlGray"
        },
        ["HAPAN_SHIPYARD_REQUUD"] = {
            Text = "TEXT_DISPLAY_HAPAN_SHIPYARD_REQUUD",
            Equation = "Planet_Has_Shipyard_Requud"
        },
        ["GENERIC_SHIPYARD_LEVEL_ONE"] = {
            Text = "TEXT_DISPLAY_SHIPYARD1",
            Equation = "Planet_Has_Shipyard_One"
        },
        ["GENERIC_SHIPYARD_LEVEL_TWO"] = {
            Text = "TEXT_DISPLAY_SHIPYARD2",
            Equation = "Planet_Has_Shipyard_Two"
        },
        ["GENERIC_SHIPYARD_LEVEL_THREE"] = {
            Text = "TEXT_DISPLAY_SHIPYARD3",
            Equation = "Planet_Has_Shipyard_Three"
        },
        ["GENERIC_SHIPYARD_LEVEL_FOUR"] = {
            Text = "TEXT_DISPLAY_SHIPYARD4",
            Equation = "Planet_Has_Shipyard_Four"
        },
		["SECONDARY_GOLAN_ONE"] = {
            Text = "TEXT_DISPLAY_GOLAN_ONE_STATION",
            Equation = "Planet_Has_Golan_One"
        },
		["SECONDARY_GOLAN_TWO"] = {
            Text = "TEXT_DISPLAY_GOLAN_TWO_STATION",
            Equation = "Planet_Has_Golan_Two"
        },
        ["SECONDARY_GOLAN_THREE"] = {
            Text = "TEXT_DISPLAY_GOLAN_THREE_STATION",
            Equation = "Planet_Has_Golan_Three"
        },
		["VALOR_STATION"] = {
            Text = "TEXT_DISPLAY_VALOR_STATION",
            Equation = "Planet_Has_Valor"
        },
		["VALIDUSIA"] = {
            Text = "TEXT_DISPLAY_VALIDUSIA",
            Equation = "Planet_Has_Validusia"
        },
        ["EMPRESS_STATION"] = {
            Text = "TEXT_DISPLAY_EMPRESS",
            Equation = "Planet_Has_Empress"
        },
        ["OTO"] = {
            Text = "TEXT_DISPLAY_OTO",
            Equation = "Planet_Has_Oto"
        },
        ["BRASK"] = {
            Text = "TEXT_DISPLAY_BRASK",
            Equation = "Planet_Has_Brask"
        },
        ["VISVIA"] = {
            Text = "TEXT_DISPLAY_VISVIA",
            Equation = "Planet_Has_Visvia"
        },
        ["GENERIC_TRADESTATION"] = {
            Text = "TEXT_DISPLAY_TRADE",
            Equation = "Planet_Has_Trade_Station"
        },
		["GENERIC_COLONY_ONE"] = {
            Text = "TEXT_DISPLAY_COLONY_ONE",
            Equation = "Planet_Has_Colony_One"
        },
		["GENERIC_COLONY_TWO"] = {
            Text = "TEXT_DISPLAY_COLONY_TWO",
            Equation = "Planet_Has_Colony_Two"
        },
		["MERIDIAN_I"] = {
            Text = "TEXT_DISPLAY_MERIDIAN_I",
            Equation = "Planet_Has_Meridian_I"
        },
		["MERIDIAN_II"] = {
            Text = "TEXT_DISPLAY_MERIDIAN_II",
            Equation = "Planet_Has_Meridian_II"
        },
		["MERIDIAN_III"] = {
            Text = "TEXT_DISPLAY_MERIDIAN_III",
            Equation = "Planet_Has_Meridian_III"
        },
		["MERIDIAN_IV"] = {
            Text = "TEXT_DISPLAY_MERIDIAN_IV",
            Equation = "Planet_Has_Meridian_IV"
        },
        ["PIRATE_BASE"] = {
            Text = "TEXT_DISPLAY_PIRATE_BASE",
            Equation = "Planet_Has_Pirate_Base"
        },
        ["RANCOR_BASE"] = {
            Text = "TEXT_DISPLAY_RANCOR_BASE",
            Equation = "Planet_Has_Rancor_Base"
        },
        ["BLACK_15"] = {
            Text = "TEXT_DISPLAY_BLACK15",
            Equation = "Planet_Has_Black_Fifteen"
        },
        ["SLAYN_KORPIL"] = {
            Text = "TEXT_DISPLAY_SLAYN_KORPIL",
            Equation = "Planet_Has_Slayn_Korpil"
        },
        ["CSA_SHIP_MARKET"] = {
            Text = "TEXT_DISPLAY_SHIP_MARKET",
            Equation = "Planet_Has_Ship_Market"
        }
        --  ["CREW_RESOURCE_DUMMY"]={
        --      Text="TEXT_DISPLAY_SLAYN_KORPIL"
        --  },
        --    ["PLACEHOLDER_CATEGORY_DUMMY"]={
        --        Text="TEXT_DISPLAY_PLACEHOLDER_CATEGORY_DUMMY"
        --    },
        --    ["NON_CAPITAL_CATEGORY_DUMMY"]={
        --        Text="TEXT_DISPLAY_NON_CAPITAL_CATEGORY_DUMMY"
        --    },
        --    ["CAPITAL_CATEGORY_DUMMY"]={
        --        Text="TEXT_DISPLAY_CAPITAL_CATEGORY_DUMMY"
        --    },
        --    ["STRUCTURE_CATEGORY_DUMMY"]={
        --        Text="TEXT_DISPLAY_STRUCTURE_CATEGORY_DUMMY"
        --    }
    },
    InfluenceLevels = {
        ["INFLUENCE_ONE"] = {},
        ["INFLUENCE_TWO"] = {},
        ["INFLUENCE_THREE"] = {},
        ["INFLUENCE_FOUR"] = {},
        ["INFLUENCE_FIVE"] = {},
        ["INFLUENCE_SIX"] = {},
        ["INFLUENCE_SEVEN"] = {},
        ["INFLUENCE_EIGHT"] = {},
        ["INFLUENCE_NINE"] = {},
        ["INFLUENCE_TEN"] = {},
        ["BONUS_PLACEHOLDER"] = {}
    },
    Units = require("GameObjectList")  
}
return GameObjectLibrary