local module = {}

module.RunGame= function (player)
	local Players = game:GetService("Players")
	local DetectInput = game:GetService("ReplicatedStorage").DetectInput
	local mainScript = workspace.Stage.Attachment.SingPrompt.MainScript
	local RunService = game:GetService("RunService")

	local char
	local rightAnim
	local idleanim
	local leftAnim
	local downAnim
	local upAnim
	local currentAnim



	char = player.Character
	local hum = char:WaitForChild("Humanoid")
	local animator = hum:WaitForChild("Animator")
	idleanim = animator:LoadAnimation(mainScript.Idle)
	rightAnim= animator:LoadAnimation(mainScript.Right)
	leftAnim=animator:LoadAnimation(mainScript.Left)
	downAnim=animator:LoadAnimation(mainScript.Down)
	upAnim=animator:LoadAnimation(mainScript.Up)
	idleanim:Play()
	currentAnim=idleanim

	print(player.Character)
	DetectInput.OnServerEvent:Connect(function(Player, input)
		if input==Enum.KeyCode.D then
			print(currentAnim)
			currentAnim:Stop()
			rightAnim:Play()
			currentAnim=rightAnim
		end
		if input==Enum.KeyCode.A then
			print(currentAnim)
			currentAnim:Stop()
			leftAnim:Play()
			currentAnim=leftAnim
		end
		if input==Enum.KeyCode.W then
			print(currentAnim)
			currentAnim:Stop()
			upAnim:Play()
			currentAnim=upAnim
		end
		if input==Enum.KeyCode.S then
			print(currentAnim)
			currentAnim:Stop()
			downAnim:Play()
			currentAnim=downAnim
		end
		if currentAnim.Ended then
			wait(0.4)
			if currentAnim.Ended then
				idleanim:Play()
				currentAnim=idleanim
			end
		end
		--if downAnim.Stopped and rightAnim.Stopped and upAnim.Stopped and leftAnim.IsPlaying then
			
		--elseif downAnim.Stopped and rightAnim.Stopped and leftAnim.Stopped and upAnim.IsPlaying then
			
		--elseif downAnim.Stopped and leftAnim.Stopped and upAnim.Stopped and rightAnim.IsPlaying then
			
		--elseif leftAnim.Stopped and upAnim.Stopped and rightAnim.Stopped and downAnim.IsPlaying then

		--elseif leftAnim.Stopped and upAnim.Stopped and rightAnim.Stopped and downAnim.Stopped then
		--	idleanim:Play()
		--	currentAnim=idleanim
		--else
		--	return
		--end
end)
end
return module
