local zombie = workspace:WaitForChild("Drooling Zombie")
local waypoints = workspace.Waypoitns

for waypoint = 1, #waypoints:GetChildren() do
	zombie.Humanoid:MoveTo(waypoints[waypoint].Position)
	zombie.Humanoid.MoveToFinished:Wait()
end
