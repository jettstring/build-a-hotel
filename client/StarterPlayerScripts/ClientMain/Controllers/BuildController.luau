local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")

--------------------------------------------------
-- DEPENDENCIES -- 
--------------------------------------------------

local player = Players.LocalPlayer
local playerGui = player.PlayerGui

-- UI
local Displays = playerGui:WaitForChild("Displays")
local buildDisplay = Displays.BuildDisplay
--..
local ScreenElements = playerGui:WaitForChild("ScreenElements")
local hotbar = ScreenElements.Hotbar
local buildHotbarButton = hotbar.BuildMode


local Inputs = ReplicatedStorage.Inputs
local BuildContext = Inputs.BuildContext

local Modules = ReplicatedStorage.Modules
local ProfileTemplate = require(Modules.ProfileTemplate)


-- Build Assets
local GameAssets = ReplicatedStorage.GameAssets
local BuildAssets = GameAssets.BuildAssets
local RoomDefinitions = require(BuildAssets.RoomDefinitions)
local BuildUtil = require(BuildAssets.BuildUtil)

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


local function updateBuildState(state: boolean)
	buildDisplay.Visible = state
	
	-- Update hotbar button
	buildHotbarButton.TitleLabel.Text = state and "Exit" or "Build"
	buildHotbarButton.IconLabel.Image = "rbxassetid://" .. (state and "115651323947063" or "132401873380607")
	buildHotbarButton.BlueGradient.Enabled = not state
	buildHotbarButton.RedGradient.Enabled = state
	
end

local function _connectInputs()
	BuildContext.EnterBuildMode.Pressed:Connect(function()
		remotes.EnterBuildMode:FireServer()
	end)
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
	
	_connectInputs()
end

function BuildController:Start()
	
	remotes.EnterBuildMode.OnClientEvent:Connect(updateBuildState)
end


return BuildController