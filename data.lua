local replacements = {
    ["transport-belt"] = {
        ["transport-belt"] = { "transport-belt", "fast-transport-belt", "express-transport-belt" },
        ["splitter"] = { "splitter", "fast-splitter", "express-splitter" },
        ["underground-belt"] = { "underground-belt", "fast-underground-belt", "express-underground-belt" },
        ["loader"] = { "loader", "fast-loader", "express-loader" },
    },
    circuits = {
        item = { "electronic-circuit", "advanced-circuit", "processing-unit" }
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
