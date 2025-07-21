-- Vust Hub by You

-- References
local gui = script.Parent
local openButton = gui:WaitForChild("OpenButton")
local mainFrame = gui:WaitForChild("MainFrame")
local closeButton = mainFrame:WaitForChild("CloseButton")
local minimizeButton = mainFrame:WaitForChild("MinimizeButton")

local speedBoostButton = mainFrame:WaitForChild("SpeedBoostButton")
local jumpBoostButton = mainFrame:WaitForChild("JumpBoostButton")
local infiniteJumpButton = mainFrame:WaitForChild("InfiniteJumpButton")

-- Variables
local player = game.Players.LocalPlayer
local humanoid = player.Character:WaitForChild("Humanoid")
local speedBoostActive = false
local jumpBoostActive = false
local infiniteJumpActive = false

-- Default values
local defaultSpeed = 16
local defaultJump = 50

-- GUI Controls
mainFrame.Visible = false
openButton.Visible = true

openButton.MouseButton1Click:Connect(function()
	mainFrame.Visible = true
end)

minimizeButton.MouseButton1Click:Connect(function()
	mainFrame.Visible = false
end)

closeButton.MouseButton1Click:Connect(function()
	mainFrame.Visible = false
	openButton.Visible = false
end)

-- Speed Boost
speedBoostButton.MouseButton1Click:Connect(function()
	speedBoostActive = not speedBoostActive
	if speedBoostActive then
		humanoid.WalkSpeed = 100
		speedBoostButton.Text = "Speed Boost: ON"
	else
		humanoid.WalkSpeed = defaultSpeed
		speedBoostButton.Text = "Speed Boost: OFF"
	end
end)

-- Jump Boost
jumpBoostButton.MouseButton1Click:Connect(function()
	jumpBoostActive = not jumpBoostActive
	if jumpBoostActive then
		humanoid.JumpPower = 300
		jumpBoostButton.Text = "Jump Boost: ON"
	else
		humanoid.JumpPower = defaultJump
		jumpBoostButton.Text = "Jump Boost: OFF"
	end
end)

-- Infinite Jump
local UserInputService = game:GetService("UserInputService")
UserInputService.JumpRequest:Connect(function()
	if infiniteJumpActive then
		player.Character:FindFirstChildOfClass("Humanoid"):ChangeState(Enum.HumanoidStateType.Jumping)
	end
end)

infiniteJumpButton.MouseButton1Click:Connect(function()
	infiniteJumpActive = not infiniteJumpActive
	if infiniteJumpActive then
		infiniteJumpButton.Text = "Infinite Jump: ON"
	else
		infiniteJumpButton.Text = "Infinite Jump: OFF"
	end
end)
