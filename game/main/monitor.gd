class_name Monitor extends Node3D

@export var test_item: Item

@onready var item_description_screen: ItemDescriptionHud = %ItemDescription
@onready var reviews_screen: Control = %Reviews
@onready var inventory_screen: InventoryHud = %InventoryHud
@onready var current_screen: Control = reviews_screen
@onready var camera_marker: Marker3D = $CameraMarker

func _ready() -> void:
	display_inventory(test_item)

func change_current_screen(new_screen: Control) -> void:
	current_screen.hide()
	current_screen = new_screen
	current_screen.show()

func display_item_description(item: Item) -> void:
	change_current_screen(item_description_screen)
	current_screen.paste_item_info(item)

func display_reviews() -> void:
	change_current_screen(reviews_screen)

func display_inventory(new_item: Item) -> void:
	change_current_screen(inventory_screen)
	inventory_screen.show_inventory(new_item)
