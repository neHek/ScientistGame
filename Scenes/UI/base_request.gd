extends VBoxContainer

@onready var request_name = $"request head/HBoxContainer/Resquest name"
@onready var customer_name = $"request body/VBoxContainer/Customer name"
@onready var reward_text = $"request body/VBoxContainer/Reward"
@onready var description_text = $"request body/VBoxContainer/Description"
@onready var request_body = $"request body"
var resquestData
var is_request_open = false

# Called when the node enters the scene tree for the first time.
func _ready():
	request_name.text = "Name"
	customer_name.text = "John"
	reward_text.text = "123$"
	description_text.text = "Test contract"
	
	pass # Replace with function body.


func toggle_request_window():
	if is_request_open:
		is_request_open = false
		request_body.visible = false
		
	else:
		is_request_open = true
		request_body.visible = true
		
func _on_accept_btn_button_up():
	pass # Replace with function body.


func _on_reject_btn_button_up():
	pass # Replace with function body.


func _on_request_window_btn_button_up():
	toggle_request_window()
	print("AAAAAAAAAAAAAAHHHHHHHHH")
	pass # Replace with function body.
