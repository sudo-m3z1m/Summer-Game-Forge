extends Node

var items: Array[Item] = []
var disks: Array[FloppyDisk] = []

func append_item(item: Item):
	items.append(item)
	#TODO спавн флопи дисков под контейнер

func select_disk(index: int):
	disks[index].animate_selection(true)

func deselect_disk(index: int):
	disks[index].animate_selection(true)
