-- UI Library
local UI = {}

-- Create a frame for the tabs
local tabsFrame = Instance.new("Frame")
tabsFrame.Name = "TabsFrame"
tabsFrame.Parent = game.Players.LocalPlayer.PlayerGui

-- Create a function to create a tab
function UI.CreateTab(tabData)
    local tabButton = Instance.new("TextButton")
    tabButton.Name = tabData.Name
    tabButton.Text = tabData.Name
    -- Style the tabButton here
    tabButton.Parent = tabsFrame
    -- Set the position and size of the tabButton based on existing tabs
    -- This requires calculating the position based on the number of existing tabs
    -- You can use something like UDim2.new() for relative positioning
end

-- Create a function to create a button inside a tab
function UI.CreateButton(buttonData)
    local button = Instance.new("TextButton")
    button.Name = buttonData.Name
    button.Text = buttonData.Name
    -- Style the button here
    button.Parent = tabsFrame:FindFirstChild(buttonData.Tab) or tabsFrame
    -- Set the position and size of the button
    -- Similar to tab positioning, this requires calculation based on existing buttons in the tab
    button.MouseButton1Click:Connect(function()
        if buttonData.Callback then
            buttonData.Callback(button:IsActive())
        end
    end)
end

-- Create a function to create a notification
function UI.CreateNotification(notificationData)
    local notification = Instance.new("TextLabel")
    notification.Name = notificationData.Name
    notification.Text = notificationData.Content
    -- Style the notification here
    notification.Parent = game.Players.LocalPlayer.PlayerGui
    -- Set the position of the notification
    -- You can use Vector2.new() for absolute positioning
    -- Set a timer to remove the notification after a certain duration
    wait(notificationData.Duration or 5)
    notification:Destroy()
end

return UI
