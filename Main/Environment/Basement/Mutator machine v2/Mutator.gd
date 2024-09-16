extends Node
@onready var creature_ind_ON = $Meshes/IndicatorCreatureON
@onready var left_slot = $LeftSlot
@onready var creature = left_slot.creature_inside
@onready var vial_slot = $VialSlot
@onready var vial = vial_slot.vial_inside
@onready var vial_ind_ON = $Meshes/IndicatorVialON
@onready var crature_scenes = get_all_in_folder("res://Main/Creatures/")
@onready var scene_root = $'..'

func get_all_in_folder(path):
	var items = {}
	var dir = DirAccess.open(path)
	
	if not dir:
		push_error("Invalid dir: " + path)
		return items  # Return an empty list if the directory is invalid
	
	print("Opening directory: ", path)
	dir.list_dir_begin()
	var file_name = dir.get_next()
	while file_name != "":
		# print("Found file: ", file_name)
		if dir.current_is_dir():
			items.merge(get_all_in_folder("res://Main/Creatures/" + str(file_name)))
		
		if !file_name.begins_with(".") and file_name.ends_with(".tscn"):
			var full_path = path + "/" + file_name
			# Remove .remap extension if present
			if full_path.ends_with(".remap"):
				full_path = full_path.substr(0, full_path.length() - 6)
			# print("Checking path: ", full_path)
			if ResourceLoader.exists(full_path):
				# print("Path exists: ", full_path)
				var res = ResourceLoader.load(full_path)
				if res:
					# print("Loaded resource: ", full_path)
					items[file_name] = res
				else:
					push_error("Failed to load resource: ", full_path)
			else:
				push_error("Resource does not exist: ", full_path)
		file_name = dir.get_next()
	dir.list_dir_end()
	return items

# This code will become a part of the "mutator machine", which takes an animal cage(starting_traits) 
# and a vial with chemicals(trait_change), changes the creature and checks if it matches any possible mutations

func _ready():
	state_update()

func mutate(): # Accepts a creature node and a "chemicals vial"
	var mutation_picked = null
	if not creature or not vial:
		return false
	
	print('-------\n', 'Mutating: ')
	var starting_traits = creature.find_child('Creature_traits').traits
	var type = creature.find_child('Creature_traits').base_creature
	# var starting_traits = {'size': randi_range(1, 5),           'strength': randi_range(1, 8),
	# 					   'intelligence': randi_range(1, 8),   'aggression': randi_range(1, 10),
	# 					   'cuteness': randi_range(5, 12),      'speed': randi_range(10, 35)}
	
	# var trait_change = {'size': randi_range(-50, 50),             'strength': randi_range(90, 90),
	# 					'intelligence': randi_range(-50, 50),     'aggression': randi_range(-50, 50),
	# 					'cuteness': randi_range(-50, 50),         'speed': randi_range(-50, 50)}
	
	var trait_change = vial.traits
	var new_traits = starting_traits
	for element in new_traits:
		new_traits[element] += trait_change[element]
		new_traits[element] = clamp(new_traits[element], 0, 100)
	
	var mutations = CreatureTypes.get(type)
	var possible_mutations = []
	for mutation in mutations:
		if new_traits['size'] not in mutation['req']['size']: continue
		if new_traits['strength'] not in mutation['req']['strength']: continue
		if new_traits['intelligence'] not in mutation['req']['intelligence']: continue
		if new_traits['aggression'] not in mutation['req']['aggression']: continue
		if new_traits['cuteness'] not in mutation['req']['cuteness']: continue
		if new_traits['speed'] not in mutation['req']['speed']: continue
		possible_mutations.append(mutation['name'])
	
	if possible_mutations.is_empty():
		print('\n', new_traits)
		print('No mutations found')
		print('-------\n')
		return
	
	mutation_picked = possible_mutations.pick_random()
	print('\n', new_traits)
	print(mutation_picked)
	
	# Spawning new creature
	var new_creature = mutation_picked + '.tscn'
	new_creature = crature_scenes[new_creature].instantiate()
	scene_root.add_child(new_creature)
	new_creature.global_transform = $CreatureOut.global_transform
	new_creature.find_child('Creature_traits').set_traits(new_traits)
	print('-------\nNew creature\'s traits: ', new_traits, '\n-------\n')
	# Deleting old creature
	creature.queue_free()
	left_slot.creature_inside = null
	state_update()



func state_update():
	# Update the state of the creature slot
	if left_slot.creature_inside:
		creature_ind_ON.visible = true
	else:
		creature_ind_ON.visible = false
	
	# Update the state of the vial slot
	if vial_slot.vial_inside:
		vial_ind_ON.visible = true
	else:
		vial_ind_ON.visible = false
		
	creature = left_slot.creature_inside
	vial = vial_slot.vial_inside

func interact():
	state_update()
	if creature and vial:
		mutate()


