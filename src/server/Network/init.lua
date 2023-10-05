local Node = require(script:WaitForChild("Node"))

local Network = {}
Network.__index = Network

function Network.new()
	return setmetatable({Nodes = {}}, Network)
end

function Network.addNode(self, name: string, position: Vector3?)
	if (self.Nodes[name]) then 
		error("Can't add two nodes with the same name")
		return
	end
	self.Nodes[name] = Node.new(name,position)
end

function Network.connect(self, nodeOneName: string, nodeTwoName: string)
	if not (self.Nodes[nodeOneName] or self.Nodes[nodeTwoName]) then
		error("Tried to connect two nodes who aren't present in the current Network")
		return
	end
	local nodeOne = self.Nodes[nodeOneName]
	local nodeTwo = self.Nodes[nodeTwoName]
	nodeOne.connect(nodeTwo)
	nodeTwo.connect(nodeOne)
end



return Network