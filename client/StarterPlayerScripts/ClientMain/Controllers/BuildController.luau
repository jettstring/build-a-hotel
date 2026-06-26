local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")

--------------------------------------------------
-- DEPENDENCIES -- 
--------------------------------------------------

local player = Players.LocalPlayer
local playerGui = player.PlayerGui

local Modules = ReplicatedStorage.Modules
local ProfileTemplate = require(Modules.ProfileTemplate)


local GameAssets = ReplicatedStorage.GameAssets

-- BuildAssets
local BuildAssets = GameAssets.BuildAssets
local RoomDefinitions = require(BuildAssets.RoomDefinitions)
local BuildUtil = require(BuildAssets.BuildUtil)

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

type Profile = ProfileTemplate.ProfileTemplate
type SerializedRoom = ProfileTemplate.SerializedRoom
type PlotData = ProfileTemplate.PlotData

type RoomDefinition = RoomDefinitions.RoomDefinition


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