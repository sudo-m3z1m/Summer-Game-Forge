extends State

@export var hand_marker: Marker3D
@export var deck: Deck

@export var put_time: float = .5

func enter(object: Object, state_machine: StateMachine):
	super(object, state_machine)
	var disk = hand_marker.get_child(0)
	get_tree().create_tween().tween_property(disk, "global_position", deck.disks_container.global_position, put_time)
	get_tree().create_tween().tween_property(disk, "global_rotation", Vector3(), put_time)
	get_tree().create_tween().tween_property(disk.get_child(0), "rotation:y", 0, put_time)
	await get_tree().create_timer(put_time).timeout
	deck.append_disk(disk)
	deck.disks_container.on_disk_exiting(null)
	try_transition("ChoosingAction")

func update(delta: float):
	super(delta)

func exit():
	pass

func try_transition(state: String):
	state_machine.transition_to(state)
