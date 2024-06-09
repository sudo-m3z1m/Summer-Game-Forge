extends StateMachineState

@onready var game_manager = $"../../../../GameManager"
@onready var monitor_state = $MonitorState

func enter(object: Object, state_machine: StateMachine):
	super(object, state_machine)
	print_rich("[color=blue]Player Turn[/color]")
	monitor_state.enter(object, self)

func update(delta: float):
	super(delta)
	
	if Input.is_action_just_pressed("end_turn"):
		if state == get_node(start_state):
			try_transition("EnemyTurn")
	
	monitor_state.update(delta)

func exit():
	if monitor_state.last_to_monitor:
		monitor_state.animate_camera(false)

func try_transition(state: String):
	state_machine.transition_to(state)
