extends RayCast3D

@onready var player: Player = get_node("../../../")
var interaction_ui: InteractionUI


func _ready() -> void:
	var level_canvas = player.level_canvas
	if level_canvas != null:
		interaction_ui = level_canvas.get_node("InteractionUI")


func _process(_delta) -> void:
	var colliding_obj = get_colliding_object()
	update_ui(colliding_obj)
	
	if colliding_obj != null:
		if Input.is_action_just_pressed("ui_interact"):
			colliding_obj.interact(player)


func get_colliding_object() -> Node3D:
	if !is_colliding(): return null
	
	var obj = get_collider()
	if obj == null: return null
	
	if obj.has_method("interact") and obj.get("interaction_hint") != null:
		return obj
	
	return null


func update_ui(colliding_object: Node3D) -> void:
	if interaction_ui == null: return 
	
	if colliding_object != null:
		interaction_ui.show_interaction(colliding_object.interaction_hint)
		return
	
	interaction_ui.hide_interaction()
