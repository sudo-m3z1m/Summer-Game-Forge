extends Resource

class_name Item

@export var cell: ItemCell

enum ItemCell { #TODO Need to unit with inventory class
	HEAD,
	BODY,
	HANDS,
	LEGS
	#FOOTS probably
}

func item_can_be_placed(cell: ItemCell) -> bool:
	if self.cell != cell:
		return false
	return true

func break_item() -> void:
	pass
