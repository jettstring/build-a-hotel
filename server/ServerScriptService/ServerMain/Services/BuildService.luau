local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")

--------------------------------------------------
-- DEPENDENCIES -- 
--------------------------------------------------

local Modules = ReplicatedStorage.Modules
local ProfileTemplate = require(Modules.ProfileTemplate)

local GameAssets = ReplicatedStorage.GameAssets

-- Build Assets
local BuildAssets = GameAssets.BuildAssets
local RoomDefinitions = require(BuildAssets.RoomDefinitions)
local BuildUtil = require(BuildAssets.BuildUtil)

-- Plot Assets
local PlotsFolder = workspace.Plots
local PlotAssets = GameAssets.PlotAssets
local Plot = require(PlotAssets.Plot)


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

type Plot = Plot.PlotObject

type RoomDefinition = RoomDefinitions.RoomDefinition


--------------------------------------------------
-- STATE --
--------------------------------------------------
local BuildService = {}
BuildService.Services = {}
BuildService.Signals = {}

--------------------------------------------------
-- VARIABLES --
--------------------------------------------------

-- Constants

--------------------------------------------------
-- PRIVATE FUNCTIONS --
--------------------------------------------------

local function _onPlayerRemoving(player: Player)
	-- TODO: auto save build
end

--------------------------------------------------
-- PUBLIC FUNCTIONS --
--------------------------------------------------

function BuildService:LoadBuild(plot: Plot, plotBuildData: PlotData)
	
end

function BuildService:CreateRoom(player: Player, serializedRoomData: SerializedRoom)
	-- resolve player plot
	
	-- validate serializedRoomData
	
	-- clone build model 
	
	-- store model into player plot 
	
end

function BuildService:PlaceRoom(player: Player, roomName: string, targetCFrame: CFrame): Model?
	
	-- validate, etc
	
	-- write serializedRoomData to player profile 
	
	-- call self:CreateRoom(player, serializedRoomData) to render/create room model
	
end

function BuildService:DeleteRoom(player: Player, serializedRoomData: SerializedRoom)
	
end

--------------------------------------------------
-- MAIN --
--------------------------------------------------

function BuildService:Init(services)
	self.Services = services

end

function BuildService:Start()
	
	
end


return BuildService