local function highlightImage(image)
	spawn(function()
		local tweenIn = game:GetService("TweenService"):Create(image, TweenInfo.new(0.01), {ImageColor3 = Color3.fromRGB(255, 255, 255)})
		tweenIn:Play()
		tweenIn.Completed:Wait()
		local tweenOut = game:GetService("TweenService"):Create(image, TweenInfo.new(0.2), {ImageColor3 = Color3.fromRGB(122, 122, 122)})
		tweenOut:Play()
	end)
end
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