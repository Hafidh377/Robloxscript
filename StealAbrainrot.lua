-- Only run in Steal a Brainrot
if game.PlaceId ~= 16124729541 then
    warn("Not Steal a Brainrot, script stopped.")
    return
end

repeat wait() until game:IsLoaded()
repeat wait() until game.Players.LocalPlayer and game.Players.LocalPlayer:FindFirstChild("PlayerGui")

local player = game.Players.LocalPlayer
local char = player.Character or player.CharacterAdded:Wait()
local humanoid = char:WaitForChild("Humanoid")
local UserInputService = game:GetService("UserInputService")

print("[VustHub] Script started")

-- Remove old GUI if exists
pcall(function()
    local oldGui = player.PlayerGui:FindFirstChild("VustHub")
    if oldGui then
        oldGui:Destroy()
        print("[VustHub] Old GUI destroyed")
    end
end)

-- Create new ScreenGui
local gui = Instance.new("ScreenGui")
gui.Name = "VustHub"
gui.ResetOnSpawn = false
gui.Parent = player.PlayerGui

-- Toggle Button
local toggleBtn = Instance.new("TextButton")
toggleBtn.Size = UDim2.new(0, 120, 0, 40)
toggleBtn.Position = UDim2.new(0, 10, 0.5, -20)
toggleBtn.AnchorPoint = Vector2.new(0, 0.5)
toggleBtn.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
toggleBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
toggleBtn.Text = "Vust Hub"
toggleBtn.Font = Enum.Font.GothamBold
toggleBtn.TextScaled = true
toggleBtn.Parent = gui

-- Main Frame
local mainFrame = Instance.new("Frame")
mainFrame.Size = UDim2.new(0, 250, 0, 220)
mainFrame.Position = UDim2.new(0.5, -125, 0.5, -110)
mainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
mainFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
mainFrame.Visible = false
mainFrame.Parent = gui

-- Title
local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, 0, 0, 40)
title.Text = "Vust Hub - Brainrot"
title.TextColor3 = Color3.new(1, 1, 1)
title.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
title.Font = Enum.Font.GothamBold
title.TextScaled = true
title.Parent = mainFrame

-- Close Button
local closeBtn = Instance.new("TextButton")
closeBtn.Size = UDim2.new(0, 30, 0, 30)
closeBtn.Position = UDim2.new(1, -35, 0, 5)
closeBtn.AnchorPoint = Vector2.new(1, 0)
closeBtn.Text = "X"
closeBtn.TextColor3 = Color3.new(1, 1, 1)
closeBtn.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
closeBtn.Font = Enum.Font.GothamBold
closeBtn.TextScaled = true
closeBtn.Parent = mainFrame

local function createBtn(text, yPos, callback)
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(0.8, 0, 0, 40)
    btn.Position = UDim2.new(0.1, 0, 0, yPos)
    btn.Text = text
    btn.TextColor3 = Color3.new(1, 1, 1)
    btn.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
    btn.Font = Enum.Font.GothamBold
    btn.TextScaled = true
    btn.Parent = mainFrame
    btn.MouseButton1Click:Connect(callback)
    return btn
end

createBtn("Jump Boost", 50, function()
    humanoid.JumpPower = 300
    print("[VustHub] Jump Boost activated")
end)

createBtn("Speed Boost", 100, function()
    humanoid.WalkSpeed = 100
    print("[VustHub] Speed Boost activated")
end)

createBtn("Infinite Jump", 150, function()
    if not getgenv().infJump then
        getgenv().infJump = true
        UserInputService.JumpRequest:Connect(function()
            if getgenv().infJump then
                humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
            end
        end)
        print("[VustHub] Infinite Jump activated")
    end
end)

toggleBtn.MouseButton1Click:Connect(function()
    mainFrame.Visible = not mainFrame.Visible
    print("[VustHub] Toggled Main Frame:", mainFrame.Visible)
end)

closeBtn.MouseButton1Click:Connect(function()
    gui:Destroy()
    getgenv().infJump = false
    print("[VustHub] GUI closed")
end)
