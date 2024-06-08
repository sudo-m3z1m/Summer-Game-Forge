extends Node3D

@export var is_onecolumn: bool = true
@export var disks_in_column: int = 5
@export var offset: float = 0.15

func _ready():
	child_entered_tree.connect(on_disk_entered)
	child_exiting_tree.connect(on_disk_exiting)
	for c in get_children():
		child_entered_tree.emit(c)

func on_disk_entered(disk):
	var tree_position = get_children().find(disk)
	var column = int(tree_position/disks_in_column)
	if not is_onecolumn:
		disk.position.z = -column * offset
	disk.position.x = offset * ((disks_in_column * column) - tree_position)

func on_disk_exiting(disk):
	pass
