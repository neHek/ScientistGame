extends Node

@onready var DialogWindow = $Interface/MarginContainer/HBoxContainer/VBoxContainer/GridContainer
@onready var ConversationLine = $Interface/MarginContainer/HBoxContainer/VBoxContainer/GridContainer/ConversationLine
@onready var Response1 = $Interface/MarginContainer/HBoxContainer/VBoxContainer/GridContainer/Response1
@onready var Response2 = $Interface/MarginContainer/HBoxContainer/VBoxContainer/GridContainer/Response2
@onready var Response3 = $Interface/MarginContainer/HBoxContainer/VBoxContainer/GridContainer/Response3
var responses = [Response1, Response2, Response3]
var dialog_start = null
var dialog_current = null
func reset_conv():
	dialog_current = null
	$Interface.visible = false
	$Interface/MarginContainer/HBoxContainer/VBoxContainer/GridContainer/Response1.visible = false
	$Interface/MarginContainer/HBoxContainer/VBoxContainer/GridContainer/Response2.visible = false
	$Interface/MarginContainer/HBoxContainer/VBoxContainer/GridContainer/Response3.visible = false

func start_conversation(conversation = dialog_start):
	reset_conv()
	
	#Leave conversation
	if conversation == null:
		Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
		return
	
	if Input.mouse_mode != Input.MOUSE_MODE_VISIBLE: Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
	$Interface.visible = true
	dialog_current = conversation
	
	ConversationLine.text = conversation.line
	for item in conversation.response: #Holy shit this is ugly
		if conversation.response.find(item) == 0:
			Response1.visible = true
			Response1.text = item
		if conversation.response.find(item) == 1:
			Response2.visible = true
			Response2.text = item
		if conversation.response.find(item) == 2:
			Response3.visible = true
			Response3.text = item
		
func make_choice(choice : int):
	print('Option chosen: ', choice)
	dialog_current.response_events[choice].call()
	start_conversation(dialog_current.links[choice])


func _ready():
	# All dialogs are placed here. Root of the dialog tree is at the bottom
	# Dialog constructor: func _init (line:String, response:Array, links:Array, 
	# response1_func:Callable = func placeholder1(): pass, response2_func:Callable = func placeholder2(): pass, 
	# response3_func:Callable = func placeholder3(): pass)
	
	var battle = func battle():
		get_tree().get_first_node_in_group('player').velocity += Vector3(100,15,13)
	var fight = Dialog.new('You chose death.', ['Die'], [null], battle)
	var surrender = Dialog.new('Come with me.', ['Follow him', 'Backstab!', 'Start the gay quest line'], [null, null, null])
	var start = Dialog.new('Hey! Stop right there, criminal scum!', ['Surrender', 'Fight'], [surrender, fight])
	dialog_start = start 
