extends Resource
class_name Request

var id: int
var customerName: String
var requestType: String
var details: Dictionary
var reward: int
var reputationImpact: float

func _init(id: int, customerName: String, requestType: String, details: Dictionary, reward: int, reputationImpact: int):
	self.id = id
	self.customerName = customerName
	self.requestType = requestType
	self.details = details
	self.reward = reward
	self.reputationImpact = reputationImpact


