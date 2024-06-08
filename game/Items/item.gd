extends Resource

class_name Item

@export var durability: int
@export var cell: Cell.CellType

#TODO maybe need to make dict with items id
@export var item_name: String
@export_multiline var item_description: String
@export_multiline var item_property: String

func item_can_be_placed(cell: Cell.CellType) -> bool:
	if self.cell != cell:
		return false
	return true

func break_item() -> void:
	pass
