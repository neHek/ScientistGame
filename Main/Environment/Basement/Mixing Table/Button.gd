extends StaticBody3D
@onready var vial_slot = $"../VialStand"
@onready var ingredient_slot = $"../IngredientSlot"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func interact():
	# Spam avoidance
	if $"../AnimationPlayer".is_playing(): return
	
	$"../AnimationPlayer".play("Button_press")
	
	if vial_slot.vial_inside and ingredient_slot.ingredient_inside:
		for element in vial_slot.vial_inside.traits:
			vial_slot.vial_inside.traits[element] += ingredient_slot.ingredient_inside.traits[element]
		
