extends Node3D

class_name FloppyDisk

@export var item: Item
@export_range(0, 5) var max_selection_height: float

@onready var model: Node3D = $Model

#func place_item(item_cell: Item.CellType, inventory_cell: InventoryCell) -> void:
	#if !item.item_can_be_placed(inventory_cell):
		#return
	#inventory_cell.put_item() #TODO need to make uncomment this after creating inventory class with cells

var is_selected: bool = false
func animate_selection(is_selected: bool) -> void:
	self.is_selected = is_selected
	var tween: Tween = create_tween()
	tween.tween_property(model, "position:y", Vector3.ZERO.y + \
	max_selection_height * int(is_selected), 0.3)
