extends Button

class_name Cell

@export var current_cell_type: CellType
@export var inventory_hud: InventoryHud

@onready var item_texture: TextureRect = $MarginContainer/TextureRect

var current_item: Item = Item.new()

enum CellType {
	HEAD,
	BODY,
	LEFT_HAND,
	RIGHT_HAND,
	LEGS
}

func _ready() -> void:
	pressed.connect(apply_cell_choice)
	current_item.cell = current_cell_type

func apply_cell_choice() -> void:
	if inventory_hud.new_item.cell != current_cell_type:
		return
	change_item(inventory_hud.new_item)
	inventory_hud.put_disk_to_drive()

func change_item(new_item: Item) -> void:
	current_item.break_item(inventory_hud.game_manager)
	current_item = new_item
	item_texture.texture = current_item.image
