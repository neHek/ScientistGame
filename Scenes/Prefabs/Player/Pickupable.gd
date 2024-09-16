extends Node3D
@export var Ui_texture: Texture2D

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.



func interact():
	var inventory = get_tree().get_nodes_in_group('InventoryNode')[0]
	inventory.pick_up(get_parent())
