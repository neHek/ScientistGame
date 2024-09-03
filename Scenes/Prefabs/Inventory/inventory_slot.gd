extends PanelContainer

@onready var texture_rect: TextureRect = $MarginContainer/TextureRect

func set_slot_data(slot_data: Slot_data) -> void:
	var item_data = slot_data.item_data
	texture_rect.texture = item_data.texture
