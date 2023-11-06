
if settings.startup["colloquial-transport-belt"].value == "colour" then
    local colours = {
        [""] = "yellow",
        fast = "red",
        express = "blue"
    }

    for _, type in pairs({"transport-belt", "underground-belt", "splitter", "loader"}) do
        for k, colour in pairs(colours) do
            name = (k == "") and type or k .. "-" .. type
            data.raw[type][name].localised_name = {"colloquial."..type.."-colour", {"colloquial." .. colour}}
        end
    end
end

local replacements = {
    circuits = {
        type = "item",
        names = {"electronic-circuit", "advanced-circuit", "processing-unit"}
    },
    modules = {
        type = "module",
        names = {
            "speed-module", "speed-module-2", "speed-module-3",
            "effectivity-module", "effectivity-module-2", "effectivity-module-3",
            "productivity-module", "productivity-module-2", "productivity-module-3",
        }
    },
}

for setting, definition in pairs(replacements) do
    local setting_value = settings.startup["colloquial-"..setting].value
    if setting_value ~= "vanilla" then
        local type = definition.type
        for _, name in pairs(definition.names) do
            assert(data.raw[type][name], type .. " " .. name .. " does not exist in data.raw")
            data.raw[type][name].localised_name = {"colloquial."..name.."-".. setting_value}
        end
    end
end
