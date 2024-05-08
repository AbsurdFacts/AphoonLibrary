local Players = game:GetService("Players")
local HttpService = game:GetService("HttpService")

local function CreateTab(params)
    local playerGui = Players.LocalPlayer:WaitForChild("PlayerGui")
    local screenGui = Instance.new("ScreenGui")
    screenGui.Parent = playerGui

    local tabFrame = Instance.new("Frame")
    tabFrame.Name = params.TABNAME
    tabFrame.Position = params.POSITION
    tabFrame.Size = params.SIZE or UDim2.new(0, 200, 0, 50)
    tabFrame.BackgroundTransparency = 0.5

    local gradient = Instance.new("UIGradient")
    gradient.Rotation = 90
    gradient.Color = ColorSequence.new{
        ColorSequenceKeypoint.new(0, Color3.fromRGB(40, 40, 40)),
        ColorSequenceKeypoint.new(0.5, Color3.fromRGB(30, 30, 60)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(30, 30, 70))
    }
    gradient.Parent = tabFrame

    local uiStroke = Instance.new("UIStroke")
    uiStroke.Thickness = 2
    uiStroke.Color = Color3.new(0, 0, 0)
    uiStroke.Parent = tabFrame

    local uiCorner = Instance.new("UICorner")
    uiCorner.CornerRadius = UDim.new(0, 8)
    uiCorner.Parent = tabFrame

    local titleLabel = Instance.new("TextLabel")
    titleLabel.Name = "TitleLabel"
    titleLabel.Parent = tabFrame
    titleLabel.Size = UDim2.new(1, 0, 0, 20)
    titleLabel.Position = UDim2.new(0, 0, 0, 5)
    titleLabel.Text = params.NAME
    titleLabel.TextSize = 32
    titleLabel.Font = Enum.Font.DenkOne
    titleLabel.TextColor3 = Color3.new(1, 1, 1)
    titleLabel.TextStrokeTransparency = 0
    titleLabel.TextStrokeColor3 = Color3.new(0, 0, 0)
    titleLabel.BackgroundTransparency = 1

    tabFrame.Parent = screenGui

    return tabFrame
end

local function CreateToggle(params)
    local toggleButton = Instance.new("TextButton")
    toggleButton.Name = params.Name
    toggleButton.Parent = params.ParentTab
    toggleButton.Position = params.Position or UDim2.new(0, 0, 0, 0)
    toggleButton.Size = UDim2.new(0, 200, 0, 30)
    toggleButton.BackgroundTransparency = 1
    toggleButton.Text = params.Name
    toggleButton.TextSize = 24
    toggleButton.Font = Enum.Font.DenkOne
    toggleButton.TextColor3 = Color3.new(1, 1, 1)
    toggleButton.TextStrokeTransparency = 1

    local filePath = "ToggleStates.json"
    local toggleStates = {}

    local fileExists, fileContent = pcall(function()
        return game:GetService("HttpService"):JSONDecode(readfile(filePath))
    end)

    if fileExists and fileContent then
        toggleStates = fileContent
    end

    local isToggled = toggleStates[params.Name] or params.DefaultValue or false

    toggleButton.MouseButton1Click:Connect(function()
        isToggled = not isToggled
        params.Callback(isToggled)

        toggleButton.TextColor3 = isToggled and Color3.new(0.5, 0, 0.8) or Color3.new(1, 1, 1)
        toggleButton.BackgroundColor3 = isToggled and Color3.new(0.2, 0.2, 0.2) or Color3.new(0, 0, 0)

        toggleStates[params.Name] = isToggled
        writefile(filePath, HttpService:JSONEncode(toggleStates))
    end)

    return toggleButton
end

local function CreateTabToggle(params)
    local screenGui = Instance.new("ScreenGui")
    screenGui.Parent = Players.LocalPlayer.PlayerGui

    local toggleButton = Instance.new("TextButton")
    toggleButton.Name = "TabToggle"
    toggleButton.Parent = screenGui
    toggleButton.AnchorPoint = Vector2.new(1, 0.5)
    toggleButton.Position = params.Position or UDim2.new(0.95, 0, 0.4, 0)
    toggleButton.Size = params.Size or UDim2.new(0, 80, 0, 40)
    toggleButton.BackgroundTransparency = 0.5
    toggleButton.BackgroundColor3 = Color3.new(0, 0, 0)
    toggleButton.Text = "Toggle"
    toggleButton.TextSize = 18
    toggleButton.Font = Enum.Font.DenkOne
    toggleButton.TextColor3 = Color3.new(1, 1, 1)

    local uiStroke = Instance.new("UIStroke")
    uiStroke.Thickness = 1
    uiStroke.Color = Color3.new(0, 0, 0)
    uiStroke.Parent = toggleButton

    local uiCorner = Instance.new("UICorner")
    uiCorner.CornerRadius = UDim.new(0, 8)
    uiCorner.Parent = toggleButton

    local tabsEnabled = true  

    toggleButton.MouseButton1Click:Connect(function()
        tabsEnabled = not tabsEnabled
        params.Callback(tabsEnabled)

        toggleButton.TextColor3 = tabsEnabled and Color3.new(1, 1, 1) or Color3.new(0.5, 0, 0.8)
    end)

    toggleButton.Visible = true  

    return toggleButton
end

return {
    CreateTab = CreateTab,
    CreateToggle = CreateToggle,
    CreateTabToggle = CreateTabToggle
}
