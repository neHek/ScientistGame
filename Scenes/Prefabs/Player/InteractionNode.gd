#Raycast from player's camera and player himself needs to be linked for this to work

extends Node
var collider
@onready var InteractRay = $"../CameraController/InteractRay"
@onready var player = $".."

func _ready():
	pass # Replace with function body.


func _process(_delta):
	handle_interactions()

func handle_interactions():
	collider = InteractRay.get_collider()
	$"../InventoryNode/DebugLabel".text = collider.name if collider else ''
	
	# Picking up
	if Input.is_action_just_pressed("interact") and collider:
		var pickupable = collider.find_child('Pickupable')
		if pickupable:
			pickupable.interact()
			return
	
	# Interacting and pushing
		if collider.has_method('interact'):
			$"../InventoryNode/DebugLabel2".text = 'Interacted with ' + collider.name
			collider.interact()
		else: if collider is RigidBody3D:
				var impulse = player.position.direction_to(collider.position).normalized()*50
				collider.apply_central_force(impulse)
				$"../InventoryNode/DebugLabel2".text = 'Pushed ' + collider.name
