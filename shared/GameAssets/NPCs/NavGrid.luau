local ReplicatedStorage = game:GetService("ReplicatedStorage")

--------------------------------------------------
-- DEPENDENCIES -- 
--------------------------------------------------

local GameAssets = ReplicatedStorage:WaitForChild("GameAssets")

-- NPC assets
local NPCAssets = GameAssets:WaitForChild("NPCs")
local Pathfinder = require(NPCAssets.Pathfinder)

--------------------------------------------------
-- TYPES -- 
--------------------------------------------------

type Cell = Pathfinder.Cell

--------------------------------------------------
-- MODULE -- 
--------------------------------------------------

local NavGrid = {}
NavGrid.__index = NavGrid

function NavGrid.new()
	local self = setmetatable({}, NavGrid)
	
	return self
end

return NavGrid
