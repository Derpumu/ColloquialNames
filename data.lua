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
    wire = { item = { "copper-cable" } },
    gear = { item = { "iron-gear-wheel" } },
    steel = { item = { "steel-plate" } },
    circuits = {
        item = { "electronic-circuit", "advanced-circuit", "processing-unit" }
    },
    ["military-science"] = {
        tool = { "military-science-pack" },
    },
    ["space-science"] = { tool = { "space-science-pack" } },
    ["science"] = {
        tool = { "automation-science-pack", "logistic-science-pack", "chemical-science-pack", "production-science-pack", "utility-science-pack" },
    },
    abbrev = {
        gun = { "submachine-gun" },
        item = { "low-density-structure", "rocket-control-unit" }
    },
    assemblers = {
        ["assembling-machine"] = { "assembling-machine-1", "assembling-machine-2", "assembling-machine-3" }
    },
    miners = {
        ["mining-drill"] = { "burner-mining-drill", "electric-mining-drill" }
    },
    modules = {
        module = {
            "speed-module", "speed-module-2", "speed-module-3",
            "effectivity-module", "effectivity-module-2", "effectivity-module-3",
            "productivity-module", "productivity-module-2", "productivity-module-3",
        }
    },
    ["power-pole"] = {
        ["electric-pole"] = { "small-electric-pole", "medium-electric-pole", "big-electric-pole" }
    },
    nuke = { ammo = { "atomic-bomb" } },
    fish = { capsule = { "raw-fish" } },
}

for setting, definition in pairs(replacements) do
    local setting_value = settings.startup["colloquial-" .. setting].value
    if setting_value ~= "vanilla" then
        for type, names in pairs(definition) do
            for _, name in pairs(names) do
                localised_name = { "colloquial." .. name .. "-" .. setting_value }
                if data.raw[type] and data.raw[type][name] then
                    data.raw[type][name].localised_name = localised_name
                    if type ~= "technology" and data.raw.technology[name] then
                        data.raw.technology[name].localised_name = localised_name
                    end
                end
            end
        end
    end
end
