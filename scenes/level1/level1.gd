extends Node2D

@onready var player := $Player/Player
@onready var floorGame := $Floor
@onready var floor_width: ColorRect = $Floor/FloorWidth
@onready var camera := $Player/Camera

var initPointPlayer: int = 960
var offSetCamera = 500
var offSetFloorPosition = 200

func _ready():
	camera.limit_bottom = get_viewport().size.y


func _physics_process(delta):
	# update floor position
	# when the player reaches the middle of the floor, it will be updated
	print(player.position.x)
	print(floorGame.position.x + floor_width.size.x/2)
	if player.global_position.x >= floorGame.global_position.x + floor_width.size.x:
		floorGame.position.x = player.global_position.x - offSetFloorPosition
	
	#update the camera to follow the player horizontally
	camera.global_position.x = player.global_position.x + offSetCamera
