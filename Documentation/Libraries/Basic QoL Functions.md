---
title: Basic QoL Functions
slug: DRAF-f
createdAt: Fri Jan 12 2024 11:24:24 GMT+0000 (Coordinated Universal Time)
updatedAt: Fri Jan 12 2024 11:38:39 GMT+0000 (Coordinated Universal Time)
---

```lua
function clear(all,posY)
-- Function allowing for finer clear control
    if all == true then -- Clear whole screen THEN set cursor pos to X=1,Y=posY
        term.clear()
        term.setCursorPos(1,posY)
    elseif all == false then -- Set cursor pos to X=1,Y=posY THEN clear single line
        term.setCursorPos(1,posY)
        term.clearLine()
    end
end
```

The LUA function "clear" provides control over clearing the screen. It takes two parameters: "all" (bool) and "posY" (int).

If "all" is true, the function clears the screen and sets the cursor position to X=1, Y=posY.

If "all" is false, the function sets the cursor position to X=1, Y=posY, and clears the single line.

```lua
function header()
    -- JTEK Industries Header
    clear(true,1,1)
    print("JTEK Industries 2023")
    print()
end
```

The LUA function "header()" clears the screen, prints "JTEK Industries 2023", and adds an empty line. It is used to display the header for JTEK Industries.

```lua
function writeScreen(posX,posY,text)
-- Write to terminal with full control
    term.setCursorPos(posX,posY)
    write(text)
end
```

The LUA function "writeScreen" writes text to the terminal at a specified position.

```lua
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
```

The LUA function "writeDisplay" writes the given "text" to all registered and connected displays at once. It sets the cursor position to "posX" and "posY" before writing the text.

Please be aware that this function requires setup in order to match your configuration.
