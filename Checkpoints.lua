local DatastoreService = game:GetService("DataStoreService")
local stageStore = DatastoreService:GetDataStore("PlayerStageDataStore")
--create a folder in workspace called CheckPoints. then create a script and name it CheckpointScript. Then add a part and name it 0 then duplicate and continue the succession before continuing to add this code. 
function plrToStage(plr)
	repeat wait() until plr.Character.HumanoidRootPart
	
	
	local stagePart = game.Workspace.Checkpoints:FindFirstChild(tostring(plr.leaderstats.Stage.Value))
	
	plr.Character.HumanoidRootPart.CFrame = stagePart.CFrame + Vector3.new(0,2.5,0)
end

game.Players.PlayerAdded:Connect(function(player)
	local leaderstats = Instance.new("Folder")
	leaderstats.Name = "leaderstats"
	leaderstats.Parent = player
	
	local stage = Instance.new("IntValue")
	stage.Name = "Stage"
	stage.Parent = leaderstats
	
	local success, errorMsg = pcall(function()
		stage.Value = stageStore:GetAsync(player.UserId)
	end)
	
	if success then
			print("Successfully got "..player.name.."'s stage data.")
		else 
			warn(errorMsg)
			end
		
		if player.Character then
			plrToStage(player)
		end
		
		player.CharacterAdded:Connect(function()
			plrToStage(player)
		end)
end)


game.Players.PlayerRemoving:Connect(function(player)
	local success, errorMsg = pcall(function()
		stageStore:SetAsync(player.UserId,player.leaderstats.Stage.Value)
	end)
	
	if success then
		print("Successfully saved "..player.Name.."'s stage data")
		
		else 
			warn(errorMsg)
	end
end)

for _, checkpoint in pairs(game.Workspace.Checkpoints:GetChildren()) do
	checkpoint.Touched:Connect(function(hit)
		if hit.parent:FindFirstChild("Humanoid") then
			local player = game.Players:GetPlayerFromCharacter(hit.parent)
			
			local checkpointNumber = tonumber(checkpoint.Name)
			
			if player.leaderstats.Stage.Value < checkpointNumber then
				player.leaderstats.Stage.Value = checkpointNumber
			end
		end
	end)
end
