extends State

@export var hand_marker: Marker3D
@export var deck: Deck
@export var monitor: Monitor

@export var grab_time: float = .5

func enter(object: Object, state_machine: StateMachine):
	super(object, state_machine)
	locked = true
	
	var disk = deck.get_selected()
	#deck.deselect_disk(deck.get_disk_index(disk))
	get_tree().create_tween().tween_property(disk, "global_position", hand_marker.global_position, grab_time).set_ease(Tween.EASE_OUT)
	get_tree().create_tween().tween_property(disk, "global_rotation", hand_marker.global_rotation, grab_time).set_ease(Tween.EASE_OUT)
	#disk.look_at(disk.to_local(get_viewport().get_camera_3d().global_position))
	#disk.get_child(0).rotation.y = PI/2
	
	monitor.display_item_description(disk.item)
	
	await get_tree().create_timer(grab_time).timeout
	disk.reparent(hand_marker)
	locked = false
	#hand_marker.global_position

var locked: bool = true
func update(delta: float):
	super(delta)
	if locked: return
	
	var mouse_position = get_viewport().get_mouse_position()
	var point = state_machine.state_machine.get_world_point(mouse_position, true)
	var collider = point.get("collider")
	
	if collider and collider.get_parent() is Deck:
		if Input.is_action_just_pressed("left_mouse"):
			try_transition("PutFloppyDisk")

func exit():
	pass

func try_transition(state: String):
	state_machine.transition_to(state)
