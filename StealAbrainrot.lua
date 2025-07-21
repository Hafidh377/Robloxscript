-- ✅ Only allow in Steal a Brainrot
if game.PlaceId ~= 16124729541 then
    return
end

-- ✅ Wait for game & player to load
repeat wait() until game:IsLoaded() and game.Players.LocalPlayer and game.Players.LocalPlayer:FindFirstChild("PlayerGui")

local player = game.Players.LocalPlayer
local char = player.Character or player.CharacterAdded:Wait()
local humanoid = char:WaitForChild("Humanoid")
local UserInputService = game:GetService("UserInputService")
local isMobile = UserInputService.TouchEnabled

-- ✅ Remove old GUI if exists
pcall(function()
    player.PlayerGui:FindFirstChild("VustHub"):Destroy()
end)

-- ✅ Create GUI
local gui = Instance.new("ScreenGui")
gui.Name = "VustHub"
gui.Parent = player.PlayerGui
gui.ResetOnSpawn = false

-- ✅ Toggle Button
local toggleBtn = Instance.new("TextButton")
toggleBtn.Size = UDim2.new(0, 120, 0, 40)
toggleBtn.Position = UDim2.new(0, 10, 0.5, -20)
toggleBtn.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
toggleBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
toggleBtn.Text = "Vust Hub"
toggleBtn.Font = Enum.Font.GothamBold
toggleBtn.TextScaled = true
toggleBtn.Parent = gui

-- ✅ Main Frame
local mainFrame = Instance.new("Frame")
mainFrame.Size = UDim2.new(0, 250, 0, 220)
mainFrame.Position = UDim2.new(0.5, -125, 0.5, -110)
mainFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
mainFrame.Visible = false
mainFrame.Parent = gui

-- ✅ Title
local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, 0, 0, 40)
title.Text = "Vust Hub - Brainrot"
title.TextColor3 = Color3.new(1, 1, 1)
title.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
title.Font = Enum.Font.GothamBold
title.TextScaled = true
title.Parent = mainFrame

-- ✅ Close Button
local closeBtn = Instance.new("TextButton")
closeBtn.Size = UDim2.new(0, 30, 0, 30)
closeBtn.Position = UDim2.new(1, -35, 0, 5)
closeBtn.Text = "X"
closeBtn.TextColor3 = Color3.new(1, 1, 1)
closeBtn.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
closeBtn.Font = Enum.Font.GothamBold
closeBtn.TextScaled = true
closeBtn.Parent = mainFrame

-- ✅ Utility to make buttons
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
end

-- ✅ Boost Buttons
createBtn("Jump Boost", 0.25, function()
    humanoid.JumpPower = 300
end)

createBtn("Speed Boost", 0.45, function()
    humanoid.WalkSpeed = 100
end)

createBtn("Infinite Jump", 0.65, function()
    if not getgenv().infJump then
        getgenv().infJump = true
        UserInputService.JumpRequest:Connect(function()
            if getgenv().infJump then
                humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
            end
        end)
    end
end)

-- ✅ Toggle GUI open/close
toggleBtn.MouseButton1Click:Connect(function()
    mainFrame.Visible = not mainFrame.Visible
end)

-- ✅ Close GUI completely
closeBtn.MouseButton1Click:Connect(function()
    getgenv().infJump = false
    gui:Destroy()
end)
