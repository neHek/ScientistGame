extends Control

class_name InteractionUI

@onready var label: Label = get_node("Label")
@onready var point: TextureRect = get_node("Point")

var is_showing: bool = false


func show_interaction(text: String) -> void:
	if is_showing: return
	point.modulate = Color.WHITE
	label.text = "E - " + text
	is_showing = true


func hide_interaction() -> void:
	if !is_showing: return
	point.modulate = Color("acacacac")
	label.text = ""
	is_showing = false
