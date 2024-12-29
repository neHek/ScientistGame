extends Node3D
class_name Rat
# Initializing creature traits
func _ready():
	animation_randomizer()
	var traits = $Creature_traits
	print('Creature created: ', name)
	traits.set_type('rat') # Must initialize the type for any BASIC creature
	traits.print_traits()
	''' For testing
	var mutations = CreatureTypes.get(traits.base_creature)
	var possible_mutations = []
	for mutation in mutations:
		if traits.traits['size'] not in mutation.req['size']: continue
		if traits.traits['strength'] not in mutation.req['strength']: continue
		if traits.traits['intelligence'] not in mutation.req['intelligence']: continue
		if traits.traits['aggression'] not in mutation.req['aggression']: continue
		if traits.traits['cuteness'] not in mutation.req['cuteness']: continue
		if traits.traits['speed'] not in mutation.req['speed']: continue
		possible_mutations.append(mutation['name'])
	if not possible_mutations.is_empty():
		var mutation_picked = possible_mutations.pick_random()
		print(mutation_picked)
	#'''
	


func animation_randomizer():
	var AP = $AnimationPlayer
	AP.play("breathing_idle")
	AP.set_speed_scale(randf_range(.9,1))
	AP.seek(randf_range(0,3))
	
	var chance = randf_range(0,1)
	if roundf(chance):
		$AnimationPlayer.play("breathing2_idle")

