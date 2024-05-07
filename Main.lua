-- UiLib.lua

local UiLib = {}

function UiLib.CreateTab(tabInfo)
    local TabFrame = Instance.new("Frame")
    TabFrame.Name = tabInfo.Name
    TabFrame.Size = UDim2.new(0, 100, 1, 0)
    TabFrame.Position = UDim2.new(0, #game.Players.LocalPlayer.PlayerGui:GetChildren() * 110, 0, 50)
    TabFrame.BackgroundTransparency = 1
    TabFrame.Parent = game.Players.LocalPlayer.PlayerGui

    local TabButton = Instance.new("TextButton")
    TabButton.Name = "TabButton"
    TabButton.Text = tabInfo.Name
    TabButton.Size = UDim2.new(0, 100, 0, 50)
    TabButton.Position = UDim2.new(0, #game.Players.LocalPlayer.PlayerGui:GetChildren() * 110, 0, 0)
    TabButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    TabButton.BorderSizePixel = 0
    TabButton.Font = Enum.Font.SourceSans
    TabButton.TextColor3 = Color3.fromRGB(0, 0, 0)
    TabButton.TextSize = 20
    TabButton.Parent = game.Players.LocalPlayer.PlayerGui

    return TabFrame, TabButton
end

function UiLib.CreateButton(buttonInfo)
    local Button = Instance.new("TextButton")
    Button.Name = buttonInfo.Name
    Button.Text = buttonInfo.Name
    Button.Size = UDim2.new(0, 100, 0, 30)
    Button.Position = UDim2.new(0, 10, 0, #buttonInfo.Tab:GetChildren() * 40)
    Button.Parent = buttonInfo.Tab
    Button.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Button.BorderSizePixel = 0
    Button.Font = Enum.Font.SourceSans
    Button.TextColor3 = Color3.fromRGB(0, 0, 0)
    Button.TextSize = 16

    Button.MouseButton1Click:Connect(function()
        buttonInfo.Callback(Button)
    end)
end

function UiLib.CreateNotification(notificationInfo)
    local Notification = Instance.new("TextLabel")
    Notification.Name = notificationInfo.Name
    Notification.Text = notificationInfo.Content
    Notification.Size = UDim2.new(0, 200, 0, 50)
    Notification.Position = UDim2.new(1, -210, 1, -60)
    Notification.BackgroundTransparency = 0.5
    Notification.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Notification.BorderSizePixel = 0
    Notification.Font = Enum.Font.SourceSans
    Notification.TextColor3 = Color3.fromRGB(0, 0, 0)
    Notification.TextSize = 18
    Notification.Parent = game.Players.LocalPlayer.PlayerGui

    wait(notificationInfo.Duration or 5)

    Notification:Destroy()
end

return UiLib
