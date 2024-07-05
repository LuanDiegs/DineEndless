extends State
class_name JumpState

@export var player: Player


func enterState():
	super.enterState()


func transition():
	if player.is_on_floor():
		player.velocity.y = player.JUMP_VELOCITY
		get_parent().changeState("RunningState")
	
	if Input.is_action_just_pressed("ui_down"):
		get_parent().changeState("RunningState")
