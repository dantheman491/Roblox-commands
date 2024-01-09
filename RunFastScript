local UIS = game:GetService("UserInputService")

local player = game.Players.LocalPlayer

local walkSpeed = 20 --Change walk speed value here
local sprintSpeed = 37 --Change sprint speed value here

UIS.InputBegan:Connect(function(input, gameProccessedEvent)
	if input.KeyCode == Enum.KeyCode.LeftShift then
		player.Character.Humanoid.WalkSpeed = sprintSpeed
				for i = 1,5 do
					game.Workspace.CurrentCamera.FieldOfView = (90+(i*2)) -- change the 90 into a bigger number if you want bigger FOV or smaller if you want smaller FOV 
					wait()
				end
			end
		end)

UIS.InputEnded:Connect(function(input, gameProccessedEvent)
			if input.KeyCode == Enum.KeyCode.LeftShift then
				player.Character.Humanoid.WalkSpeed = walkSpeed
				for i = 1,5 do
					game.Workspace.CurrentCamera.FieldOfView = (100-(i*2)) -- change the 100 into your number for the previus FOV change and add ten so your number + 10
					wait()
				end
			end
		end)
