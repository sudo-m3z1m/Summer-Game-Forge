class_name HealthComponent extends Node

@export var model: Node3D
@export var health: int
@export_range(0, 5) var max_damage_take_height: float

@onready var target: Node3D = get_parent()

signal health_changed(delta)
signal health_end()

func damage(attack: Attack):
	health = max(health-attack.damage, 0)

	if health != 0:
		health_changed.emit(attack.damage)
		animate_damage_take()
	else:
		health_end.emit()

func animate_damage_take() -> void:
	var tween: Tween = create_tween()
	var default_height: float = model.global_position.y

	tween.tween_property(model, "global_position:y", default_height + max_damage_take_height, 0.1)
	tween.tween_property(model, "global_position:y", default_height, 0.3)
