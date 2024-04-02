local PromptService = game:GetService("ProximityPromptService")
local RS= game:GetService("ReplicatedStorage")
local uis = game:GetService("UserInputService")
local Players = game:GetService("Players")
local DetectInput = game:GetService("ReplicatedStorage").DetectInput
local part = script.Parent
local char
local player = Players.LocalPlayer
local camera = workspace.CurrentCamera
local isRunning=false

local function info(input)
	if input.KeyCode==Enum.KeyCode.A or input.KeyCode==Enum.KeyCode.D or input.KeyCode==Enum.KeyCode.W or input.KeyCode==Enum.KeyCode.S then
		return input.KeyCode
	end
end

local function FixCamera(player)
	camera.CameraType = Enum.CameraType.Scriptable
	camera.CFrame = workspace.CameraPart.CFrame

end
local function highlightImage(image)
	spawn(function()
		local tweenIn = game:GetService("TweenService"):Create(image, TweenInfo.new(0.01), {ImageColor3 = Color3.fromRGB(255, 255, 255)})
		tweenIn:Play()
		tweenIn.Completed:Wait()
		local tweenOut = game:GetService("TweenService"):Create(image, TweenInfo.new(0.2), {ImageColor3 = Color3.fromRGB(122, 122, 122)})
		tweenOut:Play()
	end)
end

print(player.Character)


local function RunGame()
	local Players = game:GetService("Players")
	local player = Players.LocalPlayer
	local DetectInput = game:GetService("ReplicatedStorage").DetectInput
	local mainScript = workspace.Stage.Attachment.SingPrompt.MainScript
	local RunService = game:GetService("RunService")
	local CamEvent = game:GetService("ReplicatedStorage").CameraEvent
	local mic = player.Character.MicModel.Microphone
	local vocals = script.Vocals
	local instrumental = script.Instrumental
	local Arrows = player.PlayerGui.FnfGui.Arrows
	local PBDetector = game:GetService("ReplicatedStorage").PlaybackDetector
	mic.Transparency=0
	local arrowTypes ={
		"Up",
		"Down",
		"Left",
		"Right"
	}
	local UpConnection
	local DownConnection
	local RightConnection
	local LeftConnection
	local clonedArrow
	local char
	local rightAnim
	local idleanim
	local leftAnim
	local downAnim
	local upAnim
	local currentAnim
	local gui = player.PlayerGui.FnfGui
	local hmr = player.Character:WaitForChild("HumanoidRootPart")
	gui.Enabled=true
	--camera.CFrame = CFrame.lookAt(camera.CFrame.Position, hmr.Position)


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
	FixCamera(player)
	instrumental:Play()
	vocals:Play()
	local function AddArrow(ArrowType)
		if ArrowType == "Up" then
			clonedArrow = Arrows.UpArrow:Clone()
			clonedArrow.Parent=player.PlayerGui.FnfGui.Arrows
			local posX = Arrows.UpArrow.Position.X.Scale
			local posY = Arrows.UpArrow.Position.Y.Scale

			clonedArrow.Position=UDim2.new(posX,0,7,0)
			clonedArrow.ImageColor3 = Arrows.UpArrow.ImageColor3
			clonedArrow.Rotation=0
			clonedArrow.Visible=true
			clonedArrow.ImageTransparency=0
			local clone = clonedArrow:TweenPosition(UDim2.new(posX,0,-2,0), nil,nil,2)
			if clonedArrow.Position==UDim2.new(posX,-2,0) then
				clonedArrow:Destroy()
			end
		end
		if ArrowType == "Down" then
			local clonedArrow = Arrows.DownArrow:Clone()
			clonedArrow.Parent=player.PlayerGui.FnfGui.Arrows
			local posX = Arrows.DownArrow.Position.X.Scale
			local posY = Arrows.DownArrow.Position.Y.Scale

			clonedArrow.Position=UDim2.new(posX,0,7,0)
			clonedArrow.ImageColor3 = Arrows.DownArrow.ImageColor3
			clonedArrow.Rotation=0
			clonedArrow.Visible=true
			clonedArrow.ImageTransparency=0
			local clone = clonedArrow:TweenPosition(UDim2.new(posX,0,-2,0), nil,nil,2)
			if clonedArrow.Position==UDim2.new(posX,-2,0) then
				clonedArrow:Destroy()
			end
		end
		if ArrowType == "Right" then
			local clonedArrow = Arrows.RightArrow:Clone()
			clonedArrow.Parent=player.PlayerGui.FnfGui.Arrows
			local posX = Arrows.RightArrow.Position.X.Scale
			local posY = Arrows.RightArrow.Position.Y.Scale

			clonedArrow.Position=UDim2.new(posX,0,7,0)
			clonedArrow.ImageColor3 = Arrows.RightArrow.ImageColor3
			clonedArrow.Rotation=0
			clonedArrow.Visible=true
			clonedArrow.ImageTransparency=0
			local clone = clonedArrow:TweenPosition(UDim2.new(posX,0,-2,0), nil,nil,2)
			if clonedArrow.Position==UDim2.new(posX,-2,0) then
				clonedArrow:Destroy()
			end
		end
		if ArrowType == "Left" then
			local clonedArrow = Arrows.LeftArrow:Clone()
			clonedArrow.Parent=player.PlayerGui.FnfGui.Arrows
			local posX = Arrows.LeftArrow.Position.X.Scale
			local posY = Arrows.LeftArrow.Position.Y.Scale

			clonedArrow.Position=UDim2.new(posX,0,7,0)
			clonedArrow.ImageColor3 = Arrows.LeftArrow.ImageColor3
			clonedArrow.Rotation=0
			clonedArrow.Visible=true
			clonedArrow.ImageTransparency=0
			local clone = clonedArrow:TweenPosition(UDim2.new(posX,0,-2,0), nil,nil,2)
			if clonedArrow.Position==UDim2.new(posX,-2,0) then
				clonedArrow:Destroy()
			end
		end
	end
	spawn(function()
		while isRunning==true do
			wait(0.2)
			print("Making random arrows")
			local number = math.round(vocals.PlaybackLoudness/35)
			local chosenArrow=math.clamp(number,1,#arrowTypes)
			coroutine.wrap(AddArrow)(arrowTypes[chosenArrow])
		end
		end)
	uis.InputBegan:Connect(function(input)
print(clonedArrow.Name)
		if input.KeyCode==Enum.KeyCode.D then
			highlightImage(gui.Arrows:FindFirstChild("RightArrow"))
			currentAnim:Stop()
			rightAnim:Play()
			currentAnim=rightAnim
		end
		if input.KeyCode==Enum.KeyCode.A then
			highlightImage(gui.Arrows:FindFirstChild("LeftArrow"))
			currentAnim:Stop()
			leftAnim:Play()
			currentAnim=leftAnim
		end
		if input.KeyCode==Enum.KeyCode.W then
			highlightImage(gui.Arrows:FindFirstChild("UpArrow"))
			currentAnim:Stop()
			upAnim:Play()
			currentAnim=upAnim
			if clonedArrow.Name=="UpArrow" then
				if (clonedArrow.AbsolutePosition-Arrows.UpArrow.AbsolutePosition).Magnitude<40 then
					print("Pressed up arrow at right time")
					clonedArrow:Destroy()
				end
			end
		end
		if input.KeyCode==Enum.KeyCode.S then
			highlightImage(gui.Arrows:FindFirstChild("DownArrow"))
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
	end)
end
wait(1)
spawn(function()
	while isRunning==false do
		wait(0.2)
		if(player.Character:FindFirstChild("Humanoid").WalkSpeed==0) and isRunning==false then
			isRunning=true
			RunGame()
			return
		end
	end
end)

