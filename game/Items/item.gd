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
		prints(item_name, durability)
		return false
	return true

func break_item(game_manager: GameManager) -> void:
	if !(item_effect):
		return
	game_manager.apply_item_effect(item_effect)

#TODO visualization of armor, armor attack properties
