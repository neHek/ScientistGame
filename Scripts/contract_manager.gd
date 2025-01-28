extends Node
var active_contracts = {}

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func rng_contract():
	var contract = {}
	contract.id = randi()
	contract.diff = randi_range(1,5) # Replace with difficulty derived from available materials
	contract.creature = CreatureTypes.discovered_types.pick_random()
	contract.price = str(roundi(contract.diff * randf_range(.9, 1.3) * 100))
	contract.customer = 'Your local zoo'
	contract.name = '%s for profit' % CreatureTypes.get(contract.creature)['name_readable']
	contract.desc = "Creature requested: %s, price offered: %s, expected difficulty: %s" % [CreatureTypes.get(contract.creature)['name_readable'], contract.price, contract.diff]
	return(contract)

func accept_contract(contract):
	if active_contracts.size() < 3:
		active_contracts[contract.id] = contract
		return true
	else:
		return false

func forfeit_contract(id):
	if active_contracts.has(id):
		print('Contract abandoned, ID: ' + str(id))
		active_contracts.erase(id)
		return true
	else:
		print('Contract ID %s was not found, cannot remove' % id)
		return false
