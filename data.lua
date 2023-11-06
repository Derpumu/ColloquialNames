
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

if settings.startup["colloquial-circuits"].value ~= "vanilla" then
    for _, name in pairs({"electronic-circuit", "advanced-circuit", "processing-unit"}) do
        data.raw.item[name].localised_name = {"colloquial."..name.."-".. settings.startup["colloquial-circuits"].value}
    end
end