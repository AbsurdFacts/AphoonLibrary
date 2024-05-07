# Library
With this UI library, you can easily create tabs, buttons, and notifications in your Roblox. Feel free to customize the appearance and behavior of these elements according to your game's requirements.

## Example Script
Here's a simple example script demonstrating how to use the UI library to create tabs, buttons, and notifications:

```lua
local UI = loadstring(game:HttpGet("https://raw.githubusercontent.com/AbsurdFacts/AphoonLibrary/main/Main.lua", true))()

local tab1 = UI.CreateTab({
    Name = "Tab 1"
})

local tab2 = UI.CreateTab({
    Name = "Tab 2"
})

UI.CreateButton({
    Name = "Button 1",
    Tab = tab1,
    Callback = function(button)
        print(button.Name.." clicked!")
    end
})

UI.CreateButton({
    Name = "Button 2",
    Tab = tab2,
    Callback = function(button)
        print(button.Name.." clicked!")
    end
})

UI.CreateNotification({
    Name = "Notification 1",
    Content = "Hello World!",
    Duration = 5
})
```
