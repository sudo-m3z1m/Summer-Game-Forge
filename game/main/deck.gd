class_name Deck extends Node

var items: Array[Item] = []
var disks: Array[FloppyDisk] = []
@onready var disks_container = $DisksContainer

func _ready():
	disks.append_array(disks_container.get_children())

func append_item(item: Item):
	items.append(item)
	#TODO спавн флопи дисков под контейнер

func select_disk(index: int):
	disks[index].animate_selection(true)

func deselect_disk(index: int):
	disks[index].animate_selection(false)

func get_disk_index(disk: FloppyDisk):
	return disks.find(disk)

func get_selected():
	for disk in disks_container:
		if disk.is_selected:
			return disk
