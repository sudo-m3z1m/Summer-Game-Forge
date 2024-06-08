extends Control

class_name InventoryHud

@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var start_cell: Cell = $MarginContainer/Panel/VBoxContainer2/HBoxContainer/Cell

func _ready() -> void:
	start_cell.grab_focus()

func show_invntory() -> void:
	animation_player.play("AppearAnimation")
