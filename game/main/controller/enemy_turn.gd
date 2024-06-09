extends StateMachineState

@onready var game_manager = $"../../../../GameManager"
@export var battle_camera_marker: Marker3D
@export var turn_camera_marker: Marker3D

@export var to_time: float = 0.6
@export var from_time: float = 0.6

var enemies: Array[Node]

func enter(object: Object, state_machine: StateMachine):
	super(object, state_machine)
	print_rich("[color=red]Enemy Turn[/color]")
	
	var camera = get_viewport().get_camera_3d()
	get_tree().create_tween().tween_property(camera, "global_position", battle_camera_marker.global_position, to_time).set_ease(Tween.EASE_OUT).set_trans(Tween.TRANS_CUBIC)
	await get_tree().create_tween().tween_property(camera, "global_rotation", battle_camera_marker.global_rotation, to_time).set_ease(Tween.EASE_OUT).set_trans(Tween.TRANS_CUBIC).finished
	
	#TODO с эфейтом всё таки ждать атаки всех противников поочереди
	await game_manager._enemy_turn()
	enemies = game_manager.table.get_enemies()
	try_transition("Turn")

func update(delta: float):
	super(delta)

func exit():
	var camera = get_viewport().get_camera_3d()
	get_tree().create_tween().tween_property(camera, "global_position", turn_camera_marker.global_position, from_time).set_ease(Tween.EASE_OUT).set_trans(Tween.TRANS_CUBIC)
	get_tree().create_tween().tween_property(camera, "global_rotation", turn_camera_marker.global_rotation, from_time).set_ease(Tween.EASE_OUT).set_trans(Tween.TRANS_CUBIC).finished
	
	for enemy in enemies:
		enemy.play_idle_animation()

func try_transition(state: String):
	state_machine.transition_to(state)
