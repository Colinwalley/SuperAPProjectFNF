local RS= game:GetService("ReplicatedStorage")
local uis = game:GetService("UserInputService")
local DetectInput = RS:WaitForChild("DetectInput")
local Players = game:GetService("Players")
local Player = Players.LocalPlayer

local function info(input)
	DetectInput:FireServer(input.KeyCode)
end

uis.InputBegan:Connect(info)