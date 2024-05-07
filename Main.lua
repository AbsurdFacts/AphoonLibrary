-- UI Library

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Parent = game.Players.LocalPlayer.PlayerGui

local function CreateTab(tabInfo)
    local TabFrame = Instance.new("Frame")
    TabFrame.Name = tabInfo.Name
    TabFrame.Size = UDim2.new(0, 100, 1, 0)
    TabFrame.Position = UDim2.new(0, #ScreenGui:GetChildren() * 110, 0, 0)
    TabFrame.BackgroundTransparency = 0
    TabFrame.Parent = ScreenGui

    return TabFrame
end

local function CreateButton(buttonInfo)
    local Button = Instance.new("TextButton")
    Button.Name = buttonInfo.Name
    Button.Text = buttonInfo.Name
    Button.Size = UDim2.new(0, 80, 0, 30)
    Button.Position = UDim2.new(0, 10, 0, #buttonInfo.Tab:GetChildren() * 40)
    Button.Parent = buttonInfo.Tab

    Button.MouseButton1Click:Connect(function()
        buttonInfo.Callback(Button)
    end)
end

local function CreateNotification(notificationInfo)
    local Notification = Instance.new("TextLabel")
    Notification.Name = notificationInfo.Name
    Notification.Text = notificationInfo.Content
    Notification.Size = UDim2.new(0, 200, 0, 50)
    Notification.Position = UDim2.new(1, -210, 1, -60)
    Notification.BackgroundTransparency = 0.5
    Notification.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Notification.Parent = ScreenGui

    wait(notificationInfo.Duration or 5)

    Notification:Destroy()
end

return {
    CreateTab = CreateTab,
    CreateButton = CreateButton,
    CreateNotification = CreateNotification
}
