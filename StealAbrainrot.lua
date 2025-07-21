-- Check game ID
if game.PlaceId ~= 16124729541 then
    return warn("This script only works in Steal a Brainrot.")
end

repeat wait() until game:IsLoaded()
repeat wait() until game.Players.LocalPlayer and game.Players.LocalPlayer:FindFirstChild("PlayerGui")

local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")
local uis = game:GetService("UserInputService")
local gui = Instance.new("ScreenGui", player.PlayerGui)
gui.Name = "VustHubUI"
gui.ResetOnSpawn = false

pcall(function()
    local old = player.PlayerGui:FindFirstChild("VustHubUI")
    if old then old:Destroy() end
end)

-- Toggle Button
local toggleBtn = Instance.new("TextButton", gui)
toggleBtn.Size = UDim2.new(0, 100, 0, 40)
toggleBtn.Position = UDim2.new(0, 10, 0.5, -20)
toggleBtn.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
toggleBtn.Text = "Vust Hub"
toggleBtn.TextColor3 = Color3.new(1, 1, 1)
toggleBtn.Font = Enum.Font.GothamBold
toggleBtn.TextScaled = true

-- Main UI Frame
local frame = Instance.new("Frame", gui)
frame.Size = UDim2.new(0, 250, 0, 200)
frame.Position = UDim2.new(0.5, -125, 0.5, -100)
frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
frame.Visible = false

-- Title and Close Button
local title = Instance.new("TextLabel", frame)
title.Size = UDim2.new(1, 0, 0, 40)
title.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
title.Text = "Vust Hub"
title.TextColor3 = Color3.new(1, 1, 1)
title.Font = Enum.Font.GothamBold
title.TextScaled = true

local close = Instance.new("TextButton", frame)
close.Size = UDim2.new(0, 30, 0, 30)
close.Position = UDim2.new(1, -35, 0, 5)
close.Text = "X"
close.BackgroundColor3 = Color3.fromRGB(150, 0, 0)
close.TextColor3 = Color3.new(1, 1, 1)
close.Font = Enum.Font.GothamBold
close.TextScaled = true

-- Infinite Jump Setup
local infJumpConn
-- Utility to create buttons
local function createBtn(text, y, func)
    local btn = Instance.new("TextButton", frame)
    btn.Size = UDim2.new(0.8, 0, 0, 40)
    btn.Position = UDim2.new(0.1, 0, 0, y)
    btn.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
    btn.TextColor3 = Color3.new(1, 1, 1)
    btn.Text = text
    btn.Font = Enum.Font.GothamBold
    btn.TextScaled = true
    btn.MouseButton1Click:Connect(func)
end

createBtn("Jump Boost", 50, function() humanoid.JumpPower = 300 end)
createBtn("Speed Boost", 100, function() humanoid.WalkSpeed = 100 end)
createBtn("Infinite Jump", 150, function()
    if infJumpConn then infJumpConn:Disconnect() end
    infJumpConn = uis.JumpRequest:Connect(function()
        humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
    end)
end)

toggleBtn.MouseButton1Click:Connect(function()
    frame.Visible = not frame.Visible
end)

close.MouseButton1Click:Connect(function()
    gui:Destroy()
    if infJumpConn then infJumpConn:Disconnect() end
end)
