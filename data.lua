--[[
 Burner mining drills are "burner drills" or "burner miner"
 electric mining drills are "miners" or "mining drills" or "electric miner"

 electric poles "power poles" or just "poles", like "small poles" or "medium power poles".

 Raw fish is definitely just fish

 Atomic bombs are nukes

 LDS, RCU, SMG
]]--

-- replacement: setting-name -> list of definitions
-- definition: type -> list of affected names
local replacements = {
    ["transport-belt"] = {
        ["transport-belt"] = { "transport-belt", "fast-transport-belt", "express-transport-belt" },
        ["splitter"] = { "splitter", "fast-splitter", "express-splitter" },
        ["underground-belt"] = { "underground-belt", "fast-underground-belt", "express-underground-belt" },
        ["loader"] = { "loader", "fast-loader", "express-loader" },
    },
    ["underground-pipe"] = { ["pipe-to-ground"] = { "pipe-to-ground" } },
    wire = { item = {"copper-cable"} },
    gear = { item = {"iron-gear-wheel"} },
    circuits = {
        item = { "electronic-circuit", "advanced-circuit", "processing-unit" }
    },
    ["military-science"] = { tool = { "military-science-pack" } },
    ["space-science"] = { tool = { "space-science-pack" } },
    ["science"] = {
        tool = { "automation-science-pack", "logistic-science-pack", "chemical-science-pack", "production-science-pack", "utility-science-pack" }
    },
    assemblers = {
        ["assembling-machine"] = { "assembling-machine-1", "assembling-machine-2", "assembling-machine-3" }
    },
    modules = {
        module = {
            "speed-module", "speed-module-2", "speed-module-3",
            "effectivity-module", "effectivity-module-2", "effectivity-module-3",
            "productivity-module", "productivity-module-2", "productivity-module-3",
        }
    },
}

for setting, definition in pairs(replacements) do
    local setting_value = settings.startup["colloquial-" .. setting].value
    if setting_value ~= "vanilla" then
        for type, names in pairs(definition) do
            for _, name in pairs(names) do
                if data.raw[type] and data.raw[type][name] then
                    data.raw[type][name].localised_name = { "colloquial." .. name .. "-" .. setting_value }
                end
            end
        end
    end
end
