require "Libraries.JTEKlib"
clear(true,1)

-- {{ [[ Several functions moved to Libraries/JTEKlib.lua, see top. ]] }} --

function copyAllFiles(path)
    for i=1, #programs do -- Copy all available programs to program DIR (Default: JTEK/Programs)
        origin = sourcePath[1]..programs[i]
        destination = programInstallPath..programs[i]
        fs.copy(origin,destination)
    end
    for i=1, #libraries do -- Copy all available libraries to lib DIR (Default: JTEK/Lib)
        origin = sourcePath[2]..libraries[i]
        destination = libraryInstallPath..libraries[i]
        fs.copy(origin,destination)
    end
end

function copySomeFiles(files,path)
    matched = string.gmatch(files, '([^,]+)')
    for number in matched do
        number = tonumber(number)
        origin = sourcePath[1]..programs[i]
        destination = programInstallPath..programs[i]
        fs.copy(origin,destination)
    end
    for i=1, #libraries do -- Copy all available libraries to lib DIR (Default: JTEK/Lib)
        origin = sourcePath[2]..libraries[i]
        destination = libraryInstallPath..libraries[i]
        fs.copy(origin,destination)
    end
end

function runtime()
    -- Runtime environment
    os.sleep(1)
    menu(1)
end

function install(all)
    header()
    if all == true then
        -- Run Install All to JTEK/
        if fs.exists("JTEK") then
            fs.delete("JTEK")
            fs.makeDir("JTEK")
            copyAllFiles("JTEK/")
        else
            fs.makeDir("JTEK")
            copyAllFiles("JTEK/")
        end
    elseif all == false then
        -- Run Menu for Install Choice
        menu(2)
    else
        --Run Error Script
        error("unknown")
    end
end

function menu(menu)
    -- Menu for choosing what to install
    if menu == 1 then -- Ask to Install All
        header()
        while choice ~= "Y" and choice ~= "N" do
            clear(false,3)
            clear(false,4)
            writeScreen(1,3,"Would you like to install all programs? (Y/N)")
            term.setCursorPos(1,4)
            choice = read()
        end
        if choice == "Y" then
            install(true)
        else
            install(true) -- Forced full install every time.
        end
    elseif menu == 2 then menu(1) -- If 1 == False, Ask which programs to install
        header()
        print("Please choose the programs you would like to install")
        print("Enter the numbers for all programs you wish to add to the install")
        print("Format: 1,2,3,4")
        print()
        for i=1, #programs do
            term.setCursorPos(1,i+8)
            write(tostring(i).."."..programs[i])
            
        end
        print()
        choice = read()
        if fs.exists(programInstallPath) then
            copySomeFiles(choice,programInstallPath)
        else
            fs.makeDir(programInstallPath)
            copySomeFiles(choice,programInstallPath)
        end
    end
end

function error(type,message)
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
end

runtime()