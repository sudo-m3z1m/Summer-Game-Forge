class_name EnemyHealthComponent extends HealthComponent

func _ready() -> void:
	health_end.connect(die)

func die() -> void:
	queue_free()
