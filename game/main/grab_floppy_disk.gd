extends State

@export var hand_marker: Marker3D
@export var deck: Deck

func enter(object: Object, state_machine: StateMachine):
	super(object, state_machine)
	var disk = deck.get_selected()
	disk.reparent(hand_marker)
	get_tree().create_tween().tween_property(disk, "global_position", hand_marker.global_position, 0.5)
	get_tree().create_tween().tween_property(disk, "global_rotation", hand_marker.global_rotation, 0.5)
	hand_marker.global_position

func update(delta: float):
	super(delta)

func exit():
	pass

func try_transition(state: String):
	state_machine.transition_to(state)
