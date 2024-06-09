extends StateMachineState

@onready var game_manager = $"../../../GameManager"

func enter(object: Object, state_machine: StateMachine):
	super(object, state_machine)
	game_manager.load_level()
	
	locked = true
	await get_tree().create_timer(0.5).timeout
	locked = false
	#TODO подрубить переключение когда все противники уничтожены (или игрок)

var locked: bool = true
func update(delta: float):
	super(delta)
	if locked: return

func exit():
	game_manager.unload_level()

func try_transition(state: String):
	state_machine.transition_to(state)