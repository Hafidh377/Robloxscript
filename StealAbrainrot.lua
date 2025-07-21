-- Steal a Brainrot GUI Script - PC & Mobile (KRNL & Arceus X)

if game.PlaceId ~= 16124729541 then
    return warn("Not in Steal a Brainrot. Script stopped.")
end

repeat wait() until game:IsLoaded()

local uis = game:GetService("UserInputService")
local plr = game.Players.LocalPlayer
local chr = plr.Character or plr.CharacterAdded:Wait()
local hum = chr:WaitForChild("Humanoid")

if plr.PlayerGui:FindFirstChild("VustHubUI") then
    plr.PlayerGui.VustHubUI:Destroy()
end

local gui = Instance.new("ScreenGui", plr.PlayerGui)
gui.Name = "VustHubUI"
gui.ResetOnSpawn = false

-- Toggle Button
local toggle = Instance.new("TextButton", gui)
toggle.Size = UDim2.new(0, 100, 0, 40)
toggle.Position = UDim2.new(0, 10, 0.5, -20)
toggle.Text = "Vust Hub"
toggle.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
toggle.TextColor3 = Color3.new(1, 1, 1)
toggle.Font = Enum.Font.GothamBold
toggle.TextScaled = true

-- Main Frame
local frame = Instance.new("Frame", gui)
frame.Size = UDim2.new(0, 220, 0, 200)
frame.Position = UDim2.new(0.5, -110, 0.5, -100)
frame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
frame.Visible = false

-- Title
local title = Instance.new("TextLabel", frame)
title.Size = UDim2.new(1, 0, 0, 40)
title.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
title.Text = "Vust Hub"
title.TextColor3 = Color3.new(1, 1, 1)
title.Font = Enum.Font.GothamBold
title.TextScaled = true

-- Close Button
local close = Instance.new("TextButton", frame)
close.Size = UDim2.new(0, 30, 0, 30)
close.Position = UDim2.new(1, -35, 0, 5)
close.Text = "X"
close.BackgroundColor3 = Color3.fromRGB(180, 0, 0)
close.TextColor3 = Color3.new(1, 1, 1)
close.Font = Enum.Font.GothamBold
close.TextScaled = true

-- Function to create buttons
local function makeButton(name, posY, callback)
    local btn = Instance.new("TextButton", frame)
    btn.Size = UDim2.new(0.8, 0, 0, 40)
    btn.Position = UDim2.new(0.1, 0, 0, posY)
    btn.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
    btn.Text = name
    btn.TextColor3 = Color3.new(1, 1, 1)
    btn.Font = Enum.Font.GothamBold
    btn.TextScaled = true
    btn.MouseButton1Click:Connect(callback)
end

-- Boost Buttons
makeButton("Jump Boost", 0.25, function() hum.JumpPower = 300 end)
makeButton("Speed Boost", 0.50, function() hum.WalkSpeed = 100 end)
makeButton("Infinite Jump", 0.75, function()
    if _G.InfJump then return end
    _G.InfJump = true
    uis.JumpRequest:Connect(function()
        if _G.InfJump then
            hum:ChangeState(Enum.HumanoidStateType.Jumping)
        end
    end)
end)

-- UI Logic
toggle.MouseButton1Click:Connect(function()
    frame.Visible = not frame.Visible
end)

close.MouseButton1Click:Connect(function()
    _G.InfJump = false
    gui:Destroy()
end)
