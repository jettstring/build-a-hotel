local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")

local Signal = require(ReplicatedStorage.Packages.Signal)

--------------------------------------------------
-- DEPENDENCIES -- 
--------------------------------------------------

local player = Players.LocalPlayer


local PlotsFolder = workspace:WaitForChild("Plots")

-- Plot Assets
local GameAssets = ReplicatedStorage:WaitForChild("GameAssets")
local PlotAssets = GameAssets.PlotAssets
local Plot = require(PlotAssets.Plot)


local remotesFolder = ReplicatedStorage:WaitForChild("Remotes")
local remotes = {
	
}

--------------------------------------------------
-- TYPES -- 
--------------------------------------------------


--------------------------------------------------
-- STATE --
--------------------------------------------------
local PlotController = {}
PlotController.Controllers = {}
PlotController.Signals = {
	PlotAssigned = Signal.new(),
}

--------------------------------------------------
-- VARIABLES --
--------------------------------------------------

-- Constants

--------------------------------------------------
-- PRIVATE FUNCTIONS --
--------------------------------------------------

local function _setupPlot()
	local plotFolder = PlotController:GetPlotFolder()
	if not plotFolder then
		warn("[_setupPlot] No plot folder found")
		return
	end
	
	
	-- fire plot assignment signal
	PlotController.Signals.PlotAssigned:Fire()
	
	print(plotFolder)
end

--------------------------------------------------
-- PUBLIC FUNCTIONS --
--------------------------------------------------

function PlotController:GetPlotFolder(): Folder
	local plotAssigned: number = player:GetAttribute("PlotAssigned")
	if not plotAssigned then
		warn("[GetPlotFolder] No plot number assigned")
		return
	end
	
	local plotFolder = PlotsFolder:FindFirstChild(tostring(plotAssigned))
	if not plotFolder then
		warn("[GetPlotFolder] No plot folder found for", plotAssigned)
	end
	
	return plotFolder
end

--------------------------------------------------
-- MAIN --
--------------------------------------------------

function PlotController:Init(controllers)
	self.Controllers = controllers

end

function PlotController:Start()
	-- wait for plot to be assigned
	player:GetAttributeChangedSignal("PlotAssigned"):Connect(_setupPlot)
	if player:GetAttribute("PlotAssigned") then _setupPlot() end
		
	
	
end


return PlotController