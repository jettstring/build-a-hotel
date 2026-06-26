local Placer = {}
Placer.__index = Placer

function Placer.new()
	local self = setmetatable({}, Placer)
	
	return self
end

return Placer
