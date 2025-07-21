-- Steal a Brainrot Script (PC & Mobile) | Vust Hub - Toggle GUI
if game.PlaceId ~= 16124729541 then
    return warn("Not in Steal a Brainrot. Script stopped.")
end

repeat wait() until game:IsLoaded()

local Players = game:GetService("Players")
local CoreGui = game:GetService("CoreGui")
local UIS = game:GetService("UserInputService")

local plr = Players.LocalPlayer
local char = plr.Character or plr.CharacterAdded:Wait()
local hum = char:WaitForChild("Humanoid")

-- Remove old GUI
if CoreGui:FindFirstChild("VustHubUI") then
    CoreGui.VustHubUI:Destroy()
end

-- GUI
local gui = Instance.new("ScreenGui", CoreGui)
gui.Name = "VustHubUI"
gui.IgnoreGuiInset = true
gui.ResetOnSpawn = false

-- Vust Hub toggle button
local toggle = Instance.new("TextButton", gui)
toggle.Size = UDim2.new(0, 100, 0, 40)
toggle.Position = UDim2.new(0, 10, 0.5, -20)
toggle.Text = "Vust Hub"
toggle.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
toggle.TextColor3 = Color3.new(1, 1, 1)
toggle.Font = Enum.Font.GothamBold
toggle.TextScaled = true

-- Main frame (hidden at start)
local frame = Instance.new("Frame", gui)
frame.Size = UDim2.new(0, 250, 0, 200)
frame.Position = UDim2.new(0.5, -125, 0.5, -100)
frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
frame.Visible = false

-- Title
local title = Instance.new("TextLabel", frame)
title.Size = UDim2.new(1, 0, 0, 40)
title.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
title.Text = "Vust Hub"
title.TextColor3 = Color3.new(1, 1, 1)
title.Font = Enum.Font.GothamBold
title.TextScaled = true

-- Close button
local close = Instance.new("TextButton", frame)
close.Size = UDim2.new(0, 30, 0, 30)
close.Position = UDim2.new(1, -35, 0, 5)
close.Text = "X"
close.BackgroundColor3 = Color3.fromRGB(180, 0, 0)
close.TextColor3 = Color3.new(1, 1, 1)
close.Font = Enum.Font.GothamBold
close.TextScaled = true

-- Helper to create buttons
local function createButton(name, posY, callback)
    local btn = Instance.new("TextButton", frame)
    btn.Size = UDim2.new(0.8, 0, 0, 40)
    btn.Position = UDim2.new(0.1, 0, 0, posY)
    btn.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    btn.Text = name
    btn.TextColor3 = Color3.new(1, 1, 1)
    btn.Font = Enum.Font.GothamBold
    btn.TextScaled = true
    btn.MouseButton1Click:Connect(callback)
end

-- Features
createButton("Jump Boost", 50, function()
    hum.JumpPower = 300
end)

createButton("Speed Boost", 100, function()
    hum.WalkSpeed = 100
end)

createButton("Infinite Jump", 150, function()
    if _G.InfJump then return end
    _G.InfJump = true
    UIS.JumpRequest:Connect(function()
        if _G.InfJump then
            hum:ChangeState(Enum.HumanoidStateType.Jumping)
        end
    end)
end)

-- Button logic
toggle.MouseButton1Click:Connect(function()
    frame.Visible = true
end)

close.MouseButton1Click:Connect(function()
    _G.InfJump = false
    gui:Destroy()
end)
