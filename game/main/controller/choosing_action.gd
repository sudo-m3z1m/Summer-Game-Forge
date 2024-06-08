extends State

@export var deck: Deck

func enter(object: Object, state_machine: StateMachine):
	super(object, state_machine)

var last_update_collider = null
func update(delta: float):
	super(delta)
	
	var mouse_position = get_viewport().get_mouse_position()
	var point = state_machine.state_machine.get_world_point(mouse_position)
	var collider = point.get("collider")
	
	if collider is FloppyDisk:
		var index = deck.get_disk_index(collider)
		deck.select_disk(index)
	if last_update_collider != collider and last_update_collider is FloppyDisk:
		var index = deck.get_disk_index(last_update_collider)
		deck.deselect_disk(index)
	
	last_update_collider = collider
	
	if Input.is_action_just_pressed("left_mouse"):
		if collider is FloppyDisk:
			try_transition("GrabFloppyDisk")

func exit():
	pass

func try_transition(state: String):
	state_machine.transition_to(state)
