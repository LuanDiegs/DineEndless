extends Node2D

@onready var player = $Player
@onready var floorGame = $Floor
@onready var camera_2d = $Player/Camera2D

func _ready():
	camera_2d.limit_bottom = get_viewport().size.y
	pass # Replace with function body.


func _process(delta):
	# update floor position
	if camera_2d.global_position.x - floorGame.global_position.x > get_viewport().size.x * 1.5:
		floorGame.global_position.x += get_viewport().size.x
