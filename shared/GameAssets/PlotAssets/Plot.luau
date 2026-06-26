local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")

local Trove = require(ReplicatedStorage.Packages.Trove)

--------------------------------------------------
-- DEPENDENCIES -- 
--------------------------------------------------

local GameAssets = ReplicatedStorage:WaitForChild("GameAssets")

-- Plot Assets
local BaseAssets = GameAssets.PlotAssets

--------------------------------------------------
-- TYPES -- 
--------------------------------------------------


--------------------------------------------------
-- MAIN -- 
--------------------------------------------------

local Plot = {}
Plot.__index = Plot

function Plot.new(ownerPlayer: Player, PlotFolder: Folder, services: any)
	local self = setmetatable({}, Plot)
	self.Services = services

	self.Owner = ownerPlayer
	self.PlotFolder = PlotFolder
	self.Trove = Trove.new()

	self.State = {
		Active = false,
	}

	self:_Setup()
	if not self.State.Active then
		warn("Plot is not active, destroying")
		self:Destroy()
		return nil
	end

	return self
end

--------------------------------------------------
-- SETUP -- 
--------------------------------------------------

function Plot:_Setup()
	local owner: Player = self.Owner
	local plotModel: Model = self.PlotFolder:FindFirstChild("Plot")
	
	-- Assign spawn to owner
	local spawnLocation = plotModel:WaitForChild("SpawnLocation")
	owner.RespawnLocation = spawnLocation
	if owner.Character then
		owner.Character:MoveTo(spawnLocation.Position + Vector3.new(0, 5, 0))
	end
	
	-- Update inital owner display
	self:UpdateOwnerDisplay()
	
	
	-- setup components
	
	
	self.PlotFolder:SetAttribute("Owner", owner.UserId)
	self.State.Active = true
end

--------------------------------------------------
-- ACTIONS -- 
--------------------------------------------------


function Plot:UpdateOwnerDisplay()
	local owner: Player = self.Owner
	local plotModel: Model = self.PlotFolder:FindFirstChild("Plot")
	local plotComponents = plotModel:WaitForChild("Components")
	
	-- 
	local NUMERALS = {"I", "II", "III"}
	local playerRank, rankTier = "Bronze", 1 -- TODO: read player ranking info
	local rankColor = ColorSequence.new{
		ColorSequenceKeypoint.new(0, Color3.fromRGB(209, 49, 0)),
		ColorSequenceKeypoint.new(1, Color3.fromRGB(93, 52, 25))
	}
	
	
	-- billboard
	local billboardGui = plotComponents.OwnerBillboard.BillboardGui
	local nameLabel = billboardGui.Display.NameLabel
	local avatarDisplay = billboardGui.Display.AvatarDisplay
	local rankDisplay = billboardGui.Display.RankDisplay
	local rankLabel = rankDisplay.RankLabel
	
	nameLabel.Text = owner.DisplayName
	
	local playerUserId = owner.UserId
	if playerUserId < 0 then playerUserId = 1 end -- set to roblox default pfp 
	local success, playerThumbnail = pcall(function()
		return Players:GetUserThumbnailAsync(playerUserId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size420x420)
	end)
	if success then
		avatarDisplay.Image = playerThumbnail
		avatarDisplay.Visible = true
	end

	rankLabel.Text = string.format("%s %s", playerRank, NUMERALS[rankTier])
	rankLabel.UIGradient.Color = rankColor
	
	
	
	-- plot sign
	
end

function Plot:Destroy()
	self.Trove:Destroy()
	self.PlotFolder:SetAttribute("Owner", nil)
	print("[Plot] Plot destroyed:", self.PlotFolder.Name)
end

--------------------------------------------------
-- HELPERS -- 
--------------------------------------------------



export type PlotObject = typeof(setmetatable({} :: {
	Owner: Player,
	PlotFolder: Folder,
	State: {},
}, Plot))

return Plot