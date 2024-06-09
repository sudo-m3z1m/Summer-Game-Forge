extends StateMachineState

@onready var game_manager = $"../../../GameManager"

func enter(object: Object, state_machine: StateMachine):
	super(object, state_machine)
	#TODO выдвигать ящик стола и забирать три дискеты

func update(delta: float):
	super(delta)
	
	var mouse_position = get_viewport().get_mouse_position()
	var point = state_machine.get_world_point(mouse_position)
	var collider = point.get("collider")
	
	if collider and collider.name == "StorageArea3D":
		#TODO тут давать в руку рандомную дискету и ложить в колоду
		pass

func exit():
	pass

func try_transition(state: String):
	state_machine.transition_to(state)

