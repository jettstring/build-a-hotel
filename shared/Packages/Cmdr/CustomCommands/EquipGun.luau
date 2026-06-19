local ReplicatedStorage = game:GetService("ReplicatedStorage")

local WeaponDefinitions = require(ReplicatedStorage.GameAssets.WeaponAssets.WeaponDefinitions)
local MutationDefinitions = require(ReplicatedStorage.GameAssets.WeaponAssets.MutationDefinitions)

function getAllMutations(): {string}
	local mutations: {string} = {}

	for name: string in pairs(MutationDefinitions.RollChances) do
		table.insert(mutations, name)
	end

	table.sort(mutations)

	return mutations
end

function getAllNames(): {string}
	local results: {{name: string, order: number}} = {}

	for name: string, data in pairs(WeaponDefinitions) do
		table.insert(results, {name = name, order = data.odds or 0})
	end

	table.sort(results, function(a, b)
		if a.order == b.order then
			return a.name > b.name
		end

		return a.order > b.order
	end)

	local sortedNames: {string} = {}
	for _, entry in ipairs(results) do
		table.insert(sortedNames, entry.name)
	end

	return sortedNames
end
return {
	Name = "givegun";
	Aliases = {};
	Description = "Give a gun.";
	Group = "DefaultAdmin";
	Args = {
		function(context)
			return {
				Type = context.Cmdr.Util.MakeEnumType("Gun", getAllNames()),
				Name = "Gun";
				Description = "Gun to give.";
			}
		end,
		function(context)
			return {
				Type = "player",
				Name = "player";
				Description = "The player to give the gun to.";
				Default = context.Executor
			}
		end,
		function(context)
			return {
				Type = context.Cmdr.Util.MakeListableType(context.Cmdr.Util.MakeEnumType("Mutation", getAllMutations())),
				Name = "mutations";
				Description = "Mutation(s) to apply to the gun (comma-separated).";
				Optional = true;
			}
		end,
		function(context)
			return {
				Type = "number",
				Name = "xp";
				Description = "Amount of XP to give the gun.";
				Optional = true;
			}
		end
	};
}
