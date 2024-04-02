local PromptService = game:GetService("ProximityPromptService")
PromptService.PromptTriggered:Connect(function(part, player)
	--local plr = Players:GetPlayerFromCharacter(player.Parent)

	local lame = player.Name
	local char = player.Character
	print("Before")
	player.Character:FindFirstChild("HumanoidRootPart").Position = workspace.Model.BaseOfMicrophone.Position + Vector3.new(-5,5,0)
	print("After Position Change")
	player.Character:FindFirstChild("HumanoidRootPart").Orientation = workspace.CameraPart.Orientation+Vector3.new(0,-90,0)
	print("After Orientation Change")
	player.Character:FindFirstChild("Humanoid").WalkSpeed=0
	print("AfterWalkspeed Change")



end)