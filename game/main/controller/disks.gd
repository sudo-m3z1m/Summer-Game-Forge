extends StateMachineState

@onready var game_manager = $"../../../GameManager"
@export var storage_marker: Marker3D
@export var hand_marker: Marker3D
@export var deck: Deck

@export var target_disks_count: int = 3
var current_disk: int = 0

func enter(object: Object, state_machine: StateMachine):
	super(object, state_machine)
	current_disk = 0
	
	locked = true
	await get_tree().create_timer(0.5).timeout
	locked = false
	#TODO выдвигать ящик стола и забирать три дискеты

## идейка может типа предметы нельзя будет заменить а враги будут бить по рандомным

var locked: bool = true
func update(delta: float):
	if locked: return
	super(delta)
	
	var mouse_position = get_viewport().get_mouse_position()
	var point = state_machine.get_world_point(mouse_position, true)
	var collider = point.get("collider")
	
	if Input.is_action_just_pressed("left_mouse"):
		if collider and collider.name == "StorageArea3D":
			#TODO тут давать в руку рандомную дискету и ложить в колоду
			locked = true
			current_disk += 1
			
			game_manager.table.animation_player.play("take_new_disk")
			await get_tree().create_timer(.5).timeout
			
			var disk = game_manager.get_floppy_disk()
			storage_marker.add_child(disk)
			var tween = get_tree().create_tween()
			tween.tween_property(disk, "global_position", hand_marker.global_position, .3).set_ease(Tween.EASE_IN).set_trans(Tween.TRANS_CUBIC)
			var target_pos_in_deck = deck.disks_container.to_global(deck.disks_container.get_disk_position(deck.disks_container.get_child_count()))
			await tween.tween_property(disk, "global_position", target_pos_in_deck, .3).set_ease(Tween.EASE_OUT).set_trans(Tween.TRANS_CUBIC).finished
			deck.append_disk(disk)
			locked = false
			
			if current_disk >= target_disks_count:
				try_transition("Match")

func exit():
	pass

func try_transition(state: String):
	state_machine.transition_to(state)

