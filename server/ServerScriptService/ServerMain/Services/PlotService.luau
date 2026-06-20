local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")

local Signal = require(ReplicatedStorage.Packages.Signal)
local Trove = require(ReplicatedStorage.Packages.Trove)


--------------------------------------------------
-- DEPENDENCIES -- 
--------------------------------------------------

local remotesFolder = ReplicatedStorage:WaitForChild("Remotes")
local remotes = {
	
	-- RFs
	GetPlot = remotesFolder.Plot.GetPlot,
}

--------------------------------------------------
-- TYPES -- 
--------------------------------------------------


--------------------------------------------------
-- STATE --
--------------------------------------------------
local PlotService = {} 
PlotService.Services = {}
PlotService.Signals = {
	PlotAssigned = Signal.new(),
}

--------------------------------------------------
-- VARIABLES --
--------------------------------------------------

-- Constants

--------------------------------------------------
-- PRIVATE FUNCTIONS --
--------------------------------------------------

local function assignPlot(player: Player) 
	

end

--------------------------------------------------
-- PUBLIC FUNCTIONS --
--------------------------------------------------

function PlotService:PublicFoo()

end

--------------------------------------------------
-- MAIN --
--------------------------------------------------

function PlotService:Init(services)
	self.Services = services

end

function PlotService:Start()

end


return PlotService