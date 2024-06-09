extends StateMachineState

@onready var game_manager = $"../../../../GameManager"

func enter(object: Object, state_machine: StateMachine):
	super(object, state_machine)
	print_rich("[color=blue]Player Turn[/color]")

func update(delta: float):
	super(delta)
	
	if Input.is_action_just_pressed("end_turn"):
		if state == get_node(start_state):
			try_transition("EnemyTurn")

func exit():
	pass

func try_transition(state: String):
	state_machine.transition_to(state)
