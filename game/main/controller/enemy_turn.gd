extends StateMachineState

@onready var game_manager = $"../../../GameManager"

func enter(object: Object, state_machine: StateMachine):
	super(object, state_machine)
	await game_manager._enemy_turn()

func update(delta: float):
	super(delta)

func exit():
	pass

func try_transition(state: String):
	state_machine.transition_to(state)
