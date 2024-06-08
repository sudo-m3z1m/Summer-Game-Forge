extends Node

@export var background_music_stream: AudioStream

@onready var sound_manager = $SoundManager
@onready var fog_animation_player = %FogAnimationPlayer

func _ready():
	sound_manager.set_looped(sound_manager.play(background_music_stream))
	
	fog_animation_player.play("fog_wrap")
