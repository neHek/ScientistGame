extends StaticBody3D
var vial_inside = null
@onready var machine = $".."

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

func interact():
	var inventory = get_tree().get_first_node_in_group('InventoryNode')
	# Inserting items
	if vial_inside == null and inventory.active_slot != -1 and inventory.storage[inventory.active_slot] != null and inventory.storage[inventory.active_slot].get('vial'):
		vial_inside = inventory.storage[inventory.active_slot]
		inventory.storage[inventory.active_slot] = null
		inventory._on_inventory_updated()
		vial_inside.global_position = $DropPoint.global_position
		vial_inside.global_rotation = $DropPoint.global_rotation
		vial_inside.find_child('CollisionShape3D').disabled = true
		vial_inside.set_global_rotation_degrees(Vector3(160,0,0))
		machine.state_update()
		return
	if vial_inside:
		if not inventory.pick_up(vial_inside):
			return
		vial_inside.find_child('CollisionShape3D').set_disabled(false)
		vial_inside = null
		machine.state_update()
