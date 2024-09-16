# This node defines default traits for all creatures and provides methods for handling them

extends Node
class_name Creature_traits

# Default traits
@export var base_creature: String
@export var gender_male: bool = 1
@export var traits = {'size': 0, 'strength': 0, 'intelligence': 0, 'aggression': 0, 'cuteness': 0, 'speed': 0}

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Prints all traits for debugging
func print_traits():
	print('Base creature: ', base_creature)
	print('Male: ', gender_male)
	for element in traits:
		print(element, ': ', traits[element])

# Changes all traits by given value. Accepts dictionary
func trait_change(change: Dictionary):
	for element in change:
		traits[element] += change[element]
		traits[element] = clamp(traits[element], 0, 100)

func set_traits(change: Dictionary):
	for element in change:
		traits[element] = change[element]
		traits[element] = clamp(traits[element], 0, 100)

# Sets new base_creature and traits
func set_type(new_type: String):
	if new_type == 'rat':
		base_creature = 'rat'
		gender_male = randi_range(0, 1)
		traits = {'size': randi_range(1, 5),          'strength': randi_range(1, 8),
				  'intelligence': randi_range(1, 8),  'aggression': randi_range(10, 20),
				  'cuteness': randi_range(5, 12),     'speed': randi_range(10, 35)}
		return
	
	if new_type == 'bunny':
		base_creature = 'bunny'
		gender_male = randi_range(0, 1)
		traits = {'size': randi_range(1, 10),          'strength': randi_range(1, 10),
				  'intelligence': randi_range(1, 5),  'aggression': randi_range(1, 15),
				  'cuteness': randi_range(40, 90),     'speed': randi_range(25, 50)}
		return
	# More creature types need to be added here
	
	print('Non-existing creature type: ', new_type)
