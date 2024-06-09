extends Unit

class_name Enemy

@export var attack_resource: Attack
@export var idle_animations: Array[String]

@onready var angle_helper = $Node/AngleHelper

func attack(target: Node3D) -> void:
	angle_helper.look_at(to_local(target.global_position))
	await get_tree().create_tween().tween_property(self, "rotation:y", angle_helper.rotation.y, .4).set_trans(Tween.TRANS_CUBIC).finished
	animation_player.play("Attack")
	await animation_player.animation_finished
	
	var target_health_component: HealthComponent = target.get_node("HealthComponent")
	target_health_component.damage(attack_resource)

func play_idle_animation() -> void:
	animation_player.play(idle_animations[randi() % idle_animations.size()])

func animation_finished(anim_name: StringName):
	for animation in idle_animations:
		if !(animation == anim_name):
			continue
		play_idle_animation()
