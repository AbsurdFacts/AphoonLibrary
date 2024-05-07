# Roblox Studio UI Library

This is a UI library for Roblox Studio, designed to simplify the creation of tabs, buttons, and notifications in your Roblox games. This library provides easy-to-use functions to generate UI elements and allows for customization of styling and functionality.

## Installation
Use this command
```lua
loadstring(game:HttpGet("https://raw.githubusercontent.com/AbsurdFacts/AphoonLibrary/main/Main.lua", true))()
```

## Usage

### Creating Tabs

To create a tab, use the `CreateTab` function with the desired tab name:

```lua
UI.CreateTab({
    Name = "TabName"
})
```
### Creating Buttons

To create a button you use this:

```lua
UI.CreateButton({
    Name = "ButtonName",
    Tab = "TabName",
    Callback = function(IsToggled)
        -- Your button callback logic here
    end
})
```
### Notifying the user

To make a notification, use this:

```lua
UI.CreateNotification({
    Name = "NotificationName",
    Content = "NotificationContent",
    Duration = 5 -- Duration in seconds (optional)
})
```
