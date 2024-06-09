class_name Unit extends Node3D

@export var game_manager: GameManager

@onready var health_component: HealthComponent = $HealthComponent
@onready var model: Node3D = $Model
@onready var animation_player: AnimationPlayer = $AnimationPlayer
var marker: Marker3D
