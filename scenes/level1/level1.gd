extends Node2D

@onready var player = $Player/Player as Player
@onready var floorGame := $Floor
@onready var floor_width: ColorRect = $Floor/FloorWidth
@onready var camera := $Player/Camera
@onready var score = $UI/Score

var initPointPlayer: int = 960
var offSetCamera = 500
var offSetFloorPosition = 200

var positionPreviousObstacle: int
var dificulty: int = 1

func _ready():
	#Play music
	MusicController.playMusic()
	
	camera.limit_bottom = get_viewport().size.y
	spawnObstacle()


func _physics_process(delta):
	# update floor position
	# when the player reaches the middle of the floor, it will be updated
	if player.global_position.x >= floorGame.global_position.x + floor_width.size.x:
		floorGame.position.x = player.global_position.x - offSetFloorPosition
	
	# update the camera to follow the player horizontally
	# divide by 60 to the player don't go forward the camera
	# but i don't know why this works :P
	camera.global_position.x = player.global_position.x + offSetCamera + player.speedMultiplier / 60
	
	if(score.score > 500*dificulty and dificulty <= 5):
		dificulty += 1
		print(dificulty)
	
	if(player.global_position.x >= positionPreviousObstacle + randi_range(1000, 1500)/dificulty):
		spawnObstacle()
	
func spawnObstacle():
	var spawnTwoObstacles = randi_range(0,1);
	var quantityToSpawn = 2 if spawnTwoObstacles == 1 else 1
	
	for i in quantityToSpawn:
		var obstacle = preload("res://scenes/obstacles/obstacle.tscn").instantiate() as Node2D
		obstacle.global_position.x = player.global_position.x + randi_range(1000, 2000)
		obstacle.global_position.y = floorGame.global_position.y + 2
		positionPreviousObstacle = obstacle.global_position.x
		add_child(obstacle)
