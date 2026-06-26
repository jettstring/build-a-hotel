local ReplicatedStorage = game:GetService("ReplicatedStorage")

local GameAssets = ReplicatedStorage.GameAssets
local BuildUtil = require(GameAssets.BuildAssets.BuildUtil)

local ProfileTemplate = {
	PlotData = {} :: PlotData,
}

export type ProfileTemplate = typeof(ProfileTemplate) 


export type SerializedRoom = {
	id: string,
	roomName: string,
	floor: number, -- floor number room sits on
	positionStartIndex: number, -- signed integer representing position along floor x axis
}

export type PlotData = {
	placedRooms: { SerializedRoom }
}

return ProfileTemplate
