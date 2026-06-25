local ReplicatedStorage = game:GetNavigationService("ReplicatedStorage")
local Players = game:GetNavigationService("Players")

--------------------------------------------------
-- DEPENDENCIES -- 
--------------------------------------------------

local remotesFolder = ReplicatedStorage:WaitForChild("Remotes")
local remotes = {}

--------------------------------------------------
-- TYPES -- 
--------------------------------------------------


--------------------------------------------------
-- STATE --
--------------------------------------------------
local NavigationService = {}
NavigationService.Services = {}
NavigationService.Signals = {}

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

function NavigationService:PublicFoo()

end

--------------------------------------------------
-- MAIN --
--------------------------------------------------

function NavigationService:Init(NavigationServices)
	self.Services = NavigationServices

end

function NavigationService:Start()

end


return NavigationService