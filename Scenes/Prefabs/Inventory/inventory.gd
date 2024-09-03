extends PanelContainer

const Slot = preload("res://Scenes/Prefabs/Inventory/Inventory slot.tscn")
@onready var grid_container: GridContainer = $MarginContainer/GridContainer

func _ready() -> void:
	var inv_data = preload("res://Scripts/Inventory_data.gd")

func populate_item_grid(slot_datas: Array[Slot_data]) -> void:
	for child in grid_container.get_children():
		child.queue_free()
		
	for slot_data in slot_datas:
		var slot = Slot.instantiate()
		grid_container.add_child(slot)
		if slot_data:
			slot.set_slot_data(slot_data)
