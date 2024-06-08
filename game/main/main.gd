extends Node

@export var background_music_stream: AudioStream

@onready var sound_manager = $SoundManager

func _ready():
	sound_manager.set_looped(sound_manager.play(background_music_stream))
