-- ✅ Only allow in Steal a Brainrot
if game.PlaceId ~= 16124729541 then
    warn("This script only works in Steal a Brainrot.")
    return
end

-- ✅ Wait for game and PlayerGui to load
repeat wait() until game:IsLoaded()
repeat wait() until game.Players.LocalPlayer and game.Players.LocalPlayer:FindFirstChild("PlayerGui")

-- ✅ Detect mobile vs PC
local isMobile = game:GetService("UserInputService").TouchEnabled
if isMobile then
    warn("Running on mobile.")
else
    warn("Running on PC.")
end

-- ✅ Setup references
local player = game.Players.LocalPlayer
local char = player.Character or player.CharacterAdded:Wait()
local humanoid = char:WaitForChild("Humanoid")

-- ✅ GUI Setup
local gui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
gui.Name = "BrainrotBoostGUI"
gui.ResetOnSpawn = false

-- Toggle Button
local toggleButton = Instance.new("TextButton", gui)
toggleButton.Size = UDim2.new(0, 120, 0, 40)
toggleButton.Position = UDim2.new(0, 10, 0.5, -20)
toggleButton.Text = "Vust Hub"
toggleButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
toggleButton.TextColor3 = Color3.fromRGB(255, 255, 255)
toggleButton.Font = Enum.Font.SourceSansBold
toggleButton.TextScaled = true

-- Main Frame
local mainFrame = Instance.new("Frame", gui)
mainFrame.Size = UDim2.new(0, 250, 0, 200)
mainFrame.Position = UDim2.new(0.5, -125, 0.5, -100)
mainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
mainFrame.Visible = false

-- Title Bar
local title = Instance.new("TextLabel", mainFrame)
title.Size = UDim2.new(1, 0, 0, 40)
title.Text = "Vust Hub - Brainrot"
title.TextColor3 = Color3.new(1, 1, 1)
title.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
title.Font = Enum.Font.SourceSansBold
title.TextScaled = true

-- Close Button
local closeButton = Instance.new("TextButton", mainFrame)
closeButton.Size = UDim2.new(0, 30, 0, 30)
closeButton.Position = UDim2.new(1, -35, 0, 5)
closeButton.Text = "X"
closeButton.TextColor3 = Color3.new(1, 1, 1)
closeButton.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
closeButton.Font = Enum.Font.SourceSansBold
closeButton.TextScaled = true

-- Function to create UI buttons
local function createButton(text, y)
	local btn = Instance.new("TextButton", mainFrame)
	btn.Size = UDim2.new(0.8, 0, 0, 40)
	btn.Position = UDim2.new(0.1, 0, 0, y)
	btn.Text = text
	btn.TextColor3 = Color3.new(1, 1, 1)
	btn.BackgroundColor3 = Color3.fromRGB(90, 90, 90)
	btn.Font = Enum.Font.SourceSansBold
	btn.TextScaled = true
	return btn
end

-- GUI Buttons
local jumpBoost = createButton("Jump Boost", 60)
local speedBoost = createButton("Speed Boost", 110)
local infJump = createButton("Infinite Jump", 160)

-- Button Functionality
jumpBoost.MouseButton1Click:Connect(function()
    humanoid.JumpPower = 300
end)

speedBoost.MouseButton1Click:Connect(function()
    humanoid.WalkSpeed = 100
end)

infJump.MouseButton1Click:Connect(function()
    if not getgenv().infJumping then
        getgenv().infJumping = true
        game:GetService("UserInputService").JumpRequest:Connect(function()
            if getgenv().infJumping and humanoid then
                humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
            end
        end)
    end
end)

-- Toggle and Close Logic
toggleButton.MouseButton1Click:Connect(function()
    mainFrame.Visible = not mainFrame.Visible
end)

closeButton.MouseButton1Click:Connect(function()
    gui:Destroy()
    getgenv().infJumping = false
end)
