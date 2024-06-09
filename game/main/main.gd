extends Node

@export var background_music_stream: AudioStream

@onready var fog_animation_player = %FogAnimationPlayer
@onready var projector_animation_player = $World/Projector/AnimationPlayer

@onready var monitor = $World/PC
var monitor_player: AudioStreamPlayer3D
var ambient_player: AudioStreamPlayer3D

func _ready():
	SoundManager.set_looped(SoundManager.play(background_music_stream))
	fog_animation_player.play("fog_wrap")
	
	projector_animation_player.animation_set_next("Cylinder_002Action", "Cylinder_003Action")
	projector_animation_player.animation_set_next("Cylinder_003Action", "Cylinder_002Action")
	projector_animation_player.play("Cylinder_002Action")
	
	monitor_player = SoundManager.play3d(preload("res://assets/audios/PC.mp3"), "Sfx")
	monitor_player.global_position = monitor.global_position
	SoundManager.set_looped(monitor_player)
	monitor_player.max_distance = 5.0
	
	ambient_player = SoundManager.set_looped(SoundManager.play3d(preload("res://assets/audios/OST.mp3"), "Music"))
