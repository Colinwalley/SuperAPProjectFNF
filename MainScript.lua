local PromptService = game:GetService("ProximityPromptService")
local Players = game:GetService("Players")
local DetectInput = game:GetService("ReplicatedStorage").DetectInput
local part = script.Parent
local RunGame = require(workspace.RunGame)

local char
local rightAnim
local idleanim
local leftAnim
local downAnim
local upAnim

PromptService.PromptTriggered:Connect(function(part, player)
	--local plr = Players:GetPlayerFromCharacter(player.Parent)
	
	local lame = player.Name
	char = player.Character
	player.Character.HumanoidRootPart.Position = workspace.Model.BaseOfMicrophone.Position + Vector3.new(-5,5,0)
	player.Character.HumanoidRootPart.Orientation = Vector3.new(0,-90,0)
	player.Character:FindFirstChildOfClass("Humanoid").WalkSpeed=0
	RunGame.RunGame(player)
	
	
	
end)

