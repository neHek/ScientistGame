extends RigidBody3D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func interact():
	var inventory = get_tree().get_nodes_in_group('InventoryNode')[0]
	inventory.pick_up(self)
	#var impulse = $"../Player".position.direction_to(position).normalized()*50
	#apply_central_force(impulse)


