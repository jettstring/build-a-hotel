local ServerScriptService = game:GetService("ServerScriptService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local InventoryService = require(ServerScriptService.ServerMain.Services.InventoryService)
local InventoryUtil = require(ReplicatedStorage.Util.InventoryUtil)

return function (context, gun: string, player: Player, mutations: {string}?, xp: number?)
	-- Cmdr passes a listable enum as an array of names; fold it into the
	-- {[name]: boolean} set that AddWeapon stores.
	local mutationSet: InventoryUtil.Mutations? = nil
	if mutations and #mutations > 0 then
		mutationSet = {}
		for _, name in mutations do
			mutationSet[name] = true
		end
	end

	-- A weapon only becomes a unique entry (one that stores mutations/xp/level)
	-- when it has a level; otherwise AddWeapon stacks it and ignores both.
	local hasOverrides = mutationSet ~= nil or xp ~= nil
	local resolvedXP = xp or 0

	local weaponKey = InventoryService:AddWeapon(player, {
		weaponName = gun,
		mutations = mutationSet,
		level = if hasOverrides then InventoryUtil.getLevelFromXP(resolvedXP) else nil,
		xp = if hasOverrides then resolvedXP else nil,
	})
	if not weaponKey then
		return `Failed to give {gun} to {player.Name}.`
	end

	if not InventoryService:EquipWeapon(player, weaponKey) then
		return `Added {gun} to {player.Name}, but failed to equip it.`
	end

	return `Gave and equipped {gun} for {player.Name}.`
end
