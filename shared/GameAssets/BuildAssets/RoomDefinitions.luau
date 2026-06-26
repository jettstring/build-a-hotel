local ReplicatedStorage = game:GetService("ReplicatedStorage")

local GameAssets = ReplicatedStorage:WaitForChild("GameAssets")
local BuildAssets = GameAssets.BuildAssets
local RoomModels = BuildAssets.RoomModels

export type Room = {
	displayName: string,
	displayImage: string, 
	cost: number?,
}

export type GuestRoom = Room & {
	category: "GuestRoom",
	earningsPerNight: number,
}

export type Restaurant = Room & {
	category: "Restaurant",
	maxEarningsPerMeal: number,
	maxCustomers: number,
	maxStaff: number,
}

export type RoomDefinition = GuestRoom | Restaurant


local GuestRooms: {[string]: GuestRoom} = {
	["Standard"] = {
		category = "GuestRoom",
		displayName = "Standard Room",
		displayImage = "1234556787",
		cost = 100,
		earningsPerNight = 50,
	},
	
	["Premium"] = {
		category = "GuestRoom",
		displayName = "Premium Room",
		displayImage = "1234556787",
		cost = 500,
		earningsPerNight = 100,
	},
	
	["Suite"] = {
		category = "GuestRoom",
		displayName = "Suite Room",
		displayImage = "1234556787",
		cost = 1000,
		earningsPerNight = 150,
	},
}

local Restaurants: {[string]: Restaurant} = {
	
}

local ByCategory = {
	GuestRoom = GuestRooms,
	Restaurant = Restaurants,
}

local ByName = {}
for _, roomGroup in ByCategory :: {[string]: {[string]: RoomDefinition}} do
	for name, def in roomGroup do
		ByName[name] = def
	end
end

return {
	ByCategory = ByCategory,
	ByName = ByName,
}