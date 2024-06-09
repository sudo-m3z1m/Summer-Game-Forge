class_name CharacterHealthComponent extends HealthComponent

#func _ready() -> void:
	#health_end.connect(die)

func damage(attack: Attack) -> void:
	var attack_damage: int = attack.damage
	health -= attack_damage
	calculate_armor(attack_damage)
	if health > 0:
		animate_damage_take()
		return

	die()

func calculate_armor(damage: int) -> void:
	var armor_damage: int
	var game_manager: GameManager = get_tree().current_scene.get_node("GameManager")
	var items: Array[Item] = game_manager.inventory_items
	for item in items:
		armor_damage = damage
		if item.damage(armor_damage):
			game_manager.remove_item(item)

func die() -> void:
	get_tree().quit() #TODO HUD and other staff
