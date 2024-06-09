extends Control

class_name InventoryHud

@export var monitor: Monitor
@export var game_manager: GameManager
@export var cells: Array[Cell]

@onready var animation_player: AnimationPlayer = $AnimationPlayer

var new_item: Item = Item.new()

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("Quit"):
		hide_inventory()

func show_inventory(new_item: Item) -> void:
	animation_player.play("AppearAnimation")
	cells[randi() % cells.size()].grab_focus()
	self.new_item = new_item

func hide_inventory() -> void:
	monitor.display_reviews()

func update_inventory() -> void:
	var items: Array[Item]
	for cell in cells:
		items.append(cell.current_item)
	game_manager.update_inventory_items(items)
