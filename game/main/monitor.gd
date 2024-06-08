class_name Monitor extends Node3D

@onready var item_description_screen: ItemDescriptionHud = %ItemDescription
@onready var reviews_screen: Control = %Reviews

var current_screen: Control

func change_current_screen(new_screen: Control) -> void:
	current_screen.hide()
	current_screen = new_screen
	current_screen.show()

func display_item_description(item: Item) -> void:
	change_current_screen(item_description_screen)
	current_screen.paste_item_info(item)

func display_reviews() -> void:
	change_current_screen(reviews_screen)
