class_name GameManager extends Node

@export var table: Table
@export var inventory_hud: InventoryHud

@onready var turn: StateMachineState = $"../World/Controller/Match/Turn"

signal enemy_turn
signal player_turn
signal player_grab_disk

var inventory_items: Array[Item]

var current_level: int = 0

enum Enemies {
	Mage,
	Archer,
	Swordsman,
}

var enemies_packeds: Dictionary = {
	Enemies.Mage: preload("res://game/Units/Enemies/archer.tscn"),
	Enemies.Archer: preload("res://game/Units/Enemies/mage.tscn"),
	Enemies.Swordsman: preload("res://game/Units/Enemies/swordsman.tscn"),
}

var levels_parameters: Dictionary = {
	0: {
		"enemies_count": 1,
		"enemies": [Enemies.Swordsman, Enemies.Archer],
		"level": preload("res://game/levels/level1.tscn")
	},
	1: {
		"enemies_count": 2,
		"enemies": [Enemies.Mage, Enemies.Archer],
		"level": preload("res://game/levels/level1.tscn")
	},
	2: {
		"enemies_count": 4,
		"enemies": [Enemies.Swordsman, Enemies.Archer, Enemies.Mage],
		"level": preload("res://game/levels/level1.tscn")
	}
}

func player_confirm_turn():
	pass

var table_level = null
func load_level():
	var table_level = levels_parameters[current_level]["level"].instantiate()
	table.add_child(table_level)
	for i in range(levels_parameters[current_level]["enemies_count"]):
		var marker = table.get_enemy_marker()
		var unit = get_enemy_unit()
		table.spawn_unit(unit, marker) 
	table.spawn_unit(preload("res://game/Units/character.tscn").instantiate(), table.player_marker)

func unload_level():
	if table_level:
		table_level.queue_free()
	table.despawn_units()

func _enemy_turn():
	var character = table.get_character()
	
	for unit in table.get_enemies():
		await unit.attack(character)

func get_enemy_unit():
	return enemies_packeds[levels_parameters[current_level]["enemies"].pick_random()].instantiate()

func remove_item(item: Item) -> void:
	inventory_hud.remove_item(item)

func update_inventory_items(items: Array[Item]) -> void:
	inventory_items = items
