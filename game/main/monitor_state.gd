extends State

@export var camera: Camera3D
@export var monitor: Monitor

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

func update(delta: float) -> void:
	if !(Input.is_action_pressed("Quit")):
		return
	try_transition("ChoosingAction")

func exit() -> void:
	animate_camera(false)

func try_transition(state: String) -> void:
	state_machine.transition_to(state)

func animate_camera(to_monitor: bool = true) -> void:
	var tween: Tween = create_tween()
	tween.set_parallel(true)
	if to_monitor:
		camera.look_at(monitor.camera_marker.global_position)
		tween.tween_property(camera, "fov", 15, 0.2)
		return
	tween.tween_property(camera, "rotation", default_camera_rotation, 0.2)
	tween.tween_property(camera, "fov", default_camera_fov, 0.2)
