extends State

@export var camera: Camera3D
@export var monitor: Monitor
@onready var angle_node = $AngleNode3D

var default_camera_rotation: Vector3
var default_camera_fov: float

var current_mouse_position: Vector2
var collision_point
var collider

func enter(object: Object, state_machine: StateMachine):
	super(object, state_machine)
	
	default_camera_rotation = camera.rotation
	default_camera_fov = camera.fov
	animate_camera()
	
	locked = true
	await get_tree().create_timer(0.5).timeout
	locked = false

var locked: bool = true
func update(delta: float) -> void:
	if locked: return
	if Input.is_action_pressed("left_mouse") or Input.is_action_pressed("Quit") or Input.is_action_pressed("ui_cancel"):
		try_transition("ChoosingAction")
	#if !(Input.is_action_pressed("Quit")):
		#return
	#try_transition("ChoosingAction")

func exit() -> void:
	animate_camera(false)

func try_transition(state: String) -> void:
	state_machine.transition_to(state)
	
@onready var main = owner
func animate_camera(to_monitor: bool = true) -> void:
	var tween: Tween = create_tween()
	#var audio_tween = create_tween()
	#audio_tween.set_parallel(false)
	tween.set_parallel(true)
	if to_monitor:
		angle_node.global_position = camera.global_position
		angle_node.look_at(monitor.camera_marker.global_position)
		tween.tween_property(camera, "rotation", angle_node.rotation, .3).set_ease(Tween.EASE_OUT).set_trans(Tween.TRANS_CUBIC)
		tween.tween_property(camera, "fov", 20, 0.3).set_ease(Tween.EASE_IN).set_trans(Tween.TRANS_CUBIC)
		tween.tween_property(main.monitor_player, "max_distance", 10.0, 0.3).set_ease(Tween.EASE_OUT).set_trans(Tween.TRANS_CUBIC)
	else:
		tween.tween_property(camera, "fov", default_camera_fov, 0.2).set_ease(Tween.EASE_OUT).set_trans(Tween.TRANS_CUBIC)
		tween.tween_property(main.monitor_player, "max_distance", 4.0, 0.2).set_ease(Tween.EASE_IN).set_trans(Tween.TRANS_CUBIC)
		tween.tween_property(camera, "rotation", default_camera_rotation, 0.2).set_ease(Tween.EASE_IN).set_trans(Tween.TRANS_CUBIC)
