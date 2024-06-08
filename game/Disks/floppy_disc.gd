extends Node3D

class_name FloppyDisc

@export var item: Item
@export_range(0, 5) var max_selection_height: float

@onready var model: Node3D = $Model

#func place_item(item_cell: Item.ItemCell, inventory_cell: InventoryCell) -> void:
	#if !item.item_can_be_placed(inventory_cell):
		#return
	#inventory_cell.put_item()

func animate_selection(is_selected: bool) -> void:
	var tween: Tween = create_tween()
	tween.tween_property(model, "position:y", Vector3.ZERO.y + \
	max_selection_height * int(is_selected), 0.3)
