extends Node

@export var background_music_stream: AudioStream

@onready var sound_manager = $SoundManager
@onready var fog_animation_player = %FogAnimationPlayer
@onready var projector_animation_player = $World/Projector/AnimationPlayer

func _ready():
	sound_manager.set_looped(sound_manager.play(background_music_stream))
	fog_animation_player.play("fog_wrap")
	
	projector_animation_player.animation_set_next("Cylinder_002Action", "Cylinder_003Action")
	projector_animation_player.animation_set_next("Cylinder_003Action", "Cylinder_002Action")
	projector_animation_player.play("Cylinder_002Action")
