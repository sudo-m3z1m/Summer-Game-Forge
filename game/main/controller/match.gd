extends StateMachineState

@onready var game_manager = $"../../../GameManager"

func enter(object: Object, state_machine: StateMachine):
	super(object, state_machine)
	game_manager.load_level()
	#TODO подрубить переключение когда все противники уничтожены (или игрок)

func update(delta: float):
	super(delta)

func exit():
	game_manager.unload_level()

func try_transition(state: String):
	state_machine.transition_to(state)
