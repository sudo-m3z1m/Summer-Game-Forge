extends Control

class_name InventoryHud

@export var monitor: Monitor
@export var cells: Array[Cell]

@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var game_manager: GameManager = get_tree().current_scene.get_node("GameManager")
@onready var panel: PanelContainer = $MarginContainer/Panel

var new_item: Item = Item.new()

func _ready() -> void:
	update_inventory()

func _unhandled_input(event: InputEvent) -> void:
	pass
	#if event.is_action_pressed("Quit") and monitor.current_screen == self:
		#hide_inventory()

func show_inventory(new_item: Item) -> void:
	animation_player.play("AppearAnimation")
	cells[0].grab_focus()
	self.new_item = new_item

func hide_inventory() -> void:
	monitor.display_reviews()

func remove_item(item: Item) -> void:
	for cell in cells:
		if cell.current_item != item:
			continue
		var new_item: Item = Item.new()
		new_item.cell = item.cell
		cell.change_item(new_item)
		update_inventory()

func update_inventory() -> void:
	var items: Array[Item]
	for cell in cells:
		items.append(cell.current_item)
	game_manager.update_inventory_items(items)

func put_disk_to_drive() -> void:
	game_manager.turn.transition_to("PutFloppyDiskToDrive")
	SoundManager.play3d(preload("res://assets/audios/on.mp3"), "Sfx").global_position = monitor.global_position
