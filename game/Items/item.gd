extends Resource

class_name Item

@export var durability: int = 1
@export var cell: Cell.CellType
@export var item_effect: ItemEffect

@export var image: Texture2D
@export var item_name: String
@export_multiline var item_description: String
@export_multiline var item_property: String

func item_can_be_placed(cell: Cell.CellType) -> bool:
	if self.cell != cell:
		return false
	return true

func damage(damage: int) -> bool:
	durability -= damage
	if durability > 0:
		return false
	return true

func break_item() -> void:
	pass

#TODO visualization of armor, armor taking damage and breaking items, armor attack properties
