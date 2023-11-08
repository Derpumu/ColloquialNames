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
    make_setting("circuits", {"colour-chip", "colour-circuit"}),
    make_setting("assemblers", {"colour", "assembler"}),
    make_setting("modules", {"vanilla", "colour"}),
})
