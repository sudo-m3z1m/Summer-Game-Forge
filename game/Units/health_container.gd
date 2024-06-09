extends Node3D

var health: int = 0:
	set(value):
		var delta = value - health
		health = value
		const UNIT_HEALTH = preload("res://game/Units/unit_health.tscn")
		for i in delta:
			if delta > 0:
				add_child(UNIT_HEALTH.instantiate())
			if delta < 0:
				get_child(0).queue_free()
			on_disk_exiting(null)

@export var offset: float = 0.15

func _ready():
	child_entered_tree.connect(on_disk_entered)
	child_exiting_tree.connect(on_disk_exiting)
	for c in get_children():
		child_entered_tree.emit(c)

func on_disk_entered(disk):
	var tree_position = get_children().find(disk)
	var target_position = get_disk_position(tree_position)
	get_tree().create_tween().tween_property(disk, "position", target_position, .3)

func get_disk_position(index: int):
	var tree_position = index
	var target_position = Vector3()
	target_position.x = offset * tree_position - ( get_child_count()*offset / 2)
	return target_position

func on_disk_exiting(disk):
	await get_tree().process_frame
	for c in get_children():
		child_entered_tree.emit(c)
