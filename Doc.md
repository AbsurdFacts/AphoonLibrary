# AphoonLib
my new uilib
## Booting it up
In order to use it u boot it up with this
```lua
local UI = loadstring(game:HttpGet("https://raw.githubusercontent.com/AbsurdFacts/AphoonLibrary/main/Main.lua", true))()
```
## Making a tab
To make a tab u use this
```lua
local tab1 = UI.CreateTab({
    Name = "TabName"
})
```
## Making a button
To make a button use this
```lua
UI.CreateButton({
    Name = "Button 1",
    Tab = tab1,
    Callback = function(button)
        print(button.Name.." clicked!")
    end
})
```
## Making a notification
Last but not least to make a notification use this
```lua
UI.CreateNotification({
    Name = "Notification 1",
    Content = "Hello World!",
    Duration = 5
})
```
And thats my Ui Library, its new so not that good.
