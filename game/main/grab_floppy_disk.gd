extends State

@export var hand_marker: Marker3D
@export var deck: Deck
@export var monitor: Monitor

func enter(object: Object, state_machine: StateMachine):
	super(object, state_machine)
	var disk = deck.get_selected()
	disk.reparent(hand_marker)
	get_tree().create_tween().tween_property(disk, "global_position", hand_marker.global_position, 0.5)
	disk.look_at(disk.to_local(get_viewport().get_camera_3d().global_position))
	disk.get_child(0).rotation.y = 90
	monitor.display_item_description(disk.item)
	#hand_marker.global_position

func update(delta: float):
	super(delta)

func exit():
	pass

func try_transition(state: String):
	state_machine.transition_to(state)
