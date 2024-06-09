extends StateMachineState

@onready var game_manager = $"../../../../GameManager"

var enemies: Array[Node]

func enter(object: Object, state_machine: StateMachine):
	super(object, state_machine)
	print_rich("[color=red]Enemy Turn[/color]")
	
	#TODO с эфейтом всё таки ждать атаки всех противников поочереди
	await game_manager._enemy_turn()
	enemies = game_manager.table.get_enemies()
	try_transition("Turn")

func update(delta: float):
	super(delta)

func exit():
	for enemy in enemies:
		enemy.play_idle_animation()

func try_transition(state: String):
	state_machine.transition_to(state)
