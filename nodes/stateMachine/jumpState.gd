extends State
class_name JumpState

@export var player: Player

var jumpPressed: bool

func enterState():
	super.enterState()


func transition(delta):	
	if player.is_on_floor():
		player.velocity.y = player.JUMP_VELOCITY
		get_parent().changeState("RunningState")
