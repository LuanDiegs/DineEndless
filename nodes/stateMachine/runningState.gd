extends State
class_name RunningState

@export var player: Player


func enterState():
	super.enterState()
	owner.set_physics_process(true)

func transition():
	player.velocity.x = player.SPEED
	if Input.is_action_pressed("pular") and player.is_on_floor():
		get_parent().changeState("JumpState")
	if Input.is_action_pressed("ui_down"):
		get_parent().changeState("DieState")
