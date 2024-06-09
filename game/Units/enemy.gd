extends Unit

class_name Enemy

@export var attack_resource: Attack
@export var idle_animations: Array[String]

func attack(target: Node3D) -> void:
	var target_health_component: HealthComponent = target.get_node("HealthComponent")
	target_health_component.damage(attack_resource)
	animation_player.play("Attack")

func animation_finished(anim_name: StringName):
	for animation in idle_animations:
		if !(animation == anim_name):
			continue
		animation_player.play(idle_animations[randi() % idle_animations.size()])
