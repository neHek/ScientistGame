extends Node
class_name Dialog


var line : String = ''
var response : Array = [] # Up to 3 response strings
# Functions called on response
var response_one_func : Callable
var response_two_func : Callable
var response_three_func : Callable
# Links to next dialogs
var links : Array = [null, null, null]
var response_events = [response_one, response_two, response_three]
func response_one():
	response_one_func.call()
	print('Replied 1')
func response_two():
	response_two_func.call()
	print('Replied 2')
func response_three():
	response_three_func.call()
	print('Replied 3')


func _init(line:String, response:Array, links:Array, response1_func:Callable = func placeholder1(): pass, 
	response2_func:Callable = func placeholder2(): pass, response3_func:Callable = func placeholder3(): pass):
	
	self.line = line
	self.response = response
	self.response_one_func = response1_func
	self.response_two_func = response2_func
	self.response_three_func = response3_func
	self.links = links

func _debug():
	print('Line: ', line)
	print('Responses: ', response)

'''
func _ready():
	var gay = func gay():
		print('hi')
	var surrender = Dialog.new('Come with me.', ['Follow him', 'Backstab!', 'Start the gay quest line'], [null, null, null])
	var start = Dialog.new('Hey! Stop right there, criminal scum!', ['Surrender', 'fight'], [surrender, null], gay)
	start.response_one()
'''
