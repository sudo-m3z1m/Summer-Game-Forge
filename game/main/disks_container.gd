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
	await get_tree().process_frame
	for c in get_children():
		child_entered_tree.emit(c)
		
const FLOPPY_DISK = preload("res://game/Disks/floppy_disk.tscn")
func _process(delta):
	if Input.is_action_just_pressed("ui_up"):
		add_child(FLOPPY_DISK.instantiate())
	elif Input.is_action_just_pressed("ui_down"):
		get_child(0).queue_free()
