class_name Deck extends Node

@export var monitor: Monitor

var items: Array[Item] = []
var disks: Array[FloppyDisk] = []
@onready var disks_container = $DisksContainer

func _ready():
	disks.append_array(disks_container.get_children())

func append_item(item: Item):
	items.append(item)
	#TODO спавн флопи дисков под контейнер

func append_disk(disk: FloppyDisk):
	disks.append(disk)
	if disk.get_parent():
		disk.reparent(disks_container)
	else:
		disks_container.add_child(disk)

func select_disk(index: int):
	disks[index].animate_selection(true)
	monitor.display_item_description(disks[index].item)

func deselect_disk(index: int):
	disks[index].animate_selection(false)
	monitor.display_reviews()

func get_disk_index(disk: FloppyDisk):
	return disks.find(disk)

func get_selected():
	for disk in disks_container.get_children():
		if disk.is_selected:
			return disk
