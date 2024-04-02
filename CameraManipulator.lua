local camera = workspace.CurrentCamera
local CamEvent = game:GetService("ReplicatedStorage").CameraEvent

local function FixCamera(player)
	camera.CameraType = Enum.CameraType.Scriptable
	camera.CFrame = workspace.CameraPart.CFrame
end

CamEvent.OnClientEvent:Connect(FixCamera)