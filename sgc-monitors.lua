-- Get a list of all connected peripherals
local peripherals = peripheral.getNames()

-- Wrap each monitor and store them in a table
local monitors = {}
for _, name in ipairs(peripherals) do
    if peripheral.getType(name) == "monitor" then
        monitors[#monitors + 1] = peripheral.wrap(name)
    end
end

do
    local interfaces = {
        "advanced_crystal_interface",
        "crystal_interface",
    }
    for i, interface in ipairs(interfaces) do
        stargate = peripheral.find(interface)
        if stargate then
            tier = #interfaces - i + 1
            break
        end
    end
end

local sg = peripheral.wrap("advanced_crystal_interface_8")

local mf = require("morefonts")

-- Function to display content on a specific monitor
local function displayContent(monitor, content)
    monitor.clear()
    monitor.setCursorPos(1, 1)
    monitor.write(content)
end

local sgS = {"0", "1", "2", "3", "4", "5", "6", "7", "8", "9",
    "A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L",
    "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X",
    "Y", "Z", "a", "b", "c"}

while true do

    local symbol = sg.getCurrentSymbol()
    
    -- Display different content on each monitor
    if #monitors >= 1 then
        displayContent(monitors[1], "Hello, Monitor 1!")
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
        displayContent(monitors[3], "Hello, Monitor 3!")
    end
    sleep(1)
end
    -- Add more conditions if you have more monitors
