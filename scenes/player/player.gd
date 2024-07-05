extends CharacterBody2D
class_name Player

const SPEED = 300.0
const JUMP_VELOCITY = -400.0

@onready var fsm = $FiniteStateMachine as FiniteStateMachine
@onready var hitbox = $Hitbox

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var isDead: bool = false

func _physics_process(delta):
	if isDead:
		velocity.y += gravity * delta
		hitbox.disabled = true
		
	if not is_on_floor():
		velocity.y += gravity * delta
	
	move_and_slide()
