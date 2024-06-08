extends StateMachineState

func enter(object: Object, state_machine: StateMachine):
	super(object, state_machine)

func update(delta: float):
	super(delta)

func exit():
	pass

func try_transition(state: String):
	state_machine.transition_to(state)
