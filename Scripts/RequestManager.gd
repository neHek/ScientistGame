extends Node
class_name RequestManager

var activeRequests: Array = []

func generateRequest(id: int, customerName: String, requestType: String, details: Dictionary, reward: int, reputationImpact: int) -> Request:
	var newRequest = Request.new(id, customerName, requestType, details, reward, reputationImpact)
	activeRequests.append(newRequest)
	return newRequest

func removeRequest(requestID: int) -> void:
	for request in activeRequests:
		if request.id == requestID:
			activeRequests.erase(request)
			break
#uses the ID to find the request
func getRequest(requestID: int) -> Request:
	for request in activeRequests:
		if request.id == requestID:
			return request
	return null
	
func acceptRequest(requestID: int) -> void:
	var request = getRequest(requestID)
	if request:
		print("Request accepted: ", request.customerName, " - ", request.details)
		# Perform additional actions related to accepting the request
		# Example: Increase player's money, update reputation, etc.
		removeRequest(requestID)
		
func rejectRequest(requestID: int) -> void:
	var request = getRequest(requestID)
	if request:
		print("Request rejected: ", request.customerName, " - ", request.details)
		# Perform additional actions related to rejecting the request
		# Example: Update reputation, log the rejection, etc.
		removeRequest(requestID)
