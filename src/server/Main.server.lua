local mob = require(script.Parent.Modules.Mob)
local map = workspace.Grassland

for wave = 1, 5 do
	print("WAVE STARTING", wave)
	if wave < 5 then
		mob.Spawn("Zombie", 3 * wave, map)
	elseif wave == 5 then
		mob.Spawn("Zombie", 100, map)
	end

	repeat
		task.wait(1)
	until #map.Mob:GetChildren() == 0

	print("WAVE ENDED")
	task.wait(1)
end
