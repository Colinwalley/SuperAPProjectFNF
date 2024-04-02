local RS = game:GetService("ReplicatedStorage")
local PBDetector = RS.PlaybackDetector

local function playback()
	local loudness = workspace.RunGame.Instrumental.PlaybackLoudness
	PBDetector:FireServer(loudness)
end

playback()