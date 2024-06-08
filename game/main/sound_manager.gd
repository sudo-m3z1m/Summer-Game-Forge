extends Node

func _get_stream_player(bus: String = "Master"):
	var player = AudioStreamPlayer.new()
	player.bus = bus
	player.finished.connect(player.queue_free)
	add_child(player)
	return player

func _get_stream_player3d(bus: String = "Master"):
	var player = AudioStreamPlayer3D.new()
	player.bus = bus
	player.finished.connect(player.queue_free)
	add_child(player)
	return player

func play(stream: AudioStream, bus: String = "Master"):
	var player = _get_stream_player(bus)
	player.stream = stream
	player.play()
	return player

func play3d(stream: AudioStream, bus: String = "Master"):
	var player = _get_stream_player3d(bus)
	player.stream = stream
	player.play()
	return player

func set_looped(player):
	player.finished.disconnect(player.queue_free)
	player.finished.connect(player.play)
