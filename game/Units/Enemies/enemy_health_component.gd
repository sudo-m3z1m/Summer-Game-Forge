class_name EnemyHealthComponent extends HealthComponent

func _ready() -> void:
	health_end.connect(die)

func damage(attack: Attack) -> void:
	super(attack)

func die() -> void:
	target.queue_free()
