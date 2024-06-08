extends Panel

class_name Cell

@export var current_cell_type: CellType

var current_item: Item = Item.new()

enum CellType {
	HEAD,
	BODY,
	LEFT_HAND,
	RIGHT_HAND,
	LEGS
}

func change_item(new_item: Item) -> void:
	if new_item.cell != current_cell_type:
		return
	current_item.break_item()
	current_item = new_item
	return
