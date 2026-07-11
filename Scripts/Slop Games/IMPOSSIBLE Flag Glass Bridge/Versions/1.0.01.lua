-- Script by Landonjf4, Version 1.0.01
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")

local LocalPlayer = Players.LocalPlayer
local Character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
local HumanoidRootPart = Character:WaitForChild("HumanoidRootPart")
local Humanoid = Character:WaitForChild("Humanoid")

local Chest = game.Workspace:FindFirstChild("Chest")
local ChestInside = Chest:FindFirstChild("Chest")
local StartPart = workspace:FindFirstChild("TeleportParts"):WaitForChild("Start")

local function RandomGen()
	local Chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890!@#$%^&*()"
	local result = ""
	for i = 1, 20 do
		local randomIndex = math.random(1, #Chars)
		result ..= Chars:sub(randomIndex, randomIndex)
	end
	return result
end
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")

local AutoFarmBool = Instance.new("BoolValue")
AutoFarmBool.Value = false
AutoFarmBool.Name = RandomGen()

local ChestRewardGui = PlayerGui:WaitForChild("ChestRewardGui")
local ReplicatedStroage = game:GetService("ReplicatedStorage")
local RemotesFolder = ReplicatedStroage:WaitForChild("Remotes")
local ChestRewardRemotes = RemotesFolder:WaitForChild("ChestRewardRemotes")
local ClaimRewardEvent = ChestRewardRemotes:WaitForChild("ClaimReward")

local ScreenGui = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local ExitButton = Instance.new("TextButton")
local AutoFarmButton = Instance.new("TextButton")
local DiscordTextLabel = Instance.new("TextLabel")
local CreditsTextLabel = Instance.new("TextLabel")
local function CreateAutoFarmScreenGui()
	ScreenGui.Name = RandomGen()
	ScreenGui.Parent = PlayerGui
	ScreenGui.ResetOnSpawn = true
	ScreenGui.Enabled = true
end

local function CreateAutoFarmFrame()
	Frame.Name = RandomGen()
	Frame.AnchorPoint = Vector2.new(0.5, 0.5)
	Frame.Position = UDim2.new(0.25, 0, 0.3, 0)
	Frame.Size = UDim2.new(0.25, 0, 0.5, 0)
	Frame.BackgroundColor3 = Color3.fromRGB(85,81,82)
	Frame.BackgroundTransparency = 0.5
	Frame.Parent = ScreenGui

	local UICorner = Instance.new("UICorner")
	UICorner.Name = RandomGen()
	UICorner.Parent = Frame
	UICorner.CornerRadius = UDim.new(0, 12)

	local UIStroke = Instance.new("UIStroke")
	UIStroke.Name = RandomGen()
	UIStroke.Parent = Frame
	UIStroke.Color = Color3.fromRGB(255, 255, 255)
	UIStroke.Thickness = 2
end

local function CreateAutoFarmExitButton()
	ExitButton.Name = RandomGen()
	ExitButton.Parent = Frame
	ExitButton.TextColor3 = Color3.fromRGB(0, 0, 0)
	ExitButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	ExitButton.BackgroundTransparency = 0.25
	ExitButton.Text = "X"
	ExitButton.TextScaled = true
	ExitButton.Size = UDim2.new(0.15, 0, 0.15, 0)
	ExitButton.AnchorPoint = Vector2.new(0.5, 0.5)
	ExitButton.Position = UDim2.new(0.9, 0, 0.1, 0)

	local ExitButtonUICorner = Instance.new("UICorner")
	ExitButtonUICorner.Name = RandomGen()
	ExitButtonUICorner.Parent = ExitButton
	ExitButtonUICorner.CornerRadius = UDim.new(0, 50)

	local ExitButtonUIStroke = Instance.new("UIStroke")
	ExitButtonUIStroke.Name = RandomGen()
	ExitButtonUIStroke.Parent = ExitButton
	ExitButtonUIStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
	ExitButtonUIStroke.Color = Color3.fromRGB(0, 0, 0)
	ExitButtonUIStroke.Thickness = 2
end

local function CreateAutoFarmStartButton()
	AutoFarmButton.Name = RandomGen()
	AutoFarmButton.Parent = Frame
	AutoFarmButton.TextColor3 = Color3.fromRGB(0, 0, 0)
	AutoFarmButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	AutoFarmButton.BackgroundTransparency = 0.25
	AutoFarmButton.Text = "Auto Farm: Off"
	AutoFarmButton.TextScaled = true
	AutoFarmButton.Size = UDim2.new(0.9, 0, 0.15, 0)
	AutoFarmButton.AnchorPoint = Vector2.new(0.5, 0.5)
	AutoFarmButton.Position = UDim2.new(0.5, 0, 0.3, 0)

	local AutoFarmButtonUICorner = Instance.new("UICorner")
	AutoFarmButtonUICorner.Name = RandomGen()
	AutoFarmButtonUICorner.Parent = AutoFarmButton
	AutoFarmButtonUICorner.CornerRadius = UDim.new(0, 12)

	local AutoFarmButtonUIStroke = Instance.new("UIStroke")
	AutoFarmButtonUIStroke.Name = RandomGen()
	AutoFarmButtonUIStroke.Parent = AutoFarmButton
	AutoFarmButtonUIStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
	AutoFarmButtonUIStroke.Color = Color3.fromRGB(0, 0, 0)
	AutoFarmButtonUIStroke.Thickness = 2
end

local function CreateCreditsTextLabel()
	CreditsTextLabel.Text = "Script made by Landonjf4"
	CreditsTextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
	CreditsTextLabel.Parent = Frame
	CreditsTextLabel.TextScaled = true
	CreditsTextLabel.BackgroundTransparency = 1
	CreditsTextLabel.AnchorPoint = Vector2.new(0.5, 0.5)
	CreditsTextLabel.Position = UDim2.new(0.4, 0, 0.1, 0)
	CreditsTextLabel.Size = UDim2.new(0.75, 0, 0.1, 0)

	local CreditsUIStroke = Instance.new("UIStroke")
	CreditsUIStroke.Name = RandomGen()
	CreditsUIStroke.Parent = CreditsTextLabel
	CreditsUIStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Contextual
	CreditsUIStroke.Color = Color3.fromRGB(0, 0, 0)
	CreditsUIStroke.Thickness = 1.5
end

local function CreateDiscordTextLabel()
	DiscordTextLabel.Text = "Discord.gg/NS7hPqVM6K"
	DiscordTextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
	DiscordTextLabel.Parent = Frame
	DiscordTextLabel.TextScaled = true
	DiscordTextLabel.BackgroundTransparency = 1
	DiscordTextLabel.AnchorPoint = Vector2.new(0.5, 0.5)
	DiscordTextLabel.Position = UDim2.new(0.5, 0, 0.9, 0)
	DiscordTextLabel.Size = UDim2.new(0.9, 0, 0.6, 0)

	local DiscordUIStroke = Instance.new("UIStroke")
	DiscordUIStroke.Name = RandomGen()
	DiscordUIStroke.Parent = DiscordTextLabel
	DiscordUIStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Contextual
	DiscordUIStroke.Color = Color3.fromRGB(0, 0, 0)
	DiscordUIStroke.Thickness = 1.5
end

local function MakeUI()
	CreateAutoFarmScreenGui()
	CreateAutoFarmFrame()
	CreateDiscordTextLabel()
	CreateCreditsTextLabel()
	CreateAutoFarmExitButton()
	CreateAutoFarmStartButton()
end
MakeUI()

ExitButton.MouseButton1Click:Connect(function()
	ScreenGui:Destroy()
	AutoFarmBool.Value = false
end)

AutoFarmButton.MouseButton1Click:Connect(function()
	if AutoFarmButton.Text == "Auto Farm: On" then
		AutoFarmButton.Text = "Auto Farm: Off"
		AutoFarmBool.Value = false
	else
		AutoFarmButton.Text = "Auto Farm: On"
		AutoFarmBool.Value = true
	end
end)

RunService.Heartbeat:Connect(function()
	if AutoFarmBool.Value then
		HumanoidRootPart.CFrame = ChestInside.CFrame
		ChestRewardGui.Enabled = false
		ClaimRewardEvent:FireServer()
		task.wait()
		HumanoidRootPart.CFrame = StartPart.CFrame
	end
end)
