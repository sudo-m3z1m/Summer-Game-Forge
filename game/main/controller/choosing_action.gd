extends State

func enter(object: Object, state_machine: StateMachine):
	super(object, state_machine)

func update(delta: float):
	super(delta)
	var mouse_position = get_viewport().get_mouse_position()
	state_machine.state_machine.get_world_point(mouse_position)

func exit():
	pass

func try_transition(state: String):
	state_machine.transition_to(state)
