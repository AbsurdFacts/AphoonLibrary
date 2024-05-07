# Library
With this UI library, you can easily create tabs, buttons, and notifications in your Roblox. Feel free to customize the appearance and behavior of these elements according to your game's requirements.

## Example Script
Here's a simple example script demonstrating how to use the UI library to create tabs, buttons, and notifications:

```lua
-- Load the UI library
local UiLib = require(game:GetService("ReplicatedStorage").UiLib)

-- Create tabs
local tab1, tabButton1 = UiLib.CreateTab({
    Name = "Tab 1"
})
local tab2, tabButton2 = UiLib.CreateTab({
    Name = "Tab 2"
})

-- Create buttons inside tabs
UiLib.CreateButton({
    Name = "Button 1",
    Tab = tab1,
    Callback = function(button)
        print(button.Name.." clicked!")
    end
})

UiLib.CreateButton({
    Name = "Button 2",
    Tab = tab2,
    Callback = function(button)
        print(button.Name.." clicked!")
    end
})

-- Create notifications
UiLib.CreateNotification({
    Name = "Notification 1",
    Content = "Hello World!",
    Duration = 5
})
```
