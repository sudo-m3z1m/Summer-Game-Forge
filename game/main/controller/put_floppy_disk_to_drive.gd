extends State

@export var hand_marker: Marker3D
@export var drive_marker: Marker3D
@export var monitor: Monitor
@export var put_time: float = 1.0
@onready var monitor_state = $"../MonitorState"

func enter(object: Object, state_machine: StateMachine):
	super(object, state_machine)
	if monitor_state.last_to_monitor:
		await monitor_state.animate_camera(false)
	
	var disk = hand_marker.get_child(0)
	
	monitor.animation_player.play("open_drive")
	await monitor.animation_player.animation_finished
	
	disk.reparent(self)
	get_tree().create_tween().tween_property(disk, "global_position", drive_marker.global_position, put_time).set_trans(Tween.TRANS_CUBIC)
	get_tree().create_tween().tween_property(disk, "global_rotation", drive_marker.global_rotation + Vector3(0, PI/2, 0), put_time).set_trans(Tween.TRANS_CUBIC)
	
	await get_tree().create_timer(put_time).timeout
	monitor.animation_player.play("close_drive")
	await monitor.animation_player.animation_finished
	disk.queue_free()
	
	try_transition("ChoosingAction")

func update(delta: float):
	super(delta)

func exit():
	pass

func try_transition(state: String):
	state_machine.transition_to(state)
