local UserInputService = game:GetService ("UserInputService")
local Character = script.Parent
local Humanoid = Character:WaitForChild("Humanoid")

local HasDoubleJumped = false
local PreviousJump = tick()

local function DoubleJump() 
	if tick() - PreviousJump >= 0.2 then
		if Humanoid:GetState() == Enum.HumanoidStateType.Freefall and not HasDoubleJumped then
			HasDoubleJumped = true
			Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
		end
	end
end

Humanoid.StateChanged:Connect(function(Old, New)
	if New == Enum.HumanoidStateType. Landed then
		HasDoubleJumped = false
		elseif New == Enum.HumanoidStateType.Jumping then
		PreviousJump = tick ()
	end
end)

UserInputService.JumpRequest:Connect(DoubleJump)
