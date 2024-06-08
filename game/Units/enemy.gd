extends Node3D

class_name Enemy

@export var attack_resource: Attack

func attack(target: Node3D) -> void:
	var target_health_point: HealthComponent = target.get_node("HealthComponent")
	target_health_point.damage(attack_resource)
