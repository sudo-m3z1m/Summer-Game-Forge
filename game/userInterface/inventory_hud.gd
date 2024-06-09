extends Control

class_name InventoryHud

@export var monitor: Monitor

@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var start_cell: Cell = $MarginContainer/Panel/VBoxContainer2/HBoxContainer/Cell

var new_item: Item = Item.new()

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("Quit"):
		hide_inventory()

func show_inventory(new_item: Item) -> void:
	animation_player.play("AppearAnimation")
	start_cell.grab_focus()
	self.new_item = new_item

func hide_inventory() -> void:
	monitor.display_reviews()
