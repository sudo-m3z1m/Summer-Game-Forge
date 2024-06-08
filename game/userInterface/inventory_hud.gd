extends Control

class_name InventoryHud

@export var inputs: Array[String]

@onready var animation_player: AnimationPlayer = $AnimationPlayer

func show_invntory() -> void:
	animation_player.play("AppearAnimation")

func _unhandled_input(event: InputEvent) -> void:
	for input in inputs:
		if event.is_action_pressed(input):
			check_input(input)

func check_input(input: String) -> void:
	pass
