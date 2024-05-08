local TabFrame = Instance.new("Frame")
local UICorner = Instance.new("UICorner")
local CombatText = Instance.new("TextLabel")
local uiStroke = Instance.new("UIStroke")

local LogoText = Instance.new("TextLabel")
local UIGradient = Instance.new("UIGradient")

function CreateTab(tabname, position)
	TabFrame.Name = tabname .. "Frame"
	TabFrame.Parent = game.StarterGui.Oxygen
	TabFrame.BackgroundColor3 = Color3.fromRGB(209, 208, 210)
	TabFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
	TabFrame.BorderSizePixel = 0
	TabFrame.Position = position
	TabFrame.Size = UDim2.new(0.20181635, 0, 0.91390729, 0)

	UICorner.Parent = TabFrame

	CombatText.Name = "CombatText"
	CombatText.Parent = TabFrame
	CombatText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	CombatText.BackgroundTransparency = 1.000
	CombatText.BorderColor3 = Color3.fromRGB(0, 0, 0)
	CombatText.BorderSizePixel = 0
	CombatText.Position = TabFrame.Position
	CombatText.Size = UDim2.new(0.675000012, 0, 0.09710145, 0)
	CombatText.Font = Enum.Font.Ubuntu
	CombatText.Text = tabname
	CombatText.TextColor3 = Color3.fromRGB(0, 0, 0)
	CombatText.TextScaled = true
	CombatText.TextSize = 14.000
	CombatText.TextWrapped = true
	UICorner.Parent = TabFrame

	uiStroke.Thickness = 2
	uiStroke.Color = Color3.new(0, 0, 0)
	uiStroke.Parent = TabFrame
	
	return TabFrame
end
function CreateButton(buttonname, parent, params, toggleStates, callback)
	local Button = Instance.new("TextButton")
	Button.Name = "Button"
	Button.Parent = game.StarterGui.Oxygen.HackFrame.VisualFrame
	Button.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Button.BackgroundTransparency = 1.000
	Button.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Button.BorderSizePixel = 0
	Button.Position = UDim2.new(0.25, 0, 0.171014488, 0)
	Button.Size = UDim2.new(0.5, 0, 0.0724637657, 0)
	Button.Font = Enum.Font.SourceSans
	Button.TextColor3 = Color3.fromRGB(0, 0, 0)
	Button.TextScaled = true
	Button.TextSize = 14.000
	Button.TextWrapped = true
	local isToggled = toggleStates[params.Name] or params.DefaultValue or false

	Button.MouseButton1Click:Connect(function()
		isToggled = not isToggled
		params.Callback(isToggled)

		Button.TextColor3 = isToggled and Color3.new(0.5, 0, 0.8) or Color3.new(1, 1, 1)
		Button.BackgroundColor3 = isToggled and Color3.new(0.2, 0.2, 0.2) or Color3.new(0, 0, 0)

		toggleStates[params.Name] = isToggled
	end)
	
	return Button
end
function CreateLogo(text)
	LogoText.Name = text
	LogoText.Parent = game.StarterGui.Oxygen
	LogoText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	LogoText.BackgroundTransparency = 1.000
	LogoText.BorderColor3 = Color3.fromRGB(0, 0, 0)
	LogoText.BorderSizePixel = 0
	LogoText.Size = UDim2.new(0.101112232, 0, 0.0662251636, 0)
	LogoText.Font = Enum.Font.Ubuntu
	LogoText.Text = text
	LogoText.TextColor3 = Color3.fromRGB(0, 0, 0)
	LogoText.TextScaled = true
	LogoText.TextSize = 14.000
	LogoText.TextWrapped = true

	UIGradient.Transparency = NumberSequence.new{NumberSequenceKeypoint.new(0.00, 0.00), NumberSequenceKeypoint.new(0.22, 0.62), NumberSequenceKeypoint.new(0.68, 0.85), NumberSequenceKeypoint.new(1.00, 0.00)}
	UIGradient.Parent = LogoText
	
	return LogoText
end
function CreateTabToggle(params, text)
	local player = game.Players.LocalPlayer
	local screenGui = Instance.new("ScreenGui")
	screenGui.Parent = player.PlayerGui

	local toggleButton = Instance.new("TextButton")
	toggleButton.Name = "TabToggle"
	toggleButton.Parent = screenGui
	toggleButton.AnchorPoint = Vector2.new(1, 0.5)
	toggleButton.Position = params.Position or UDim2.new(0.95, 0, 0.4, 0)
	toggleButton.Size = params.Size or UDim2.new(0, 80, 0, 40)
	toggleButton.BackgroundTransparency = 0.5
	toggleButton.BackgroundColor3 = Color3.new(0, 0, 0)
	toggleButton.Text = text
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
    CreateButton = CreateButton,
    CreateLogo = CreateLogo,
    CreateTabToggle = CreateTabToggle
}
