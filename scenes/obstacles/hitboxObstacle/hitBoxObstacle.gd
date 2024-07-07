extends Area2D



func _ready():
	connect("body_entered", onBodyEntered)


func onBodyEntered(body):
	if body is Player:
		var player = body as Player
		player.died.emit()
