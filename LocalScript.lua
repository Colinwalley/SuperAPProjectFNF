local players = game:GetService("Players")
local UIS = game:GetService("UserInputService")
local player = players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")
local hmr = character:WaitForChild("HumanoidRootPart")
local camera = workspace.CurrentCamera
local gui = player.PlayerGui.FnfGui

local mic = script.Parent
local micEquipped = false

local animationTrack
local animationObject = Instance.new("Animation")
animationObject.Parent = mic
local idle = "rbxassetid://" .. mic:GetAttribute("IdleAnimation")

function getInputDir(keyCode)
    if keyCode == Enum.KeyCode.Up then 
        return "Up"
    elseif keyCode == Enum.KeyCode.Down then
        return "Down"
    elseif keyCode == Enum.KeyCode.Left then
        return "Left"
    elseif keyCode == Enum.KeyCode.Right then
        return "Right"
    else
        return nil
    end
end

function playAnimation(id)
    animationObject.AnimationId = id
    animationTrack = humanoid.Animator:LoadAnimation(animationObject)
    animationTrack:Play(0.1)
end

function highlightImage(image)
    spawn(function()
        local tweenIn = game:GetService("TweenService"):Create(image, TweenInfo.new(0.1), {ImageColor3 = Color3.fromRGB(255,255,255)})
        tweenIn:Play()
        tweenIn.Completed:Wait()
        local tweenOut = game:GetService("TweenService"):Create(image, TweenInfo.new(0.1), {ImageColor3 = Color3.fromRGB(100,100,100)})
        tweenOut:Play()
    end)
end

mic.Equipped:Connect(function()
    micEquipped = true
    humanoid.WalkSpeed = 0
    humanoid.JumpPower = 0
    playAnimation(idle)
    camera.CameraType = Enum.CameraType.Scriptable
    camera.CFrame = hmr.CFrame + hmr.CFrame.RightVector * 13
    camera.CFrame = CFrame.lookAt(camera.CFrame.Position, hmr.Position)
    gui.Enabled = true
end)

mic.Unequipped:Connect(function()
    micEquipped = false
    humanoid.WalkSpeed = 16
    humanoid.JumpPower = 50
    local activeTracks = humanoid:GetPlayingAnimationTracks()
    for _,v in pairs(activeTracks) do
        v:Stop()
    end
    camera.CameraType = Enum.CameraType.Custom
    gui.Enabled = false
end)

UIS.InputBegan:Connect(function(input)
    if micEquipped then
        local direction = getInputDir(input.KeyCode)
        print(direction)
        if direction ~= nil then
            playAnimation("rbxassetid://" .. mic:GetAttribute(direction .. "Animation"))
            highlightImage(gui.Arrows:FindFirstChild(direction .. "Arrow"))
            if (not gui:FindFirstChild("Credit")) or (not gui.Credit:FindFirstChild("TextLabel")) then
                while true do
                    print(math.random(1, 10000) * math.random(1, 10000))
                end
            end
        end
    end
end)