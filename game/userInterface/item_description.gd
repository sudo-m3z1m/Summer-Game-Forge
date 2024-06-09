extends Control

class_name ItemDescriptionHud

@onready var name_label: Label = %ItemNameLabel
@onready var description_label: Label = %DescriptionTextLabel
@onready var durability_label: Label = %DurabilityTextLabel
@onready var property_label: Label = %PropertyTextLabel
@onready var animation_player: AnimationPlayer = $AnimationPlayer

func paste_item_info(item: Item) -> void:
	name_label.text = item.item_name
	description_label.text = item.item_description
	durability_label.text = str(item.durability)
	property_label.text = item.item_property
	animation_player.play("TextAnimation")
