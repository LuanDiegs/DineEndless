extends CharacterBody2D
class_name Player

const SPEED = 400.0
const JUMP_VELOCITY = -600.0

@onready var fsm = $FiniteStateMachine as FiniteStateMachine
@onready var hitbox = $Hitbox
@onready var score: Score = $"../../UI/Score"

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var speedMultiplier: float = 0

# Save
var saveComponent: SaveGame = SaveGame.new()
var playerData: PlayerData

signal died


func _ready():
	saveComponent.verifySaveFile()
	playerData = saveComponent.loadSave()
	score.setHighScore(playerData.getHighScore())


func _physics_process(delta):
	speedMultiplier = 50 * (score.score / 100)

	# Falling
	if not is_on_floor():
		velocity.y += gravity * delta
		
	move_and_slide()
