local count = 0
local function make_setting(name, values)
    count = count + 1
    if values[1] ~= "vanilla" then
        table.insert(values, "vanilla")
    end
    return  {
        type = "string-setting",
        name = "colloquial-" .. name,
        order = string.format("%02d", count),
        allowed_values = values,
        default_value = values[1],
        setting_type = "startup",
    }
end

data:extend({
    make_setting("transport-belt", {"colour"}),
    make_setting("underground-pipe", {"underground"}),
    make_setting("wire", {"wire"}),
    make_setting("gear", {"material", "gear"}),
    make_setting("circuits", {"colour-chip", "colour-circuit"}),
    make_setting("military-science", {"vanilla", "grey", "black"}),
    make_setting("space-science", {"vanilla", "white"}),
    make_setting("science", {"colour"}),
    make_setting("assemblers", {"colour-yellow", "colour-green", "assembler"}),
    make_setting("miners", {"miner"}),
    make_setting("modules", {"vanilla", "colour"}),
    make_setting("power-pole", {"power-pole"}),
    make_setting("nuke", {"nuke"}),
    make_setting("fish", {"fish"}),
})
