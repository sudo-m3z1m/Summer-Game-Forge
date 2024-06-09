class_name CharacterHealthComponent extends HealthComponent

#func _ready() -> void:
	#health_end.connect(die)

func damage(attack: Attack) -> void:
	var attack_damage: int = attack.damage
	health -= attack_damage
	calculate_armor(attack_damage)
	
	if health > 0:
		return
	
	die()

func calculate_armor(damage: int) -> void:
	var armor_damage = damage #/ 2
	var items: Array[Item] = target.game_manager.inventory_items
	for item in items:
		item.durability -= armor_damage
		if item.durability > 0:
			continue
		item.break_item()

func die() -> void:
	get_tree().quit() #TODO HUD and other staff
