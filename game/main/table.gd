class_name Table extends Node3D
@onready var animation_player = $AnimationPlayer

@onready var player_marker = $PlayerMarker3D
@onready var enemies_markers_container = $EnemiesMarkers3D
@onready var enemies_markers: Array = enemies_markers_container.get_children()
@onready var units_container = $Units

func _ready():
	print(enemies_markers)

func spawn_unit(unit: Unit, marker: Marker3D):
	units_container.add_child(unit)
	unit.position = marker.global_position
	unit.marker = marker

func despawn_unit(unit: Unit):
	unit.queue_free()

func despawn_units():
	for unit in units_container.get_children():
		unit.queue_free()

func get_enemy_marker():
	for marker in enemies_markers:
		var not_use = true
		for unit in units_container.get_children():
			if unit.marker == marker:
				not_use = false
		if not_use:
			return marker
	return null

func get_enemies():
	return Array(units_container.get_children()).filter(func(unit):
		return unit is Enemy
	)

func get_character():
	for unit in units_container.get_children():
		if unit is Unit and not unit is Enemy:
			return unit
