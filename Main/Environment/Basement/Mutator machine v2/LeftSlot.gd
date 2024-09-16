extends StaticBody3D
var creature_inside = null
@onready var machine = $".."

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func interact():
	var inventory = get_tree().get_first_node_in_group('InventoryNode')
	# Inserting items
	if creature_inside == null and inventory.active_slot != -1 and inventory.storage[inventory.active_slot] != null and inventory.storage[inventory.active_slot].find_child('Creature_traits'):
		creature_inside = inventory.storage[inventory.active_slot]
		inventory.storage[inventory.active_slot] = null
		inventory._on_inventory_updated()
		creature_inside.global_position = $DropPoint.global_position
		creature_inside.global_rotation = $DropPoint.global_rotation
		machine.state_update()
		return
	if creature_inside and inventory.pick_up(creature_inside):
		creature_inside = null
		machine.state_update()
