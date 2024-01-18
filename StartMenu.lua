--When creating a menu for your game the steps are as follow:
-- 1. In the explorer find the folder labled StarterGui.
-- 2. Add Main menu, add frame, add text button 
-- 3. modify the UI as desired, once complete, add the script below. 

local Gui = script.Parent.Parent

script.Parent.MouseButton1Click:Connect(function(clicked)
	Gui:TweenPosition(UDim2.new(0,0,1,0), "InOut", "Sine",3.5)
	for i = 1,25 do
		wait (0.05)
		game.Lighting.Blur.Size = game.Lighting.Blur.Size - 3
	end
end)
