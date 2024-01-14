--[[ 

REQUIRES RED POWER / PROJECT:RED TO FUNCTION
              Documentation:
 https://github.com/St33li0/CC-JTEKlib/wiki

]]--
require ".JTEK.Libraries.JTEKlib"

writeDisplay(1,1,"Systems Online")
writeDisplay(1,2,"Hopper Lock: ")
writeDisplay(1,3,"Empty: ")
writeDisplay(1,4,"Full: ")
writeDisplay(1,5,"J-Tek Industries")

function HopperLock(switch)
    if switch == 1 then
        if redstone.testBundledInput("bottom",colors.combine(colors.blue)) == false then
            redstone.setBundledOutput("bottom",colors.combine(colors.blue))
        end
        writeDisplay(14,2,"ON ")
    end
    if switch == 0 then
        if redstone.testBundledInput("bottom",colors.combine(colors.blue)) then
            redstone.setBundledOutput("bottom",2^14)
        end
        writeDisplay(14,2,"OFF")
    end
end

function GenInput(cycles)
    local i = 0
    while i < cycles do
        HopperLock(0)
        os.sleep(20)
        HopperLock(1)
        os.sleep(4800)
    end
end

function Empty()
    if redstone.testBundledInput("bottom",colors.red) == true then
        GenInput(4)
        writeDisplay(8,3,"TRUE ")
    elseif redstone.testBundledInput("bottom",colors.red) == false then
        writeDisplay(8,3,"FALSE")
    end
end

function Full()
    if redstone.testBundledInput("bottom",colors.yellow) == true then
        writeDisplay(7,4,"TRUE ")
    elseif redstone.testBundledInput("bottom",colors.yellow) == false then
        writeDisplay(7,4,"FALSE")
    end
end

HopperLock(1)
Empty()
Full()

while true do
    os.pullEvent("redstone")
    if redstone.testBundledInput("bottom",colors.red) then
        Empty()
    elseif redstone.testBundledInput("bottom",colors.yellow) then
        Full()
    end
end
