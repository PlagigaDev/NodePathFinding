local node = {}
node.__index = node


function node.new(name: string, position: Vector3)
	return setmetatable({connections = {}, name = name, position = position or Vector3.zero}, node)
end

function node.connect(self, node, weight: number?)
	if (self.connections[node.name]) then 
		error("Can't add two nodes with the same name")
		return
	end
	self.connections[node.name] = {Node = node, Weight = weight or 0}
end

function node.disConnect(self, node)
	self.connections[node.name] = nil
end

function node.setPosition(self, position: Vector3)
	self.position = position
end

function node.distance(self, point: Vector3): number
	return (self.position-point).magnitude
end


return node