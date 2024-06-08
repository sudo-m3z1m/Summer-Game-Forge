class_name Table extends Node3D

@onready var player_marker = $PlayerMarker3D
@onready var enemies_markers_container = $EnemiesMarkers3D
@onready var enemies_markers: Array = enemies_markers_container.get_children()
@onready var units_container = $Units

func _ready():
	pass

func spawn_unit(unit: Unit, marker: Marker3D):
	units_container.add_child(unit)
	unit.position = marker.global_position

func despawn_unit(unit: Unit):
	unit.queue_free()

func clear_units():
	for unit in units_container.get_children():
		unit.queue_free()

func get_enemy_marker():
	for marker in enemies_markers:
		if not marker.get_child_count():
			return marker
	return null