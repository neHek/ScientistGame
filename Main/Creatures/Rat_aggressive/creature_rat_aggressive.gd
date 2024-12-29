extends RigidBody3D


# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimationPlayer.play("breathing2_idle")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_animation_timer_timeout():
	var chance = randf_range(0,1)
	if chance > .7:
		$AnimationPlayer.play("hissing")

func _on_animation_finished(anim_name):
	if anim_name == 'hissing':
		$AnimationPlayer.play("breathing2_idle")
