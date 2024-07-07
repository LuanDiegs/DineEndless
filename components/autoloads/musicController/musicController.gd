extends Node

var mainMusic = preload("res://assets/music/awesomeness.wav")

@onready var musicPlayer = $Music as AudioStreamPlayer

func _ready():
	pass # Replace with function body.

func playMusic():
	if !musicPlayer.playing:
		mainMusic.loop_begin
		musicPlayer.stream = mainMusic
		musicPlayer.play()
	pass
