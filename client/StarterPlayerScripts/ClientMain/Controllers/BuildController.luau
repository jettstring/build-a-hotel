local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")

--------------------------------------------------
-- DEPENDENCIES -- 
--------------------------------------------------

local player = Players.LocalPlayer
local playerGui = player.PlayerGui


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
local BuildController = {}
BuildController.Controllers = {}
BuildController.Signals = {}

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

function BuildController:PublicFoo()

end

--------------------------------------------------
-- MAIN --
--------------------------------------------------

function BuildController:Init(controllers)
	self.Controllers = controllers

end

function BuildController:Start()

end


return BuildController