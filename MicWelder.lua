local players = game:GetService("Players")
local runservice = game:GetService("RunService")

local function WeldMic(plr)
	plr.CharacterAdded:Connect(function()
		wait(1)
		runservice.Stepped:Wait()
		
		local char = plr.Character
		
		local Mic = script.MicModel:Clone()
		local LeftHand = char.LeftHand
		
		Mic.Parent=char
		Mic:SetPrimaryPartCFrame(LeftHand.CFrame)
		
		local weld = Instance.new("WeldConstraint", Mic.PrimaryPart)
		weld.Part0=LeftHand
		weld.Part1=Mic.PrimaryPart
	end)
end

players.PlayerAdded:Connect(WeldMic)

