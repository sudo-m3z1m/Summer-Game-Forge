extends Node3D

@export var is_onecolumn: bool = true
@export var disks_in_column: int = 5
@export var offset: float = 0.15
@export var row_offset: float = 0.05

func _ready():
	child_entered_tree.connect(on_disk_entered)
	child_exiting_tree.connect(on_disk_exiting)
	for c in get_children():
		child_entered_tree.emit(c)

func on_disk_entered(disk):
	var tree_position = get_children().find(disk)
	var target_position = get_disk_position(tree_position)
	get_tree().create_tween().tween_property(disk, "position", target_position, .3)
	get_tree().create_tween().tween_property(disk, "rotation:y", PI, .3)

func get_disk_position(index: int):
	var tree_position = index
	var column = int(tree_position/disks_in_column)
	var target_position = Vector3()
	if not is_onecolumn:
		target_position.z = -column * row_offset
	target_position.x = offset * ((disks_in_column * column) - tree_position)
	return target_position

func on_disk_exiting(disk):
	await get_tree().process_frame
	for c in get_children():
		child_entered_tree.emit(c)
