first comes the setup ReplicatedStorage
└── Projectile (Part – anchored = false, CanCollide = false)

StarterPack
└── ArmCannon (Tool)
    └── Script (handles firing)

Step 1: 
local tool = script.Parent
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local projectileTemplate = ReplicatedStorage:WaitForChild("Projectile")
local fireForce = 1000  -- Adjust based on game scale

tool.Activated:Connect(function()
	local character = tool.Parent
	local player = Players:GetPlayerFromCharacter(character)
	if not player then return end

	local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
	local rightArm = character:FindFirstChild("RightHand") or character:FindFirstChild("Right Arm")
	if not rightArm then return end

	-- Create a new projectile
	local projectile = projectileTemplate:Clone()
	projectile.CFrame = rightArm.CFrame * CFrame.new(0, 0, -2) -- Offset in front of the arm
	projectile.Velocity = rightArm.CFrame.LookVector * fireForce
	projectile.Parent = workspace

	-- Clean up after 5 seconds
	game.Debris:AddItem(projectile, 5)
end)


Step 2:

Step 2: Projectile Setup (Projectile in ReplicatedStorage)
Make sure the projectile has:

Anchored = false

CanCollide = false (or true if you want it to interact)

A BodyVelocity (optional for smoother motion)

Optionally a script to explode or deal damage on hit

  - (Optional) Add a script inside the projectile to detect hits
script.Parent.Touched:Connect(function(hit)
	if hit and hit.Parent and hit.Parent:FindFirstChild("Humanoid") then
		hit.Parent.Humanoid:TakeDamage(20)
	end
end)

  Step 3:

  Attaching the Cannon to Player Arm
You can attach the cannon visually by:

Welding it to RightHand or Right Arm inside the player’s character model

Use Motor6D if it needs to animate

Or place the Tool Handle where you want the cannon to show

    local canFire = true
local cooldown = 1 -- seconds

tool.Activated:Connect(function()
	if not canFire then return end
	canFire = false

	-- fire logic here

	task.wait(cooldown)
	canFire = true
end)
