-- Get a list of all connected peripherals
local peripherals = peripheral.getNames()

-- Wrap each monitor and store them in a table
local monitors = {}
for _, name in ipairs(peripherals) do
    if peripheral.getType(name) == "monitor" then
        monitors[#monitors + 1] = peripheral.wrap(name)
    end
end

local interface = peripheral.find("crystal_interface") or peripheral.find("advanced_crystal_interface")

local mf = require("morefonts")

local sgS = {"0", "1", "2", "3", "4", "5", "6", "7", "8", "9",
    "A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L",
    "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X",
    "Y", "Z", "a", "b", "c"}

while true do

    local symbol = interface.getCurrentSymbol()
    
    local chevron = interface.getChevronsEngaged()
    
    -- Display different content on each monitor
    if #monitors >= 1 then
        monitors[1].clear()
        monitors[1].setTextColor(colors.blue)
        monitors[1].setCursorPos(1,1)
        monitors[1].setTextScale(1)
        monitors[1].write("Chevron")
        monitors[1].setCursorPos(1,2)
        monitors[1].write("Engaged")
        monitors[1].setCursorPos(4,5)
        monitors[1].write(chevron)
    end
    if #monitors >= 2 then
        monitors[2].clear()
        monitors[2].setTextColor(colors.blue)
        mf.writeOn(monitors[2], sgS[symbol], nil, nil, {
            font = "mw720",
            scale = 0.25,
            anchorHor = "center",
            anchorVer = "center",
        })
    end
    if #monitors >= 3 then
        monitors[3].write("Hello, Monitor 3!")
    end
    sleep(1)
end
    -- Add more conditions if you have more monitors
