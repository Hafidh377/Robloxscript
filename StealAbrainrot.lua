-- ✅ Steal a Brainrot Vust Hub GUI (PC & Mobile)

-- Only run in correct game
if game.PlaceId ~= 16124729541 then
    return warn("You're not in Steal a Brainrot!")
end

repeat wait() until game:IsLoaded()

local plr = game:GetService("Players").LocalPlayer
local char = plr.Character or plr.CharacterAdded:Wait()
local hum = char:WaitForChild("Humanoid")
local UIS = game:GetService("UserInputService")

-- Clean up old GUI
pcall(function() game.CoreGui.VustHub:Destroy() end)

-- GUI Setup
local gui = Instance.new("ScreenGui", game.CoreGui)
gui.Name = "VustHub"
gui.ResetOnSpawn = false
gui.IgnoreGuiInset = true

-- Vust Hub Button
local openBtn = Instance.new("TextButton", gui)
openBtn.Size = UDim2.new(0, 120, 0, 40)
openBtn.Position = UDim2.new(0, 20, 0.5, -20)
openBtn.Text = "Vust Hub"
openBtn.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
openBtn.TextColor3 = Color3.new(1,1,1)
openBtn.Font = Enum.Font.GothamBold
openBtn.TextScaled = true

-- Main GUI Frame
local frame = Instance.new("Frame", gui)
frame.Size = UDim2.new(0, 300, 0, 250)
frame.Position = UDim2.new(0.5, -150, 0.5, -125)
frame.BackgroundColor3 = Color3.fromRGB(25,25,25)
frame.Visible = false

local title = Instance.new("TextLabel", frame)
title.Size = UDim2.new(1, 0, 0, 40)
title.Text = "Vust Hub"
title.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
title.TextColor3 = Color3.new(1, 1, 1)
title.Font = Enum.Font.GothamBold
title.TextScaled = true

-- Close Button
local closeBtn = Instance.new("TextButton", frame)
closeBtn.Size = UDim2.new(0, 30, 0, 30)
closeBtn.Position = UDim2.new(1, -35, 0, 5)
closeBtn.Text = "X"
closeBtn.BackgroundColor3 = Color3.fromRGB(200, 0, 0)
closeBtn.TextColor3 = Color3.new(1,1,1)
closeBtn.Font = Enum.Font.GothamBold
closeBtn.TextScaled = true

-- Feature Buttons
local function makeButton(text, yOffset, func)
    local b = Instance.new("TextButton", frame)
    b.Size = UDim2.new(0.8, 0, 0, 40)
    b.Position = UDim2.new(0.1, 0, 0, yOffset)
    b.Text = text
    b.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    b.TextColor3 = Color3.new(1,1,1)
    b.Font = Enum.Font.GothamBold
    b.TextScaled = true
    b.MouseButton1Click:Connect(func)
end

makeButton("Jump Boost", 60, function()
    hum.JumpPower = 300
end)

makeButton("Speed Boost", 110, function()
    hum.WalkSpeed = 100
end)

makeButton("Infinite Jump", 160, function()
    if _G.InfiniteJump then return end
    _G.InfiniteJump = true
    UIS.JumpRequest:Connect(function()
        if _G.InfiniteJump then
            hum:ChangeState(Enum.HumanoidStateType.Jumping)
        end
    end)
end)

-- Toggle Visibility
openBtn.MouseButton1Click:Connect(function()
    frame.Visible = true
end)

closeBtn.MouseButton1Click:Connect(function()
    _G.InfiniteJump = false
    gui:Destroy()
end)
