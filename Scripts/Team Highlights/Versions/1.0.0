-- Script by Landonjf4, version 1.0.0

local Teams = game:GetService("Teams")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

local RefreshRate = 0.5
local HaveHighlights = true

local function CreateHighlight(player)
	local character = player.Character
	if character:FindFirstChild("CA@345M32!") then
		return
	end
	local Highlight = Instance.new("Highlight")
	Highlight.Name = "CA@345M32!"
	Highlight.Adornee = character
	Highlight.Parent = character
	Highlight.Enabled = true
	Highlight.FillColor = player.Team.TeamColor.Color
	Highlight.OutlineColor = player.Team.TeamColor.Color
end

local function PlaceHighlight()
	for _, player in ipairs(Players:GetPlayers()) do
		if player ~= LocalPlayer and player.Team ~= LocalPlayer.Team then
			local character = player.Character
			if character then
				CreateHighlight(player)
			end
		end
	end
end

if HaveHighlights then
	while true do
		task.wait(RefreshRate)
		PlaceHighlight()
	end
end
