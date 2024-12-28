extends StaticBody3D
var ingredient_inside = null

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func interact():
	var inventory = get_tree().get_first_node_in_group('InventoryNode')
	# Inserting items
	if ingredient_inside == null and inventory.active_slot != -1 and inventory.storage[inventory.active_slot] != null and inventory.storage[inventory.active_slot].get('mutagen_ingredient'):
		ingredient_inside = inventory.storage[inventory.active_slot]
		inventory.storage[inventory.active_slot] = null
		inventory._on_inventory_updated()
		ingredient_inside.global_position = $Dropoff.global_position
		ingredient_inside.global_rotation = $Dropoff.global_rotation
		ingredient_inside.find_child('CollisionShape3D').disabled = true
		return
	if ingredient_inside:
		if not inventory.pick_up(ingredient_inside):
			return
		ingredient_inside.find_child('CollisionShape3D').set_disabled(false)
		ingredient_inside = null
