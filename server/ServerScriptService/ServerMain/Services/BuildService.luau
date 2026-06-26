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
	EnterBuildMode = remotesFolder.Build.EnterBuildMode,

	-- RFs
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

BuildService.PlayersInBuildMode = {} :: {[Player]: boolean}

--------------------------------------------------
-- VARIABLES --
--------------------------------------------------

-- Constants

--------------------------------------------------
-- PRIVATE FUNCTIONS --
--------------------------------------------------

local function _onPlayerRemoving(player: Player)
	if BuildService.PlayersInBuildMode[player] then BuildService.PlayersInBuildMode[player] = nil end
end

--------------------------------------------------
-- PUBLIC FUNCTIONS --
--------------------------------------------------

	

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

function BuildService:DeleteRoom(player: Player, serializedRoomData: SerializedRoom) end

function BuildService:LoadBuild(plot: Plot, plotBuildData: PlotData) end


function BuildService:ChangePlayerBuildState(player: Player, newState: boolean?): boolean
	if not player then return end
	
	newState = newState or not self.PlayersInBuildMode[player]
	
	if newState then
		if self.PlayersInBuildMode[player] then warn("[ChangePlayerBuildnewState] Player is already in build mode") return true end
		self.PlayersInBuildMode[player] = true
	else
		if self.PlayersInBuildMode[player] then self.PlayersInBuildMode[player] = nil end
	end
	
	remotes.EnterBuildMode:FireClient(player, newState)
	return newState
end

--------------------------------------------------
-- MAIN --
--------------------------------------------------

function BuildService:Init(services)
	self.Services = services

end

function BuildService:Start()
	
	remotes.EnterBuildMode.OnServerEvent:Connect(function(player, requestedState: boolean)
		local newState = self:ChangePlayerBuildState(player, requestedState)
		print("BuildService: Entered build mode:", newState)
	end)
end



return BuildService