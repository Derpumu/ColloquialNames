--[[
 iron gear wheels -> Iron Gears or gears
 anything "mk2" just 2
 electric poles "power poles" or just "poles", like "small poles" or "medium power poles".
 Stone bricks are "bricks"
 Raw fish is definitely just fish
 Atomic bombs are nukes
 Burner mining drills are "burner drills" or "burner miner"
 electric mining drills are "miners" or "mining drills" or "electric miner"
 Personal laser defense is just "personal lasers"
 Uranium fuel cells are "fuel cells" and empty ones are "empty fuel cells"
 Rail signals and rail chain signals are signals and chain signals, train stations are stations
 Shotgun shells are fine, but piercing shotgun shells are piercing shells
 I call steam turbines turbines
 WHY are underground pipes called "pipe to ground"?????
 The pistol and submachine gun(i call it an SMG)
 ammo is "magazines", "piercing mags" and "uranium mags", or colors
 colors for tank shells
 colors for rockets
 Colors also for logistics chests
 oil drill instead of pumpjack
 lube instead of lubricant
 copper wire instead of copper cable
 LDS, RCU
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
