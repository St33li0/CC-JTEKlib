masterVersion = 001

programs = { -- List of available programs
    "GeneratorControl.lua";
    "ClientSend.lua";
    "ServerMain.lua";
}

programVersions = {
    002; -- GeneratorControl.lua
    801; -- ClientSend.lua
    901; -- ServerMain.lua
}

libraries = { -- List of available libraries/apis
    "JTEKlib.lua";
}

-- Install path for programs
programInstallPath = "JTEK/Programs/"

-- Install path for libraries/apis
libraryInstallPath = "JTEK/Libraries/"

-- Do not change unless you know what you are doing
sourcePath = {
    "disk/Programs/";
    "disk/Libraries/";
}

function writeDisplay(posX,posY,text)
-- Writes to all registered and connected displays at once

    allDisplays = { -- Array containing registered displays
        peripheral.wrap("monitor_0");
        peripheral.wrap("monitor_1");
    }

    for i=1, #allDisplays do
        allDisplays[i].setCursorPos(posX,posY)
        allDisplays[i].write(text)
    end

end

function writeScreen(posX,posY,text)
-- Write to terminal with full control

    term.setCursorPos(posX,posY)
    write(text)

end

function clear(all,posY)
-- Function allowing for finer clear control
-- all = bool
-- posY = int
    if all == true then -- Clear whole screen THEN set cursor pos to X=1,Y=posY
        term.clear()
        term.setCursorPos(1,posY)

    elseif all == false then -- Set cursor pos to X=1,Y=posY THEN clear single line
        term.setCursorPos(1,posY)
        term.clearLine()
    end

end

function header()
    -- JTEK Industries Header

    clear(true,1,1)
    print("JTEK Industries 2023")
    print()

end

--[[ function errorHandler(type)
    -- Run an error and restart the script
    header()
    if type == OutOfRange then
        print("Argument Out Of Range")
    elseif type == FileNotFound then
        print("File Not Found")
    elseif type == Format then
        print("Format Incorrect")
    elseif type == Timeout then
        print("Timed Out")
    else
        print("Encountered Unexpected Error")
    end
    print("Program will restart")
    os.sleep(4)
    runtime()
end ]]--