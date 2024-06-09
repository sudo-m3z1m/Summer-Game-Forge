class_name ItemEffect extends Resource

@export var attack: Attack = Attack.new()

func apply_effect(target: Enemy) -> void:
	target.health_component.damage(attack)

