extends State
class_name RunningState

@export var player: Player


func enterState():
	super.enterState()
	owner.set_physics_process(true)

func transition(delta):
	player.velocity.x = player.SPEED

	if Input.is_action_pressed("pular") and player.is_on_floor():
		get_parent().changeState("JumpState")
		
	# if pressed the player will jump more
	if !Input.is_action_pressed("pular") and player.velocity.y < 0:
		player.velocity.y += lerp(player.velocity.y, 0.0, 1.06)
	
	# only debug
	if Input.is_action_pressed("ui_down"):
		get_parent().changeState("DieState")
