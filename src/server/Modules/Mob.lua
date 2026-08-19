local ServerStorage = game:GetService("ServerStorage")

local mob = {}

function mob.Move(mob, map)
	local humanoid = mob:WaitForChild("Humanoid")
	local waypoints = map.Waypoints:GetChildren()

	table.sort(waypoints, function(a, b)
		return tonumber(a.Name) < tonumber(b.Name)
	end)

	for _, waypoint in ipairs(waypoints) do
		humanoid:MoveTo(waypoint.Position)
		humanoid.MoveToFinished:Wait()
	end

	mob:Destroy()
end

function mob.Spawn(name, quantity, map)
	local mobExists = ServerStorage.Mobs:FindFirstChild(name)

	if mobExists then
		for i = 1, quantity do
			task.wait(0.5)
			local newMob = mobExists:Clone()
			newMob.HumanoidRootPart.CFrame = map.Start.CFrame
			newMob.Parent = map.Mob

			task.spawn(function()
				mob.Move(newMob, map)
			end)
		end
	else
		warn("Requested mob does not exist:", name)
	end
end

return mob
