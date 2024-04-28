--Position of dummy -65.2, 7.003, 40.8
local Players = game:GetService("Players")
local player = Players.LocalPlayer
local camera = workspace.CurrentCamera
local TweenService = game:GetService("TweenService")
local shake=true
if player then
	wait(2)
	local hum = player.Character:WaitForChild("Humanoid")
	local animator = hum:WaitForChild("Animator")
	local SpidermanAnim = animator:LoadAnimation(script["Spiderman Intro"])
	local SpiderManIdle = animator:LoadAnimation(script["SpidermanIntro(Idle)"])
	camera.CameraType=Enum.CameraType.Scriptable
	camera.CFrame=workspace["CameraPart Intro"].CFrame
	local random
	local text = player.PlayerGui.StartScreenGui.TextLabel
	local lighting = game:GetService("Lighting")
	task.spawn(function()
		while shake==true do
			wait(0.1)
			random=(math.random(0,2)/100)
		end
	end)
	lighting.Brightness=0
	local button = player.PlayerGui:WaitForChild("StartScreenGui").TextButton
	button.Position= UDim2.new(0.473,0,1,0)
	local CamSubject = camera.CameraSubject
	local CamFOV = camera.FieldOfView
	local CamFocus = camera.Focus
	local pressedButton = false
	player.PlayerGui.StartScreenGui.Enabled=true
	player.Character.Humanoid.WalkSpeed = 0.01
	local tweenInfo = TweenInfo.new(2,Enum.EasingStyle.Sine,Enum.EasingDirection.Out,0,false,0)
	local tweenin = TweenService:Create(button, tweenInfo, {Position = UDim2.new(0.473, 0,0.584, 0)})
	tweenin:Play()
	local shakeInfo = TweenInfo.new(0.1,Enum.EasingStyle.Sine,Enum.EasingDirection.Out,0,true,0)
	task.spawn(function()
		wait(1)
		while shake==true do
			local shakeTween = TweenService:Create(text,shakeInfo, {Position= UDim2.new((0.271+random),(0+random),(0.191+random),(0+random))})
			shakeTween:Play()
			wait(0.1)
		end
	end)
	button.MouseButton1Click:Connect(function()
		pressedButton = true
		local tweenInfo1 = TweenInfo.new(2,Enum.EasingStyle.Back,Enum.EasingDirection.Out,0,false,0)
		local tweenout = TweenService:Create(button,tweenInfo1, {Position = UDim2.new(0.473, 0,1,0)})
		tweenout:Play()
		tweenout.Completed:Connect(function()
			wait(1)
			shake=false
			lighting.Brightness=3
			player.PlayerGui.StartScreenGui.Enabled=false
			player.Character.Humanoid.WalkSpeed=16
			workspace.CurrentCamera.CameraType=Enum.CameraType.Custom
			CamSubject=player.Character.Humanoid
		end)
	end)
	--task.spawn(function()
	--	while pressedButton == false do
	--		workspace.CurrentCamera.CameraType=Enum.CameraType.Scriptable
	--		camera.CFrame = workspace.CameraPart.CFrame
	--		wait()
	--	end
	--end)
end
