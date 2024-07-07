extends State
class_name RunningState

@export var player: Player

func enterState():
	super.enterState()

func transition(delta):
	player.velocity.x = player.SPEED + player.speedMultiplier

	if Input.is_action_pressed("pular") and player.is_on_floor():
		get_parent().changeState("JumpState")
		
	# if pressed the player will jump more
	if !Input.is_action_pressed("pular") and player.velocity.y < 0:
		player.velocity.y += lerp(player.velocity.y, 0.0, 1.06)
