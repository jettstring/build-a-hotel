local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")

--------------------------------------------------
-- DEPENDENCIES -- 
--------------------------------------------------

local remotesFolder = ReplicatedStorage:WaitForChild("Remotes")
local remotes = {

	-- RFs
	EnterBuildMode = remotesFolder.Build.EnterBuildMode,
	AttemptPlaceRoom = remotesFolder.Build.AttemptPlaceRoom,
	AttemptDeleteRoom = remotesFolder.Build.AttemptDeleteRoom,
}

--------------------------------------------------
-- TYPES -- 
--------------------------------------------------


--------------------------------------------------
-- STATE --
--------------------------------------------------
local ServiceName = {}
ServiceName.Services = {}
ServiceName.Signals = {}

--------------------------------------------------
-- VARIABLES --
--------------------------------------------------

-- Constants

--------------------------------------------------
-- PRIVATE FUNCTIONS --
--------------------------------------------------

local function PrivateFoo()

end

--------------------------------------------------
-- PUBLIC FUNCTIONS --
--------------------------------------------------

function ServiceName:PlaceRoom(player: Player, roomName: string, targetCFrame: CFrame): Model?
	
end

--------------------------------------------------
-- MAIN --
--------------------------------------------------

function ServiceName:Init(services)
	self.Services = services

end

function ServiceName:Start()

end


return ServiceName